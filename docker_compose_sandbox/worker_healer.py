import os
import sys
import time
import redis
import docker


from settings import *

print (docker.version)
REDIS_HOST = 'REDIS_HOST' in os.environ and os.environ['REDIS_HOST'] or '127.0.0.1'
REDIS_PORT = 'REDIS_PORT' in os.environ and os.environ['REDIS_PORT'] or 6379






r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT)
redis_ready = False
while not redis_ready:
    try:
        redis_ready = r.ping()
    except:
        print("waiting for redis")
        time.sleep(3)

print("redis alive")




client = docker.from_env()
dC = docker.DockerClient(base_url='unix://var/run/docker.sock', version="auto", timeout=60)



def create_worker(env, language, image ):
    # TODO catch ContainerError - requests.exceptions.ConnectionError
    container = make_container(env, language, image)
    container.start()
    return container


class ContainerException(Exception):
    """
    There was some problem generating or launching a docker container
    for the user
    """
    pass


class ImageException(Exception):
    """
    There was some problem reading image
    """
    pass


def make_container(env, language, image, command):
    return dC.containers.create(image, environment=env ,command = command,  labels= {'language': language })


def kill_all():
    for container in get_containers('language'):
        print ("Killing: ", container)
        container.kill()


def remove_all():
    for container in get_containers('language', all=True):
        print ("Removing: ", container)
        container.remove()

def get_dead_workers(self):
    workers = r.smembers(self.worker_set)
    dead = []
    for w in workers:
        if r.get(w):
            pass
        else:
            r.srem(self.worker_set,w)
            dead.append(w)
    return dead

def get_workers(self):
    pattern = '%s:worker:*' % (self.app_name)
    return r.keys(pattern)


def get_all_workers():
    pattern = '*:worker:*'
    return r.keys(pattern)


def get_containers(label='language', all=False):
    return dC.containers.list(all=all, filters={'label': label})

def heal():
    #kill_all()
    #remove_all()
    #worker_containers = client.containers.list(filters={'label':'language'})

    # for container in worker_containers:
    #     print("Init Queue:", container.labels['language'])
    #     for i in range(number):
    #         create_worker(
    #             {'PL': cola.app_name, 'REDIS_HOST': os.environ['REDIS_HOST'], 'REDIS_PORT': os.environ['REDIS_PORT']},
    #             language=cola.app_name)
    #         print(cola.app_name,
    #               {'PL': cola.app_name, 'REDIS_HOST': os.environ['REDIS_HOST'], 'REDIS_PORT': os.environ['REDIS_PORT']})
    #     time.sleep(4)

    while True:
        ## Time between checks
        time.sleep(2)
        current_containers = client.containers.list(filters={'label':'language'})
        print(get_all_workers())
        workers = [w.decode("utf-8").split(':worker:') for w in get_all_workers()]
        print(workers)
        for container in current_containers:
            if container.short_id not in [w_id for w_lang, w_id in workers]:
                container.restart()
                print("Restaring:", container.short_id)
                time.sleep(4)


if __name__ == "__main__":
    heal()



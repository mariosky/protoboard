__author__ = 'mariosky'
import redis
import os

import ast


HOST = 'REDIS_HOST' in  os.environ and  os.environ['REDIS_HOST'] or 'redis'
PORT = 'REDIS_PORT' in  os.environ and  os.environ['REDIS_PORT'] or '6379'

r = redis.StrictRedis(host=HOST, port=PORT, decode_responses=True)


class Task:
    def __init__(self, **kwargs):
        self.id = kwargs['id']
        self.method =  kwargs.get('method', None)
        self.params = kwargs.get('params', {})
        self.state = kwargs.get('state', 'created')
        self.expire = kwargs.get('expire', None)
        self.result = None
        self.__dict__.update(kwargs)

    def enqueue(self, app_name):
        pipe = r.pipeline()
        if pipe.rpush('%s:task_queue' % app_name, self.id):
            self.state = 'submitted'
            pipe.set(self.id, self.__dict__)
            pipe.execute()
            return True
        else:
            return False

    def put_result(self, worker):
        pipe = r.pipeline()
        if pipe.zrem('%s:pending_set' % worker.cola.app_name, '%s:%s' % (worker.id, self.id)):
            self.state = 'completed'
            pipe.set(self.id, self.__dict__)
            pipe.sadd('%s:result_set' % worker.cola.app_name, self.id)
            pipe.execute()
            return True
        else:
            return None

    def get_result(self, app_name, as_dict = False):
        if r.sismember('%s:result_set' % app_name, self.id):
            result = r.get(self.id)
            print(result)

            print(type(result))
            _r = bytearray(result, 'utf')
            print(type(_r))

            _dict = ast.literal_eval(result)
            self.__dict__.update(_dict)
            if as_dict:
                return self.__dict__
            else:
                return self
        else:
            return None

    def __repr__(self):
        return self.id +" method:"+ str(self.method) +", params:" + str(self.params)

    def as_dict(self):
        return self.__dict__


class Cola:
    def __init__(self, name):
        self.app_name = name
        self.task_counter = self.app_name+':task_counter'
        self.pending_set = self.app_name+':pending_set'
        self.task_queue = self.app_name+':task_queue'
        self.result_set = self.app_name+':result_set'
        self.worker_set = self.app_name+':worker_set'

    def initialize(self):
        r.flushall()
        r.setnx(self.task_counter,0)

    def enqueue(self, **kwargs):
        if kwargs['id'] is None:
            kwargs['id'] = "%s:task:%s" % (self.app_name, r.incr(self.task_counter))
        t = Task(**kwargs)
        t.enqueue(self.app_name)
        return kwargs['id']

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

    @staticmethod
    def get_all_workers():
        pattern = '*:worker:*'
        print(pattern)

        return r.keys(pattern)

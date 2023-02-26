import os
import importlib

from redis_cola import Cola, Worker

lang = os.environ['PL']
server = Cola(lang)


#Only the send the short uuid not all the HOSTNAME
worker = Worker(os.environ['HOSTNAME'][:10], server)


# Send a heartbeat after created
worker.send_heartbeat()


tester_module =  'tester.test_%s' % lang
tester = importlib.import_module(tester_module)

while True:
    t = worker.pull_task()

    if (t):
        print (t)
        code = t.params['code']
        test = t.params['test']
        worker.send_heartbeat() #About to start working
        t.result = tester.run_test(code,test)
        print (t.result)
        t.put_result(worker)
    else:
        pass
    print("sending heartbeat")
    worker.send_heartbeat()




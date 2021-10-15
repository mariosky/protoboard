# -*- coding: utf-8 -*-
__author__ = 'mariosky'

import json
import os
import time

print os.environ['REDIS_HOST']

from redis_cola import Cola, Task

server = Cola("perl6")

code = """
    sub add($a, $b) {
        say "Hi";
        return $a+$b;
    }
    """

test = """
# .... tests
is add(6,1),          9, 'Suma dos enteros';
is add(6,-1),         2, 'Suma dos enteros error';
"""


def put():
    task = {"id": None, "method": "exec", "params": {"code": code, "test": test}}
    print task
    task_id = server.enqueue(**task)
    return task_id


def get(t_id):
    t = Task(id=t_id)
    t.get_result('perl6')
    if t.result:
        return t.result
        #return json.loads( t.result[0])
    else:
        return "Snif"


tid = put()
print tid
time.sleep(2)
print get(tid)
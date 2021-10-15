# -*- coding: utf-8 -*-
__author__ = 'mariosky'

import json
import os
import time


from redis_cola import Cola, Task

server = Cola("python")

code = """
def suma(a,b):
    print a,b
    return a+b
    """

test = '''
class TestExcercise(unittest.TestCase):
    def test_Action(self):
        """Debes sumar mal"""
        self.assertEqual(suma( 1, 3), 4)
    def test_Action2(self):
        """Debes sumar bien"""
        self.assertEqual(suma( 1, 3), 4)'''

def put():
    task = {"id": None, "method": "exec", "params": {"code": code, "test": test}}
    print task
    task_id = server.enqueue(**task)
    return task_id


def get(t_id,lang):
    t = Task(id=t_id)
    t.get_result(lang)
    if t.result:
        return t.result
        #return json.loads( t.result[0])
    else:
        return "Snif"


tid = put()
print tid
time.sleep(4)
print get(tid,'python')


server = Cola("perl6")

code = """
    sub add($a, $b) {
        say "Hi";
        return $a+$b;
    }
"""

test = """
# .... tests
is add(6,1),          7, 'Suma dos enteros';
is add(6,1),          5, 'Suma dos enteros error';
"""

tid = put()
print tid
time.sleep(6)
print get(tid,'perl6')




server = Cola("go")

code = r"""
    package math

    func Average(xs []float64) float64 {
      total := float64(0)
      for _, x := range xs {
        total += x
      }
      return total / float64(len(xs))
    }
    """

test = r"""
    package math


    import "testing"

    func TestAverage(t *testing.T) {
      var v float64
      v = Average([]float64{1,2})
      if v != 1.5 {
        t.Error("Expected 1.5, got ", v)
      }
    }

    func TestAverage2(t *testing.T) {
      var v float64
      v = Average([]float64{1,5})
      if v != 3 {
        t.Error("Expected 3, got ", v)
      }
    }

"""

tid = put()
print tid
time.sleep(6)
print get(tid,'go')



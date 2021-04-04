# -*- coding: utf-8 -*-
__author__ = 'mariosky'

import os
import time


from redis_cola import Cola, Task


server = Cola("java")


test =r"""//CalculatorTest
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class CalculatorTest {
  @Test
  public void evaluatesExpression() {
    System.out.println("Hello, World");
    Calculator calculator = new Calculator();
    int sum = calculator.evaluate("1+2+3");
    assertEquals(5, sum);
  }
}"""


code =r"""
public class Calculator {
  public int evaluate(String expression) {
    int sum = 0;
    for (String summand: expression.split("\\+"))
      sum += Integer.valueOf(summand);
    return sum;
  }
}"""






def put():
    task = {"id": None, "method": "exec", "params": {"code": code, "test": test}}
    print task
    task_id = server.enqueue(**task)
    return task_id


def get(t_id):
    t = Task(id=t_id)
    t.get_result('java')
    if t.result:
        return t.result
        #return json.loads( t.result[0])
    else:
        return "Snif"


tid = put()
print tid
time.sleep(4)
print get(tid)
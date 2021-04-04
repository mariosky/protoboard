# -*- coding: utf-8 -*-
__author__ = 'mariosky'

import json
import os
import time

print os.environ['REDIS_HOST']


from redis_cola import Cola, Task

server = Cola("csharp")

code = """using System.IO;
using System;
public class Product
{
        public int  code;
        public string  desc;

        public Product(int c, string d)
        {
        code=c;
        desc=d;
        }

        public void Print()
        {
        Console.WriteLine("Producto {0}: {1}", code,desc);
        }

}"""



test= u"""[TestFixture]
public class ProductTest
{

    [Test, Description("Prueba del Constructor")]
    public void Constructor()
    {
        Product p = new Product(1,"hola");
        // Constraint Syntax
        Assert.AreEqual(p.code,1);
    }


    [Test, Description("Imprimir la Descripción")]
    public void PrintTest()
    {
        Product p = new Product(1,"hola");
        p.Print();

        using (StringWriter sw = new StringWriter())
        {
            Console.SetOut(sw);


            p.Print();

        string expected = "Producto 1: hola";
        StringAssert.StartsWith(expected, sw.ToString());


        }

    }
}"""



def put():
    task = {"id": None, "method": "exec", "params": {"code": code, "test": test}}
    print task
    task_id = server.enqueue(**task)
    return task_id


def get(t_id):
    t = Task(id=t_id)
    t.get_result('csharp')
    if t.result:
        return t.result
        #return json.loads( t.result[0])
    else:
        return "Snif"


tid = put()
print tid
time.sleep(2)
print get(tid)

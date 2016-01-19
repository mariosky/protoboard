# -*- coding: utf-8 -*-




activities = [


{'_id':'/test/demo',

    'questions':  [{'id': 1,
                    'interaction': 'simpleChoice',
                    'inline': 0 ,
                    'title': "Elige la opción correcta",
                    'question': "Las clases nos sirven para definr las caracterisitcas de un grupo de",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["Propiedades","Métodos","Instrucciones","Objetos"],
                    'answer': [0,0,0,1],
                    'answer_text': "Solo son México y USA",
                    'hints': ["España está en Europa", "Nicaragua es de Sudamérica"]
                    },

                    {'id': 2,
                    'interaction': 'choiceInteraction',
                    'inline': 0 ,
                    'title': "Elige la opción correcta",
                    'question': "¿Las clases se componen de?",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["Propiedades","Métodos","Instrucciones","Líneas de código"],
                    'answer': [1,1,0,0],
                    'answer_text': "",
                    'hints': [""]
                    },
                    {
                    'id':3,
                    'interaction': 'choiceInteraction',
                    'inline': 1,
                    'title': "Pregunta Abierta",
                    'question': "Son lenguajes de programación orientado a objetos",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["C","Java","Fortran","C++"],
                    'answer': [0,1,0,1],
                    },
                     {
                    'id':4,
                    'interaction': 'textEntryInteraction',
                    'inline': 0,
                    'title': "Estilo",
                    'question': "Es un enfoque particular o filosofía para diseñar y programar soluciones",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': [],
                    'type':"str",
                    'answer': ["Paradigma", "paradigma"],
                    },
                                       {
                    'id':5,
                    'interaction': 'choiceInteraction',
                    'inline': 1,
                    'title': "Pregunta Abierta",
                    'question': "Son propiedades que tendría la clase Persona",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["comer()","nombre","fecha_de_caducidad","correo_electrónico"],
                    'answer': [0,1,0,1],
                    },
                   {
                    'id':6,
                    'interaction': 'choiceInteraction',
                    'inline': 1,
                    'title': "Pregunta Abierta",
                    'question': "Son métodos que tendría la clase Ave",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["imprimir()","volar()","comer()","ladrar()"],
                    'answer': [0,1,1,0],
                    },


                    ],
    'intro':"""<h3>Introducción</h3>
    <p> Contesta las preguntas,correctamente. Mínimo Tres. </p>""",
    'bye':"""""",
     'satisfied_at_least':3
                    },

    {'_id':'/program/csharp/1',
     'title':u"Product.cs",
     'initial_code':u"""
using System.IO;
using System;
public class Product
{
        public   code;
        public   desc;

        public Product(int c, string d)
        {
        code=c;
        desc=d;
        }

        public void Print()
        {
        Console.WriteLine("Producto {0}: {1}", code,desc);
        }

}
""",
     'description':u"Completa la definción de una clase sencilla",
     'type':"Completa",
     'icon':"puzzle-piece",
     'level':'principiante',


            'correct_code':u""" """,
             'instructions':u"""




<h4>La clase <code>Product</code> tiene errores</h4>
  <p>
       La clase <code>Product</code> se utiliza en un programa de la siguiente manera:
  </p>

<pre>
Product p = new Product(1, "iPhone 6");
p.Print();
</pre>
  <p>
       Completa el código para que funcione.
  </p>

<row>
<button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
  Ayuda
</button>
</row>
<div class="collapse" id="collapseExample">
  <div class="well">
  <p>
    En C# al declarar los campos debes indicar su tipo de dato. Por ejemplo:
    </p>
<pre>
public int intentos;
public string email;</pre>
  </div>
</div>



             """,
            'unit_test':u"""
[TestFixture]
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
}""",
     "lang":"csharp" }





    ]






import os

if __name__ == "__main__":
     os.environ.setdefault("DJANGO_SETTINGS_MODULE", "protoboard.settings")
     from pymongo import MongoClient
     from django.conf import settings
     client = MongoClient(settings.MONGO_DB)
     db = client.protoboard_database

     activities_collection = db.activities_collection
     #print activities_collection.find_one({'_id':'/activity/Preliminar'})
     activities_collection.remove()
     activities_collection.insert(activities)


     #activities_collection.remove()
     #activities_collection.insert(activities)


  
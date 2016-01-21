# -*- coding: utf-8 -*-
#!/usr/bin/env python

activities = [

    {
 '_id':'/activity/SecuenciadoSimple',
  'content':u"""
        <h3>Introducción</h3>
		<p>
		    Aprender a programar de forma autodidácta puede ser una tarea difícil. No sabemos por donde empezar, ¿que material debo leer
		    primero?, ¿que ejercicios son los adecuados, para mi habilidad actual?, ¿que necesito instalar para empezar?,¿veo videos o leo?.
			Uno de los problemas de la Web es que nos podemos perder entre tanta información, todos los recursos necesarios pueden estar ahí, pero
			   ¿cual podría ser una secuencia adecuada para visitarlos?.
		</p>
		<p>
		   Para Protoboard nos basamos en una especificación llamada <a href="http://www.imsglobal.org/simplesequencing/"> IMS Simple Sequencing Specification (SS) </a>,
		   la cual sirve para <em>representar el  comportamiento deseado en una experiencia de aprendizaje </em>, básicamente es una manera de especificar
		   como se deberían ir entregando las actividades de aprendizaje a los alumnos. No pretendemos cumplir totalmente con la especificación y más bien
		   se ha ido adaptando a nuestras necesidades. Trabajaremos en lograr que el sequenciado se adapte a los usuarios utilizando técnicas de
		   personalización y sistemas de recomendación. Por ejemplo:
		 </p>
		   <ul>
              <li> Agregando reglas difusas para especificar el secuenciado.</li>
              <li> Implementando un sistema de recomendación híbrido para proponer actividades de aprendizaje.</li>
		      <li> Proponiendo un modelo para medir de manera indirecta el nivel de fluidez que experimenta el
                 estudiante para sugerirle ejercicios adecuados</li>
              <li> Considerar información  contexto en los algoritmos de recomendación </li>
           </ul>
          <p>
             Con este demo  iremos probando la funcionalidad básica de la plataforma sin agregar todavía los módulos de personalización,
             ya que ésta es una nueva versión en desarrollo.
          </p>
          <p>

              Se irán explicando a lo largo del demo las capacidades de secuenciado y el
             tipo de actividades de aprendizaje implementadas. En las explicaciones se tratará de reducir al mínimo
             el uso de términos técnicos de computación. Bueno ya empezamos mal.
          </p>
        <h3> Arbol de Secuencia</h3>
    <p> Cuando un instructor planea un curso en línea o presencial, podría empezar por  decidir y organizar los temas
        y objetivos didácticos que cubrirá en el curso. Adecuarlos al tiempo disponible y nivel académico de sus alumnos.
        Una forma muy común de organización es emplear un árbol de tres niveles: Unidad-Tema-Actividades, las plataformas
        más populares de cursos en línea utilizan esta estructura. En la especificación SS se generaliza la solución a un
        árbol de <strong>n</strong> niveles. Solo las hojas del arbol representan actividades de aprendizaje o recursos
        didácticos con los que interactuarán los alumnos. Estas actividades de aprendizaje se llaman también objetos de
        aprendizaje ya que son auto contenidos y pueden reutilizarse en varios cursos. A los otros nodos podemos verlos como
        contenedores, igual que en las carpatas de archivos en la computadora. Los contenedores pueden corresponder a objetivos de
        aprendizaje o niveles jerárquicos de organización como unidades, temas, subtemas, etc.
    </p>
    <p>
        Una secuencia de dichas actividades puede establecerse al recorrer el árbol en pre-orden. Utilizando reglas de secuencia se pueden
        omitir algunos nodos con todo y sus descendientes. Por ejemplo en la figura se puede omitir el recurso <code> AAB </code> o el contenedor <code>AB</code>
    </p>
			<img src="https://s3.amazonaws.com/mariogarcia/images/ActivityTree.png" class="img-responsive" alt="Responsive image">

    <p> Las reglas se estipulan en el lenguaje python y pueden hacer referencia al <em> árbol de secuenciado</em> un árbol donde se lleva el avance que
     a tenido el alumno en un curso en particular. Por ejemplo la regla:
        <pre>
pre_condition_rule = \"\"\"
if get_attr('/activity/SecuenciadoSimple','progress_status') == 'completed':
    activity['pre_condition'] = 'hidden'
else:
    activity['pre_condition'] = ''
\"\"\",
        </pre>

 <p> Ocultaría esta actividad después de visitarla una vez. </p>
    <p> This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Reconocimiento 3.0 Unported License</a>.</q>
</p>"""},


    {'_id':'/activity/video/intro',
     'title':u'Ejemplo de video',
     'url':u"http://www.youtube.com/embed/qM5nKU40KVg?rel=0",
     'youtube_id':'iUrrwxOG9uU',
     'startSeconds':0,
     'endSeconds':10,
      'content' : u"""
                <p> Este video salta a la siguiente actividad después de 10 segundos. </p>
                  """

     },


    {'_id':'/test/demo',

    'questions':  [{'id': 1324,
                    'interaction': 'choiceInteraction',
                    'inline': 0 ,
                    'title': "Pregunta Abierta",
                    'question': "Son paises de America del Norte",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': ["Mexico","USA","Nicaragua","España"],
                    'answer': [1,1,0,0],
                    'answer_text': "Solo son México y USA",
                    'hints': ["España está en Europa", "Nicaragua es de Sudamérica"]
                    },
                    {
                    'id':1323,
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
                    'id':1311,
                    'interaction': 'textEntryInteraction',
                    'inline': 0,
                    'title': "Pregunta Abierta",
                    'question': "Cual fué la primera selección en ganar el mundial de Fútbol",
                    'can_check': "True",
                    'can_show': "True",
                    'can_hint': "True",
                    'options': [],
                    'type':"str",
                    'answer': ["Uruguay", "uruguay"],
                    }
                    ],
    'intro':"""<h3>Evaluación Previa</h3>
    <p> Contesta las preguntas, eligiendo la opción mas adecuada de la lista </p>""",
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
     "lang":"csharp" },








    {'_id':'/program/js/1', 'title':u"suma.js",
     'description':u"Programa una función sencilla",
     'type':"Programa",
     'icon':"coffee",
     'level':'principiante',
                'initial_code':u"""//Completa el código

 function suma(a, b){
    return ;
 }
                                """,
                'correct_code':u"""""",
                'instructions':u"""<p>Escribe una función llamada <code>suma</code> la cual tome dos argumentos <code>a</code> y <code>b</code> y regrese la
                                        suma de ambos.</p> </code>""",
                'unit_test':u"""
                    QUnit.test("JQuery", function( assert ) {
                        assert.equal(suma(2,3), 5, "Debe sumar positivos");
                        assert.equal(suma(2,-3), -1, "Debe sumar negativos");
                        });""",
                "lang":"javascript" },



    {'_id':'/program/js/2', 'title':u"titulo.js",
                'initial_code':u"""//Corrige el código

$('.panel-title').html("Hola");
                                """,
                'correct_code':u"""
                                    """,
                'instructions':u"""
                <h4> Modificando el texto dentro de un elemento</h4>

                <p> Podemos utilizar JQuery para cambiar el texto de un elemento en particular.  Primero buscamos el
                elemento, si el elemento tiene un <code> id </code> es fácil, lo encontramos con el selector <code> # </code>.
                Una vez que lo tenemos  modificamos el texto con la función <code>html()</code>.

                <h4> Instrucciones</h4>

                Cambia el titulo del HTML Renderizado en la parte superior, en lugar de Hola debería decir: <strong>Hola JQuery</strong>.</p>

                <h5> El HTML original es el siguiente:</h5>
                """,
                'unit_test':u"""
                    QUnit.test("JQuery", function( assert ) {
                        assert.equal($('#titulo').html(), "Hola JQuery", "El titulo debe decir 'Hola JQuery'");

                        });""",
                'HTML_code': u""" <h3 id='titulo'> Hola </h3> """,
                "CSS": """

                """,
                     'description':u"¿Como cambiar el titulo de una página con jQuery?",
     'type':"jQuery",
     'icon':"code",
     'level':'principiante',
                "lang":"javascript",

                "hint":u"""
                Recuerda que se utiliza el selector <code> . </code> para encontrar los elementos que tienen cierta clase.
                En este caso buscamos un <code>id</code>. Algo como:
                <pre>
$('<strong>#</strong>nombre_del_elemento');
                </pre>
                """}

,






    {'_id':'/program/java/1',
     'title':u"Calculator.class",
     'initial_code':r"""
public class Calculator {

  public int evaluate(String expression) {


    return sum;
  }
""",
                     'description':u"Utiliza split() para procesar una lista elementos",
     'type':"Programa",
     'icon':"coffee",
     'level':'intermedio',
            'correct_code':u""" """,
             'instructions':u"""<p>Completa el método <code> evaluate </code> de la clase <code>Calculator</code>. Este
              método toma como parámetro una cadena con número enteros y el operador de adición, por ejemplo: <code>"2+2+4+4"</code>
             y regresa un entero con la suma
              de los números, para el caso de ejemplo sería 12.""",
            'unit_test':r"""//CalculatorTest
import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class CalculatorTest {
  @Test
  public void evaluatesExpression() {
    Calculator calculator = new Calculator();
    int sum = calculator.evaluate("1+2+3");
    assertEquals(6, sum);
  }
}""",
     "lang":"java" },

    {'_id': '/program/suma/3',
     'title':u"Clase Producto",
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
            'correct_code':u""" """,
             'instructions':u"""<p>Completa la clase llamada <code> Producto </code> """,
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
}""","lang":"csharp", "type":"unit_test" },

{'_id': '/program/PPP/3',
   'title':u"Suma dos números",
 'description':u"Suma dos números",

            'initial_code':u"""
# Funcion que suma dos números
def suma():
    pass
""",
            'correct_code':u"""# Solution:
def suma(a,b):
    return a + b""",
            'instructions':u"""<p>Escribe una función llamada <code> suma() </code> la cual reciba como parámetros
                dos enteros y regrese la suma de ambos.</p>
            <code>
                <p>>>> suma(3,4)</p>
                <p>7</p>
                <p>>>> suma(3,-4)</p>
                <p>-1</p>
            </code>""",
            'unit_test':u"""
class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_suma_positivos(self):
        self.assertEqual(suma(3,9),12)
    def test_negativos(self):
        self.assertEqual(suma(5,-12),-7)
"
print json.dumps(result)
""", "lang":"python", "type":"unit_test"  },



{'_id': '/program/PPP/4',
        'title':u"distancia()",
        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
        'initial_code':u"""
def distancia():
    pass
""",
            'correct_code':u""" """,
            'instructions':u"""<p>Escribe una función llamada <code> distancia() </code> la cual reciba como parámetros
                dos enteros y regrese el valor absoluto de la diferencia entre ambos</p>
            <code>
                <p>>>> distancia(3,4)</p>
                <p>1</p>
                <p>>>> distancia(3,-4)</p>
                <p>7</p>
            </code>""",
            'unit_test':u"""
class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_distancia_positivos(self):
        self.assertEqual(distancia(3,9),6)
    def test_negativos(self):
        self.assertEqual(distancia(5,-12),17)
"""},

{'_id': '/program/PPP/5',
        'title':u"mayor()",
        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
        'initial_code':u"""
def mayor():
    pass
""",
            'correct_code':u""" """,
            'instructions':u"""<p>Escribe una función llamada <code> mayor() </code> la cual reciba como parámetros
                dos enteros y regrese el mayor entre ellos.</p>
            <code>
                <p>>>> mayor(3,4)</p>
                <p>4</p>
                <p>>>> mayor(2,-4)</p>
                <p>2</p>
            </code>""",
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_mayor_positivos(self):
        self.assertEqual(mayor(3,9),9)
    def test_negativos(self):
        self.assertEqual(mayor(5,-12),5)

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},

{'_id': '/program/PPP/6',
        'title':u"mayor()",
        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,

            'initial_code':u"""
def regresa_lista():
    return None
""",
            'correct_code':u""" """,
             'instructions':u"""<p>Escribe una función llamada <code> regresa_lista </code> la cual regrese la siguiente lista:
           <code> ["Tom", 2.23, 12]  </code>.
</p>""",
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_lista(self):
        self.assertEqual(type(regresa_lista()),type([1,2]))
    def test_Tom(self):
        self.assertEqual(regresa_lista()[0],"Tom")
    def test_float(self):
        self.assertEqual(regresa_lista()[1],2.23)
    def test_int(self):
        self.assertEqual(regresa_lista()[2],12)
    def test_len(self):
        self.assertEqual(len(regresa_lista()),3)

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},

{'_id': '/program/PPP/7',
        'title':u"Dame una tupla",
        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
            'initial_code':u"""
def regresa_tupla(a,b,c):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p>Escribe una función llamada <code> regresa_tupla </code>
             la cual tome tres parámetros y regrese una tupla con los tres valores.
             </p>
            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_tupla(self):
        self.assertEqual(type(regresa_tupla(1,2,3)),type((1,2)))
    def test_primero(self):
        self.assertEqual(regresa_tupla(1,2,3)[0],1)
    def test_segundo(self):
        self.assertEqual(regresa_tupla(1,2,3)[1],2)
    def test_tercero(self):
        self.assertEqual(regresa_tupla(1,2,3)[2],3)
    def test_len(self):
        self.assertEqual(len(regresa_tupla(1,2,3)),3)
suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},

{'_id': '/program/PPP/8',

 'title':u"Solo una tajada",
        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
            'initial_code':u"""
def recorta(pelicula):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p> Un sistema externo nos envía en una lista información sobre peliculas,
             aquí un ejemplo: <code> ['tt1877832', 'X-Men: Days of Future Past', 2014,
			['Action', 'Adventure', 'Fantasy'], 8.1,  14740 ] </code>  los elementos corresponden secuencialmente a
			Identificador, Titulo, Año, Lista de Generos y Calificación Promedio, Número de votos. Escribe un método
			llamdo <code> recorta(pelicula) </code> que reciba una pelicula representada como lista y regrese
			otra lista que solo incluya Identificador, Titulo y Año. Por ejemplo para la pelicula anterior regresaría
			<code> ['tt1877832', 'X-Men: Days of Future Past', 2014] </code> </p>
            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_corte(self):
        self.assertEqual(recorta(['tt', 'X', 1, [], 1,  1 ]), ['tt', 'X', 1])

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},
{'_id': '/program/PPP/9', 'title':u"Solo una tajadita",

        'description':u"distancia",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,

            'initial_code':u"""
def recorta(pelicula):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p> Un sistema externo nos envía en una lista información sobre peliculas,
             aquí un ejemplo: <code> ['tt1877832', 'X-Men: Days of Future Past', 2014,
			['Action', 'Adventure', 'Fantasy'], 8.1,  14740 ] </code>  los elementos corresponden secuencialmente a
			Identificador, Titulo, Año, Lista de Generos y Calificación Promedio, Número de votos. Escribe un método
			llamado <code> recorta(pelicula) </code> que reciba una pelicula representada como lista y regrese
			otra lista que solo incluya Titulo y Año. Por ejemplo para la pelicula anterior regresaría
			<code> ['X-Men: Days of Future Past', 2014] </code> </p>
            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_corte(self):
        self.assertEqual(recorta(['tt', 'X', 1, [], 1,  1 ]), [ 'X', 1])

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},

{'_id': '/program/PPP/10',  'title':u"¡Pura Acción!",
        'description':u"Lista",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,


            'initial_code':u"""
def es_accion(pelicula):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p> Un sistema externo nos envía en una lista información sobre peliculas,
             aquí un ejemplo: <code> ['tt1877832', 'X-Men: Days of Future Past', 2014,
			['Action', 'Adventure', 'Fantasy'], 8.1,  14740 ] </code>  los elementos corresponden secuencialmente a
			Identificador, Titulo, Año, Lista de Generos, Calificación Promedio y Número de votos. Escribe un método
			llamado <code> es_accion(pelicula) </code> que reciba una pelicula representada como lista y regrese
			<code> True </code> si es pelicula de acción, y <code> False </code> si no lo es.Por ejemplo para la pelicula anterior regresaría
			<code>True </code>, pero para la pelicula <code>['tt2004420', 'Neighbors', 2014, ['Comedy'], 7.2,  26920]</code>
			  regresaría  <code> False </code>.</p>
            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_Action(self):
        self.assertEqual(es_accion(['tt', 'X', 1, ['Action'], 1,  1 ]), True)
    def test_Not_Action(self):
        self.assertEqual(es_accion(['tt', 'X', 1, ['Otra'], 1,  1 ]), False)
suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},


{'_id': '/program/PPP/11',

 'title':u"Mutantes",

        'description':u"Mutantes",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,

            'initial_code':u"""
def activa_usuario(usr):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p> Un sistema externo nos envía en una lista información sobre usuarios,
             aquí un ejemplo: <code> ['812202', 'Ana', 'Activo'] </code>  los elementos corresponden secuencialmente a
			Identificador, Nombre y Status. Status tiene solo dos valores válidos:<code> 'Activo'</code>  e <code> 'Inactivo'</code>   Escribe un método
			llamado <code> activa_usuario(usr) </code> que reciba a un usuario representado como lista, modifique su
			estado a  <code>'Activo'</code> y regrese la lista.</p>

            <div class="alert alert-warning"> Para usuarios más avanzados: Como el usuario es una lista,
          al pasarse como argumento la modificación se realiza a la  referencia por lo que no es necesario regresar la
          lista. Si está en chino no te preocupes, ésto lo explicaremos más adelante.</div>
            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_Action(self):
        self.assertEqual(activa_usuario(['2', 'A', 'Inactivo']) , ['2', 'A', 'Activo'])

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""},

{'_id': '/program/PPP/12',
 'title':u"Ordena la Lista",
        'description':u"Ordena la Lista",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
            'initial_code':u"""
# Funcion que ordena una lista, puedes utilizar sort()
def solution():
    pass
""",
            'correct_code':u"""# Solution:
def solution(l):
    if l is None:
        return []
    else:
        l.sort()
        return l""",
            'instructions':u"""<p>Escribe una función llamada <code>solution</code> la cual reciba como parámetro
                una lista y regrese la lista ordenada.</p>
            <p>En caso de recibir como parámetro el valor <code>None</code> debe regresar una lista vacía. </p>
            <code>
                <p>>>> solution([4,3,5,1])</p>
                <p>[1, 3, 4, 5]</p>
                <p>>>> solution(None)</p>
                <p>[]</p>
            </code>""",
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_order(self):
        self.assertEqual(solution([2,6,1,5]),[1,2,5,6])
    def test_none(self):
        self.assertEqual(solution(None),[])

suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""}
        ,

 {'_id': '/program/PPP/13',

  'title':u"Producto punto",
         'description':u"Producto punto",
        'type':"Programa",
        'icon':"coffee",
        'level':'principiante',
        "lang":"python",
        "type":"unit_test" ,
            'initial_code':u"""
def producto(l1,l2):
    pass
""",
            'correct_code':u""" """,
             'instructions':u"""<p> Escribe un método llamado <code> producto(l1, l2) </code> el cual reciba
              dos listas de enteros del mismo tamaño y regrese el producto escalar entre ellas. El producto escalar
              se calcula de la siguiente manera: Tenemos <b>a</b> = [a<sub>1</sub>, a<sub>2</sub> , ... ,a<sub>n</sub>] y
            <b>b</b>  =  [b<sub>1</sub>, b<sub>2</sub> , ... , b<sub>n</sub>] entonces
            <b> a</b> ·<b> b </b>= a<sub>1</sub>b<sub>1</sub> + a<sub>2</sub>b<sub>2</sub> + .. + a<sub>n</sub>b<sub>n</sub> Se suman
             los productos de los elementos con el mismo indice, el primero con el primero, segundo con el segundo, etc.

            </p>
          <div class="alert alert-warning"> Puedes utilizar <code>map</code> y <code>zip</code></div>

            """,
            'unit_test':u"""
import sys
import unittest
import json

class ResultadoPrueba(unittest.TestResult):
    def __init__(self):
         super(ResultadoPrueba, self).__init__()
         self.success = []
    def addSuccess(self, test):
         self.success.append(test)
    def shouldStop(self, test):
         return False


class Test(unittest.TestCase):
    def setUp(self):
        pass
    def test_Action(self):
        self.assertEqual(producto([2, 1, 3], [2, 3, 1]), 10)
suite = unittest.TestLoader().loadTestsFromTestCase(Test)
Resultado = ResultadoPrueba()
suite.run(Resultado)
result = {}

if Resultado.wasSuccessful():
    result['result'] = "Success"
else:
    result['result'] = "Failure"
result['errors']=  [str(e[0])   for e in Resultado.errors]
result['failures']=  [str(e[0]) for e in Resultado.failures]
result['successes']=  [str(e)  for e in Resultado.success]
print "!!!---"
print json.dumps(result)
"""}

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



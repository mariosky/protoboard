---
layout: nohead
---

# Crear Actividades

## Cuestionarios

Puedes agregar cuestionarios sencillos que incluan preguntas de opción 
múltiple y de completar. El cuestionario se captura en dos partes como
se muestra en la imágen:

![](https://mariosky.github.io/protoboard/assets/QuizEditor.png)

* ***La sección de instrucciones o imágenes que está en la parte superior.*** Aquí
debes de escribir directamente en HTML, las instrucciones, el problema,código 
o imágenes sobre las cuales vas a preguntar. Puedes utilizar los 
elementos y atributos de estilo de Bootstrap 4.0 y el código con sintáxis resaltada.
Para resaltar código utilizamos [prisimjs](http://prismjs.com/), por lo que 
puedes escribir algo como:

```
<pre> 
	<code class="language-css">
		p { color: red }
	</code>
</pre>
```


* ***La sección de preguntas.*** Esta sección debes escribirla utilizando
el formato Markdown de la siguiente manera:

#### Para preguntas de opción múltiple de una sola respuesta:

```
>>¿Qué es un intérprete?<<
() Una persona que traduce entre varios lenguajes.
() Es un programa informático que traduce un programa que ha sido escrito en un lenguaje de programación a un lenguaje diferente.
(x) Un programa informático capaz de analizar y ejecutar otros programas.
```
* Escribe la pregunta entre las marcas: >> <<
* Cada opción va en una línea nueva, en este caso los paréntesis indican 
los botones tipo radio.
* Con una x indicas la respuesta correcta.

#### Preguntas de opción múltiple:
```
>>Son lenguajes interpretados:<<
[x] Python
[] c++
[x] Ruby
```
* Escribe la pregunta entre las marcas: >>  <<
* Cada opción va en una línea nueva, en este caso los corchetes indican 
que se debe seleccionar más de una respuesta. 
* Con una x indicas aquellas opciones que deberán ser seleccionadas para
que se considere una respuesta correcta.

#### Preguntas de completar:
```
>>¿Que empresa desarrolló el lenguaje GO?<<
{{Empieza con G}}
=Google=
=google=
```
* Escribe la pregunta entre las marcas: >>  <<
* Cada opción va en una línea nueva. El texto va entre los simbolos de igualdad: = =  
* En todos los casos puedes indicar entre llaves dobles \{\{ \}\} la pista que se dará al
estudiante en caso de que lo requiera.  

Para el ejemplo anterior el estudiante vería el siguiente cuestionario:

![](https://mariosky.github.io/protoboard/assets/QuizExample.png)


## Ejercicios de Programación

Un ejercicios de programación tiene varios componentes, los cuales se muestran
en las siguientes pestañas:

### Instrucciones
Las instrucciones debes de escribirlas en código HTML utilizando 
Bootstrap 4.0, por ejemplo:
```
<h4>La clase <code>Product</code> tiene errores</h4>
  <p>
       La clase <code>Product</code> se utiliza en un programa de la siguiente manera:
  </p>
<div class="card card-block bg-faded">
	<pre>
		<code class="language-csharp">
		Product p = new Product(1, "iPhone 6");
		p.Print();
		</code>
	</pre>
</div>
  <p>
       Completa el código para que funcione.
  </p>

<row>
	<button aria-controls="collapseExample" aria-expanded="false" class="btn btn-info" data-target="#collapseExample" data-toggle="collapse" type="button">
	Ayuda
	</button>
</row>
<div class="collapse" id="collapseExample">
 <div class="card card-block bg-faded">
  	<p>
    En C# al declarar los campos debes indicar su tipo de dato. Por ejemplo:
    </p>
	<pre>
		<code class="language-csharp">
		public int intentos;
		public string email;
		</code>
	</pre>
  </div>
</div>
```
En este ejemplo se utiliza un elemento adicional de Bootstrap 4.0 para
mostrar un botón de ayuda el cual muestra texto adicional al presionarlo.

### Código inicial

El código inicial, es el código con el cual el estudiante empezará
a hacer el ejercicio. Por ejemplo, en el caso de que tenga que 
corregir el código, estará el programa incompleto, etc. Por ejemplo:
```
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
```
### Prueba
En la pestaña de prueba, va el código que evaluará el ejercicio.
El ejercicio se evalúa con una prueba unitaria y el código 
dependerá del lenguaje del ejercicio. Por ejemplo para C#:

```
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
}
```


### RegExp
Se pueden poner expresiones regulares que deban satisfacerse.

### Solución Correcta
Es opcional y todavía no se utiliza.

### HTML Generado
En el caso de ejercicios de JavaScript es código HTML
que se genererá.

## Videos

## HTML


# Crear Cursos
## Árbol de Actividades
## Agregar Actividades
## Reglas de Secuenciado












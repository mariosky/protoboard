# -*- coding: utf-8 -*-
#!/usr/bin/env python
activities = {
'/activity/POO':u""" <h1 id="welcome">Bienvenidos</h1>
      <p> En esta clase aprenderas algunos conceptos básicos de la Programación Orientada a Objetos. </p>
      <p> Como primer paso realizarás un pequeño examen para
          evaluar tus conocimientos de Programación. </p>
    """
,
'/activity/Bienvenidos': u""" <h1 id="welcome">Bienvenidos</h1>
      <p> En esta clase aprenderas algunos conceptos básicos de la Programación Orientada a Objetos. </p>
      <p> Como primer paso realizarás un pequeño examen para
          evaluar tus conocimientos de Programación. </p>
    """ ,

'/activity/Comentario_final': u""" <h1 id="welcome">Comentario Final</h1>
      <p> En esta clase haz visto algunos de los conceptos básicos de la Programación Orientada a Objetos,
     poco a poco, deberas familiarizarte con los téminos y conceptos aquí vistos, ya que son fundamentales
     para entender y explotar al máximo los lenguajes de programación OO.
      </p>
    """ ,

'/activity/Herencia': u"""
<a name="notion" class="ancre"></a>
<h1>El concepto de herencia</h1>
<p align="justify">La <b>herencia</b> es espec&iacute;fica de la programaci&oacute;n orientada a objetos, donde una clase nueva se crea a partir de una clase existente.
La <i>herencia</i> (a la que habitualmente se denomina <i>subclases</i>) proviene del hecho de que la subclase (la nueva clase creada) contiene las atributos y m&eacute;todos de la clase primaria.
 La principal ventaja de la herencia es la capacidad para definir atributos y m&eacute;todos nuevos para la subclase, que luego se aplican a los atributos y m&eacute;todos heredados.
 <br/>Esta particularidad permite crear una estructura jer&aacute;rquica de clases cada vez m&aacute;s especializada. La gran ventaja es que uno ya no debe comenzar desde cero cuando desea especializar
 una clase existente. Como resultado, se pueden adquirir bibliotecas de clases que ofrecen una base que puede especializarse a voluntad
 (la compa&ntilde;&iacute;a que vende estas clases tiende a proteger las datos miembro usando la
        <a href="Encapsulacion_intro">encapsulaci&oacute;n</a>).

<a name="hierarchie" class="ancre"></a>
<h1>Jerarqu&iacute;a de clase</h1>
<p align="justify">La relaci&oacute;n primaria-secundaria entre clases puede representarse desde un punto de vista jer&aacute;rquico, denominado <i>vista de clases en &aacute;rbol</i>.
 La vista en &aacute;rbol comienza con una clase general llamada superclase (a la que algunas veces se hace referencia como <i>clase primaria</i>, <i>clase padre</i>, <i>clase principal</i>, o <i>clase madre</i>;
 existen muchas met&aacute;foras geneal&oacute;gicas). Las clases derivadas (<i>clase secundaria</i> o <i>subclase</i>) se vuelven cada vez m&aacute;s especializadas a medida que van descendiendo el &aacute;rbol.
 Por lo tanto, se suele hacer referencia a la relaci&oacute;n que une a una clase secundaria con una clase primaria mediante la frase "<i>es una</i>" x o y.

<p align="center"><img src="http://static.commentcamarche.net/es.kioskea.net/pictures/poo-images-animaux.gif"alt="Jerarqu&iacute;a de clase" />

<a name="multiple" class="ancre"></a>
<h1>Herencia m&uacute;ltiple</h1>
<p align="justify">Algunos lenguajes orientados a objetos, como C++ permiten herencias m&uacute;ltiples, lo que significa que una clase puede heredar los atributos de otras dos superclases.
Este m&eacute;todo puede utilizarse para agrupar atributos y m&eacute;todos desde varias clases dentro de una sola.
<p align="center"><img src="http://static.commentcamarche.net/es.kioskea.net/pictures/poo-images-animaux2.gif"alt="Herencia m&uacute;ltiple" />



<ul>
 <li>   Muchos objetos se relacionan entre sí, de alguna forma por ejemplo </li>
        <ul>
        <li>Un Libro y sus Autores</li>
        <li>Un objeto instancia de Reservación, relaciona objetos tipo Vuelo y Pasajero.</li>
        </ul>


 <li>  Un tipo de relación muy importante es la de Herencia, la cual nos permite tener una relación tipo-de. por ejemplo:</li>
        <ul>

        <li>Un Libro es un tipo de Publicación.</li>
        <li>Un MP3 Player es un tipo de Reproductor.</li>
        <li>Una Ventana de Dialogo es un tipo de Ventana.</li>
        </ul>

 <li>   La Herencia nos permite definir un nuevo tipo de objeto especializando la funcionalidad de otro.</li>
 <li>   También nos permite tratar a diferentes tipos de objetos de una forma general, por ejemplo:
       <ul>

        <li> Un Libro, una Revista y un Periódico, se pueden ver como Publicaciones.</li>
       <li>  Un Reproductor de Mp3, un Reproductor de BluRay y una Video-cassetera son todos Reproductores.</li>
       </ul>
 </li>
 <li>   Las relaciones entre objetos se pueden representar en Diagramas de Clases donde se expresan relaciones tipo-de (Herencia), parte-de, utiliza, etc.</li>

</ul>
<q>Este documento intitulado &laquo;&nbsp;<a href="http://es.kioskea.net/contents/poo/polymorp.php3">OOP - Polimorfismo</a>&nbsp;&raquo; de <a href="http://es.kioskea.net">Kioskea.net</a> (<a href="http://es.kioskea.net/">es.kioskea.net</a>) esta puesto a diposición bajo la licencia <a href="/ccmguide/ccmlicence.php3">Creative Commons</a>. Puede copiar, modificar bajo las condiciones puestas por la licencia, siempre que esta nota sea visible.</q>

    """ ,

'/activity/Polimorfismo': u""" <h1>Definici&oacute;n de polimorfismo</h1>
<p align="justify">La palabra <i>polimorfismo</i> proviene del griego y significa <i>que posee varias formas diferentes</i>. Este es uno de los conceptos esenciales de una programaci&oacute;n orientada a objetos. As&iacute; como la herencia est&aacute; relacionada con las clases y su jerarqu&iacute;a, el polimorfismo se relaciona con los m&eacute;todos.

<p align="justify">En general, hay tres tipos de polimorfismo:<ul>
<li><a href="#heritage">Polimorfismo de inclusi&oacute;n</a> (tambi&eacute;n llamado <i>redefinici&oacute;n</i> o <i>subtipado</i>)</li></li>
<li><a href="#adhoc">Polimorfismo de sobrecarga</a></li>
<li><a href="#parametrique">Polimorfismo param&eacute;trico</a> (tambi&eacute;n llamado <i>polimorfismo</i> de plantillas)</li>
</ul>
<p align="center">

<p align="justify">Trataremos de describir ahora con m&aacute;s precisi&oacute;n estos tipos de polimorfismo, pero le sugerimos prestar atenci&oacute;n, ya que muchas personas suelen confundirse al tratar de comprender las diferencias existentes entre estos tres tipos.

<a name="heritage" class="ancre"></a>
<h2>Polimorfismo de subtipado</h2>
<p align="justify">La habilidad para redefinir un m&eacute;todo en clases que se hereda de una clase base se llama <b>especializaci&oacute;n</b>.
Por lo tanto, se puede llamar un m&eacute;todo de objeto sin tener que conocer su tipo intr&iacute;nseco:
 esto es <b>polimorfismo de subtipado</b>. Permite no tomar en cuenta detalles de las clases especializadas de una familia de objetos,
 enmascar&aacute;ndolos con una interfaz com&uacute;n (siendo esta la clase b&aacute;sica).

<p align="justify">Imagine un juego de ajedrez con los objetos <i>rey</i>, <i>reina</i>, <i>alfil</i>, <i> caballo</i>, <i>torre</i> y <i>pe&oacute;n</i>,
cada uno heredando el objeto <i>pieza</i>.
<br/>El m&eacute;todo <i>movimiento</i> podr&iacute;a, usando polimorfismo de subtipado, hacer el movimiento correspondiente de acuerdo a
 la clase objeto que se llama. Esto permite al programa realizar el <i>movimiento.de_pieza</i>
 sin tener que verse conectado con cada tipo de pieza en particular.


<a name="adhoc" class="ancre"></a>
<h2>Polimorfismo de sobrecarga</h2>
<p align="justify">El polimorfismo de sobrecarga ocurre cuando las funciones del mismo nombre existen, con funcionalidad similar, en clases que son completamente independientes una de otra (&eacute;stas no tienen que ser clases secundarias de la clase objeto).
Por ejemplo, la clase complex, la clase image y la clase link pueden todas tener la funci&oacute;n "display".
Esto significa que no necesitamos preocuparnos sobre el tipo de objeto con el que estamos trabajando si todo lo que deseamos es verlo en la pantalla.
<p align="justify">Por lo tanto, el polimorfismo de sobrecarga nos permite definir operadores cuyos comportamientos var&iacute;an de acuerdo a los
 par&aacute;metros que se les aplican. As&iacute; es posible, por ejemplo, agregar el operador <i>+</i> y hacer que se comporte de manera distinta cuando
  est&aacute; haciendo referencia a una operaci&oacute;n entre dos n&uacute;meros enteros (suma) o bien cuando se encuentra entre dos cadenas de caracteres
  (concatenaci&oacute;n).

<a name="parametrique" class="ancre"></a>
<h2>Polimorfismo param&eacute;trico</h2>
<p align="justify">El polimorfismo param&eacute;trico es la capacidad para definir varias funciones utilizando el mismo nombre,
pero usando par&aacute;metros diferentes (nombre y/o tipo). El polimorfismo <i>param&eacute;trico</i> selecciona autom&aacute;ticamente
el m&eacute;todo correcto a aplicar en funci&oacute;n del tipo de datos pasados en el par&aacute;metro.
<p align="justify">Por lo tanto, podemos por ejemplo, definir varios m&eacute;todos hom&oacute;nimos de <i>addition()</i> efectuando una suma de valores.
    <ul>
        <li>El m&eacute;todo <i>int addition(int,int)</i> devolver&iacute;a la suma de dos n&uacute;meros enteros.</li>
        <li><i>float addition(float, float)</i> devolver&iacute;a la suma de dos flotantes.</li>
        <li><i>char addition(char, char)</i> dar&iacute;a por resultado la suma de dos caracteres definidos por el autor. </li>
        <li>etc. </li>
    </ul>
<p align="justify">Una <i>signature</i> es el nombre y tipo (est&aacute;tico) que se da a los argumentos de una funci&oacute;n.
 Por esto, una firma de m&eacute;todo determina qu&eacute; elemento se va a llamar.
</p>

<q>Este documento intitulado &laquo;&nbsp;<a href="http://es.kioskea.net/contents/poo/polymorp.php3">OOP - Polimorfismo</a>&nbsp;&raquo; de <a href="http://es.kioskea.net">Kioskea.net</a> (<a href="http://es.kioskea.net/">es.kioskea.net</a>) esta puesto a diposición bajo la licencia <a href="/ccmguide/ccmlicence.php3">Creative Commons</a>. Puede copiar, modificar bajo las condiciones puestas por la licencia, siempre que esta nota sea visible.</q>
    """ ,

    '/activity/Encapsulacion_Ejemplos': u"""
    <h1> Una introducción a Objetos y Clases </h1>
    <div class="video">
  <iframe width="640" height="510" src="http://www.youtube.com/embed/2srbnA_V2lI?rel=0" frameborder="0" allowfullscreen></iframe>   </div>
    """
    ,
       '/bye/POO': u""" <h1>Muchas Gracias</h1>
  <p> Con esto termina la evaluación de este sistema prototipo, por ultimo por favor
  danos tus comentarios llenando un cuestionario.
   </p>

    """ ,


'/test/Pretest': u"""

<h1>Evaluación Previa</h1>
    <p> Contesta las preguntas, eligiendo la opción mas adecuada de la lista </p>

 <ol>
	<li class="question">
           <p ><label for="r1">Es un subprograma o subrutina que realiza una tarea específica y devuelve un valor</label></p>
			<select id="question_1" name="question_1" >
				<option value="0"> Variable </option>
				<option value="0"> Parámetro </option>
				<option value="0"> Google </option>
				<option value="1"> Función </option>
			</select>
    </li>			

	<li class="question">
           <p ><label for="r2">Son espacios reservados en la memoria que, como su nombre indica, pueden cambiar de contenido
                                a lo largo de la ejecución de un programa</label></p>
			<select id="question_2" name="question_2">
				<option value="0">  RAM </option>
				<option value="0">  Volatiles </option>
				<option value="1">  Variables </option>
				<option value="0">  Espacio Virtual </option>
			</select>
    </li>			
	<li  class="question">
           <p><label for="r3">Es una variable que puede ser recibida por una rutina o subrutina.
            Una subrutina usa los valores asignados para alterar su comportamiento en tiempo de ejecución. </label></p>
			<select id="question_3" name="question_3" >
				<option value="1"> Argumento </option>
				<option value="0"> Input </option>
				<option value="1"> Parámetro </option>
				<option value="0"> Todos </option>
			</select>
    </li>
	<li  class="question">
           <p ><label for="r4">El paso de parámetros por valor consiste en:</label></p>
			<select id="question_4" name="question_4">
				<option value="1"> Copiar el contenido de la variable que queremos pasar en otra dentro del ámbito local de la subrutina </option>
				<option value="0"> Enviar la direccion de la variable que queremos pasar, lo cual permitira modificar su valor de ser necesario </option>
				<option value="0"> Significa que solo se parará la variable si tiene un valor, si no se la ha asignado algo marca error </option>
				<option value="0"> Ningúna de las anteriores </option>
			</select>
    </li>

    
 </ol>      
         """ ,

'/test/Posttest': u"""

<h1>Evaluación Previa</h1>

    <p> Contesta las preguntas, eligiendo la opción mas adecuada de la lista </p>

 <ol>
	<li class="question">
           <p ><label for="r1">La Programación Orientada a Objetos es:</label></p>
			<select id="question_1" name="question_1" >
				<option value="0">Es un  programa parecido a Visual Studio </option>
				<option value="0">Un lenguaje de programación basado en Java  </option>
				<option value="1">Un Paradigma o Modelo de Programación </option>
				<option value="0"> Un estándar de programación apoyado por Microsoft y Apple</option>
			</select>
    </li>

	<li class="question">
           <p ><label for="r2">¿Donde se especifican los atributos y comportamiento que tendrá un conjunto de objetos?</label></p>
			<select id="question_2" name="question_2">
				<option value="0">  Un Arreglo </option>
				<option value="1">  La Clase </option>
				<option value="0">  Un objeto instancia </option>
				<option value="0">  En C# </option>
			</select>
    </li>
	<li  class="question">
           <p><label for="r3">¿Como se determina el estado de un objeto?</label></p>
			<select id="question_3" name="question_3" >
				<option value="1">  Es el conjunto de atributos y sus valores actuales </option>
				<option value="0">  El estado se indica en la clase</option>
				<option value="0">  No se puede </option>
				<option value="0">  Un objeto no tiene estado </option>
			</select>
    </li>
	<li  class="question">
           <p ><label for="r4">¿Que otro nombre reciben los objetos?</label></p>
			<select id="question_4" name="question_4">
				<option value="0">Clases básicas </option>
				<option value="1">Instancias</option>
				<option value="0"> Entidades </option>
				<option value="0"> Agentes </option>
			</select>
    </li>

	<li   class="question">
           <p><label for="r5"> Permite reutilizar código, ya que las nuevas clases se crean especializando a otras</label> </p>
	       </p>
			<select id="question_5" name="question_5">
				<option value="0"> Estado </option>
				<option value="1"> Herencia </option>
				<option value="0"> Atributos  </option>
				<option value="0"> Archivos </option>
			</select>
    </li>

 </ol>
         """ ,

'/activity/Preliminar':u"""
    <h1> Programación Orientada a Objetos – ¿Qué es POO?</h1>
          <p> La P.O.O. (también conocida como O.O.P., por sus siglas en inglés) es lo que se conoce como un paradigma o modelo de programación.
          Esto significa que no es un lenguaje específico, o una tecnología, sino una forma de programar, una manera de plantearse la programación.
          No es la única (o necesariamente mejor o peor que otras), pero se ha constituido en una de las formas de programar más populares
          e incluso muchos de los lenguajes que usamos hoy día lo soportan o están diseñados bajo ese modelo (PHP, ActionScript, C#, Java).</p>
          <p>
          Lo que caracteriza a la POO es que intenta llevar al mundo del código lo mismo que encontramos en El Mundo Real™.
          Cuando miramos a nuestro alrededor ¿qué vemos? pues, cosas, objetos, pero podemos reconocer estos objetos porque cada objeto pertenece a una clase,
           eso nos permite distinguir, por ejemplo, un perro de un auto (porque son de clases diferentes) y también un TV de otro (porque, aunque sean iguales,
           cada uno es un objeto distinto). Éste es el modelo que la POO intenta seguir para estructurar un sistema.
          </p>
          <p>
          Es importante recalcar nuevamente que la POO no es un lenguaje de programación, es una forma de enfrentarse a ella.
           Esto significa que la POO le servirá para desarrollar en muchos de los lenguajes comunes de hoy en día
            manteniendo un mismo esquema mental. Incluso le permitirá enfrentar otros proyectos que no necesariamente estén relacionados con
          escribir código.
          </p>
         <q>Programación Orientada a Objetos,</span> by <a rel="cc:attributionURL" href="http://thefricky.wordpress.com/poo/">César Frick</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Reconocimiento 3.0 Unported License</a>.</q>
""",


'/activity/Encapsulacion_intro':
    u"""
    <h1> Encapsulación </h1>

   <p> La encapsulación se considera una de las características definitorias de la orientación a objetos.

Instanciamos objetos con el propósito de  utilizar  los servicios que nos proporcionan a través de sus métodos (públicos).

No necesitamos saber cómo se programó el objeto, ni saber las variables que usa internamente, ni la complejidad del código que contiene.</p>

<p>La encapsulación es un mecanismo de control. El estado (el conjunto de propiedades, atributos ó datos) de un objeto sólo debe ser modificado por medio de los métodos del propio objeto.</p>

<p>Este documento intitulado &laquo;&nbsp;<a href="http://elviajedelnavegante.blogspot.com/2010/04/poo-encapsulacion-y-abstraccion.html">POO: encapsulación y abstracción </a>&nbsp;&raquo;
 de <a href="http://www.blogger.com/profile/09966712995497159376">Ángel Luis García García </a> esta puesto a diposición bajo la licencia <a href="http://creativecommons.org/licenses/by/2.5/es/">Creative Commons</a>. Puede copiar, modificar bajo las condiciones puestas por la licencia, siempre que esta nota sea visible.</p>


    """,








'/activity/Objetos_y_Clases_YouTube':
    u"""
    <h1> Una introducción a Objetos y Clases </h1>
    <div class="video">
    <iframe width="640" height="510" src="http://www.youtube.com/embed/D-w9RKQlAsA?rel=0" frameborder="0" allowfullscreen></iframe> </div>
    """,

    '/activity/Objetos_y_Clases_HTML':
            u"""
            
           <h1> ¿Qué es una Clase?</h1>
           
          <p> Cuando decimos “ave”, sabemos que nos referimos a “algo” con plumas, pico, dos patas, etc. No importa realmente si hemos visto un ave o no,
           o si tenemos un ave frente a nosotros; entendemos claramente que la palabra “ave” se refiere a alguna cosa que cumple
           con unas características específicas, se comporta de una forma concreta, etc. No es más que una palabra,
           pero nos permite <b>clasificar</b> las cosas. Por ejemplo, sabemos que una gallina <b>es un</b> ave y que un perro no es un ave.</p>
          <p>
         La clasificación es algo que hacemos todos los días, a cada momento. Cada vez que decimos que algo es
           alguna cosa, estamos clasificándolo, asociándolo a una clase.
          </p>
          <p>
          Sin embargo, sabemos que la palabra ave no se refiere a un animal concreto, sino a una serie de animales.
          Ave es la palabra que usamos para identificarlos en un grupo, en tal caso siempre
          nos referiremos a esta o aquella ave, siempre hablaremos de un animal concreto.
          </p>
          <p>
          En la POO ocurre igual, una clase no es más que una serie de código que define a todos los elementos
          relacionados con ella. Así, podríamos escribir la clase ave colocando en ella todas las características
          que tienen las aves (pico, color, alto, ancho, patas,…) esas características las llamaremos en lenguaje
          de programadores, propiedades o atributos.
          </p>
          
         <p>Pero la cosa no termina allí, resulta que las aves tienen también ciertos mecanismos específicos,
 como <i>comer</i>, <i>dormir</i>, <i>reproducirse</i>, etc. Estos mecanismos los llamamos <b>métodos</b> u <b>operaciones</b>. El conjunto de todos estas
 operaciones definen el <b>comportamiento</b> de las aves.
          </p>
            <p>
Por último, también sabemos que las aves reaccionan ante ciertos sucesos, como <i>peligro</i>, <i>atracción</i>, <i>defensa</i>. A esto lo llamaremos eventos
          </p>
<h1>¿Qué es una Instancia?</h1>
          <p>
          Bien, decíamos que una clase es como la definición de un <b>tipo</b> de objetos, pero no es el objeto en sí, del modo como
          una idea no es una cosa concreta. Así que para sentarnos necesitaremos convertir
           esa idea en algo, en un objeto real; a ese objeto lo llamamos instancia.
          </p>

          <p>
          En un mismo proyecto podemos tener una o más instancias de una misma clase sin problemas.
          </p>

          <p>
          Cada vez que creamos una nueva instancia, ésta adquiere las propiedades, métodos y eventos de
           la clase a la que pertenece (es lo que permite la relación es un), sin embargo, cada instancia es
            independiente de las otras; esto nos da dos ventajas:
          </p>
           <ol>
           <li>Si hacemos algún cambio en la clase, todas las instancias de esta clase se actualizarán automáticamente;
           esto nos permite hacer cambios sin tener que ir a cada una de las instancias (se aplica el mismo principio
           en la herencia, aunque a un nivel diferente). </li>
            <li> Al ser independientes de las otras instancias, podemos darles valores diferentes sin que afecten
            a las demás.
             Aunque comparten la misma estructura, pueden programarse individualmente, dando versatilidad y
             flexibilidad al código.</li>

           </ol>
          <p>
          </p>

            """
    }    


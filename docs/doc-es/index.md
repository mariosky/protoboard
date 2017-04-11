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
* En todos los casos puedes indicar entre llaves dobles {{ }} la pista que se dará al
estudiante en caso de que lo requiera.  

Para el ejemplo anterior el estudiante vería el siguiente cuestionario:

![](https://mariosky.github.io/protoboard/assets/QuizExample.png)


## Ejercicios de Programación

## Videos
## HTML


# Crear Cursos
## Árbol de Actividades
## Agregar Actividades
## Reglas de Secuenciado












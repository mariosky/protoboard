## Instalación

Si queres agregar funcionalidad o adaptar la plataforma a tus necesidades
debes primero instalar los requerimenientos necesarios para ejecutar localmente 
el proyecto. En la figura se muestran los servicios con los que
debemos contar para poder ejecutar protoboard. En producción debemos contar
con por lo menos dos servidores, uno para montar el servidor web de django y otro
para ejecutar los ejercicios de programación.  En nuestra máquina personal
vamos a tener el segundo servidor de manera virtual con dos máquinas ejecutando 
dentro del gestor Vagrant. Primero empezaremos por instalar todo dentro de
tu computadora, le vamos a llamar LocalHost y a la parte virtual le llamaremos 
Vagrant. 

![](https://mariosky.github.io/protoboard/protoboard-components.png)



## LocalHost

Como vemos en la figura, al final vamos a tener tres servidores:

*   ***django*** Este es el servidor de la aplicación Web, vamos a ejecutar el 
servidor de desarrollo que viene en el framework de django, es solo de prueba.

*   ***MongoDB*** En este servidor NO SQL se van a guardar las actividades de
aprendizaje. La idea es que las actividades las podamos compartir y básicamente
son documentos en formato JSON.

*   ***PosgreSQL*** En este servidor de bases de datos se guardará todo lo demás,
la información de los estudiantes, los cursos, la secuencia de las actividades. Aquí 
está el modelo de nuestro sistema.


## Primero el Ambiente Developer de Python

Para empezar a programar debemos primero contar con nuestro ambiente básico de
desarrollo, en este caso hablaré de la instalación en macOS, pero es casi lo mismo en Linux.
Te recomiendo seguir la [guía de instalación de Sourabh](http://sourabhbajaj.com/mac-setup/) 
para la instalación del ambiente. Este es el checklist inicial:

### Homebrew 
Homebrew es un sistema libre de gestión de paquetes para macOS, nos permite instalar
casi todo lo que ocupamos de una manera rápida. 

### git / GitHub 
Git es una herramienta básica, para el control de versiones del código, lo que
nos permitirá trabajar en equipo y en nuestro caso compartir lo que hacemos. 
Debes de instalarl git localmente y si no lo haz hecho aún, antes si quiera
continuar leyendo, debes crear tu cuenta en GitHub, la aplicación Web que nos brinda
de manera gratuita un servidor git y muchos más servicios para nuestros programas
de código abierto. Por ejemplo esto que estás leyendo está hospedado en GitHub.

### Python 










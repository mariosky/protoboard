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
para la instalación del ambiente, basándonos en la guía este es el checklist inicial:

### Xcode (macOS) 
Para instalar algunos componentes, es necesario tener instalado Xcode. Puedes bajarlo
del [Appstore](https://developer.apple.com/xcode/). Para instalar las herramientas de
línea de comando debemos ejecutar el siguiente comando en la terminal

```
xcode-select --install
``` 

### Homebrew (macOS) 
Homebrew es un sistema libre de gestión de paquetes para macOS, nos permite instalar
casi todo lo que ocupamos de una manera rápida. Para instalarlo puedes hacer
Copy-Paste del siguiente comando a tu terminal :

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Agregamos la ruta de Homebrew a nuestra variable de entorno PATH.

```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
```
Por último revisamos que todo esté bien:

```
brew doctor
```

### git / GitHub 
Git es una herramienta básica, para el control de versiones del código, lo que
nos permitirá trabajar en equipo y en nuestro caso compartir lo que hacemos. 
Debes de instalarl git localmente y si no lo haz hecho aún, antes si quiera
continuar leyendo, debes crear tu cuenta en GitHub, la aplicación Web que nos brinda
de manera gratuita un servidor git y muchos más servicios para nuestros programas
de código abierto. Por ejemplo esto que estás leyendo está hospedado en GitHub.

```
brew install git
```

### Python 2.7 
Se recomienda instalar alguna distribución como [Anaconda](https://www.continuum.io/anaconda-overview)
o [Enthought Canopy](https://www.enthought.com/downloads/), este último cuenta con
Licencia Académica. En este caso utilizaremos Homebrew para instalar Python 2.7 estándar.

```
brew install python
```

### PIP y setup-tools
Es el Homebrew o apt-get de Python, va de la mano con virtualenv, ya que nos puede
instalar de manera automática los módulos y versiones que ocupa. Este programa se
instala por el comando anterior, para actualizarlos:

```
pip install --upgrade setuptools
pip install --upgrade pip
```

### Ansible (opcional)
En caso de que deses ejecutar programas localmente, de una vez instalamos Ansible:
```
pip install ansible
pip install --upgrade pip
```

### virtualenv 
Esta herramienta no sirve para crear ambientes de ejecución aislados. En lugar de
utilizar los módulos de Python globales, por ejemplo los instalados por Anaconda,
crearemos un ambiente aislado con solo aquellos módulos que requerimos para nuestro 
proyecto. Es decir vamos a empacar las versiones específicas y los módulos requeridos  
para la ejecución del proyecto. Para instalar:

```
pip install virtualenv
```

### Editor de Texto o IDE
Un recomendación es PyCharm (https://www.jetbrains.com/pycharm/) el cual cuenta con versiones
académicas y para proyectos open-source. Pero puedes utilizar cualquier editor de tu preferencia,
casi todos tienen algún modo de edición para Python. 


## Instalación de Protoboard 
El primer paso es crear el ambiente virtual donde instaleremos el proyecto.
En tu folder de trabajo:

```
virtualenv protoboard_local
```
Una vez creado el ambiente nos movemos dentro del proyecto:
```
cd protoboard_local
```
Activamos el ambiente, fíjate como el prompt cambia. 
```
source bin/activate
```
Clonamos el proyecto protoboard:
```
git clone https://github.com/mariosky/protoboard.git
```
Instalamos las dependencias:
```
sudo pip install -r protoboard/requirements.txt
```
El comando anterior instala dentro del ambiente los módulos de Python 
necesarios para ejecutar el proyecto de manera local. Antes de configurar 
el proyecto de django debemos instalar los componentes que faltan.

















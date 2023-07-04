# Instalación de Protoboard
 
Modificación otra

## Pre-requisitos

#### PostgreSQL
 - [macOS](https://www.postgresql.org/download/macosx/)

Debemos crear un rol con privilegios de administrador llamado *django*. 
Creamos la base de datos *protoboard* que tiene como dueño al rol *django*. 
No debemos olvidar especificar el password para *django*.
 

#### MongoDB
  - macOS [mongodb.com](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/)
```
brew tap mongodb/brew 
brew install mongodb-community@6.0
```
  - Compass [aquí](https://www.mongodb.com/products/compass)
 1. Crear una base de datos *protoboard_database* con la colección *activities_collection*.
 2. Exportamos el archivo json con las actividaes de muestra.:www:
  
#### Requerimientos de python
  - Python 3+ 
  - Requerimientos del archivo `requirements.txt`
  Instalar en el mismo folder donde se clonó el repo
```
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

#### Configuración
La configuración de la aplicación se realiza en un archivo *.env* dentro
del directorio `protobard`.

Las variables de entorno que se deben especificar son:

```
DATABASE_URL=psql://django:masterkey@127.0.0.1:5432/protoboard
MONGO_DB=mongodb://127.0.0.1:27017/
REDIS_URL=redis://127.0.0.1:6379/0
EMAIL_HOST_USER=mario@aulacode.com
EMAIL_HOST_PASSWORD=mexbulnut
DEFAULT_FROM_EMAIL=act@aulacode.com
ALLOWED_HOSTS=localhost,127.0.0.1
DEBUG=TRUE
```
En este caso se muestran valores para una configuración local 
de desarrollo.

#### Carga un Backup de MongoDB y PostgreSQL. 
Utilizando un script podemos cargar un respaldo de actividades y cursos de prueba.

```
psql -U django postgres < backup.sql
```

### Para los ejercicios de programación debemos instalar el sandbox

#### Redis
 - macOS (Homebrew)
```
brew install redis
```

#### Tailwindcss
```
tailwindcss -i input.css -o ./activitytree/static/assets/css/output.css --watch
```
Para producción:
```
tailwindcss -i input.css -o ./activitytree/static/assets/css/style.css --minify
```

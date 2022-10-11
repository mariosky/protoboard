# Instalación de Protoboard

## Pre-requisitos

#### PostgreSQL
 - [macOS](https://www.postgresql.org/download/macosx/)

#### Redis
 - macOS (Homebrew)
```
brew install redis
```

#### MongoDB
  - macOS [mongodb.com](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/)
```
brew tap mongodb/brew 
brew install mongodb-community@6.0
```
  - Compass [aquí](https://www.mongodb.com/products/compass)

#### Requerimientos de python
  - Python 3+ 
  - Requerimientos del archivo `requirements.txt`
  Instalar en el mismo folder donde se clonó el repo
- ```
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```



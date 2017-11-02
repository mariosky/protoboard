# Instalación rápida con Docker compose


```
docker-compose up
```

Desde otra terminal:

```
docker-compose run web python scripts/set_site_name.py 1
docker-compose run web python manage.py migrate auth
```

```
docker-compose run web python manage.py migrate
docker-compose run web python scripts/create_view.py
docker-compose run web python scripts/create_test_users.py

```

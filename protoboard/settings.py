# -*- coding: utf-8 -*-
"""
Django settings for protoboard project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)


import os


FACEBOOK_APP_ID = "XXEXAMPLEXXXXXXXXXXXXXXXXXXXXX"
FACEBOOK_APP_SECRET = "XXEXAMPLEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
FACEBOOK_REDIRECT_URL = "http://localhost:8000/facebook/login/"


GOOGLE_REDIRECT_URL = "postmessage"
GOOGLE_APP_SECRET = "EXAMPLEXXXXXXXXXX"
GOOGLE_APP_ID  = "blahblahblahblahblahblahblahblahp.apps.googleusercontent.com"

ACCOUNT_ACTIVATION_DAYS = 7
REGISTRATION_AUTO_LOGIN = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 465
EMAIL_HOST_USER = 'user@example.com'
EMAIL_HOST_PASSWORD = 'XXXXXXXXXXX'
EMAIL_USE_SSL = True
REGISTRATION_FORM='registration.forms.RegistrationFormUniqueEmail'


#We include our own RegisterForm
#INCLUDE_REGISTER_URL=False


# Mongo Host
MONGO_DB = 'mongodb://mongodb:27017/'

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

AUTHENTICATION_BACKENDS = (
#      'social.backends.google.GooglePlusAuth',
  'activitytree.backends.FacebookBackend',
  'django.contrib.auth.backends.ModelBackend',)


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '-or!*b&6i1v@n+966!34z0b4cph%+6$#"!#"!$#"!$##2322!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['localhost']
SITE_ID = 1

# Application definition

INSTALLED_APPS = (

	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.sites',
    'django.contrib.auth',
	'django.contrib.staticfiles',
    'registration',
    'activitytree',
)

MIDDLEWARE_CLASSES = (
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.common.CommonMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.messages.middleware.MessageMiddleware',
	'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'protoboard.urls'

WSGI_APPLICATION = 'protoboard.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}

from os.path import join

TEMPLATE_DIRS = (
    join(BASE_DIR,  'templates_local'),
	join(BASE_DIR,  'templates'),

)



# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/
LOCALE_PATHS = (
    os.path.join(BASE_DIR, 'activitytree/locale/'),
)



ugettext = lambda s: s

LANGUAGES = (
    ('en', ugettext('English')),
    ('es-mx', ugettext('Español México')),
)

SITE_ID = 1

LANGUAGE_CODE = 'es-mx'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': join(BASE_DIR,  'debug.log'),
        },
    },
    'loggers': {
        'django.request': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'
#For testing this is fine, but please use you own
MEDIA_URL = "https://s3.amazonaws.com/mariogarcia/"
LOGIN_REDIRECT_URL ="/login"

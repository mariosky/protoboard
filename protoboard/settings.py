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
import environ
from pathlib import Path
from django.core.management.utils import get_random_secret_key

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'



env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False), TEMPLATE_DEBUG=(bool, False)
)


environ.Env.read_env()

DEBUG = env('DEBUG')
TEMPLATE_DEBUG = env('TEMPLATE_DEBUG')
SECRET_KEY = get_random_secret_key()
MONGO_DB = env('MONGO_DB')


REDIS_URL = env('REDIS_URL')
DATABASES = {
    'default': env.db(),

}

TEMPLATE_DIR="mytemplates"
#BASE_DIR = os.path.dirname(os.path.dirname(__file__))
BASE_DIR = Path(__file__).resolve().parent.parent

AUTHENTICATION_BACKENDS = (
    # Needed to login by username in Django admin, regardless of `allauth`
    'django.contrib.auth.backends.ModelBackend',

)

SESSION_COOKIE_SECURE=True
SESSION_COOKIE_HTTPONLY=True
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTOCOL', 'https')




ALLOWED_HOSTS =  env.list('ALLOWED_HOSTS')
SITE_ID = 1

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
	'django.contrib.contenttypes',
	'django.contrib.sessions',
	'django.contrib.sites',
    'django.contrib.auth',
	'django.contrib.staticfiles',
    'django.contrib.messages',
   # 'channels',
    'widget_tweaks',
    'activitytree',
)


MIDDLEWARE = (
	'django.contrib.sessions.middleware.SessionMiddleware',
	'django.middleware.common.CommonMiddleware',
	'django.middleware.csrf.CsrfViewMiddleware',
	'django.contrib.auth.middleware.AuthenticationMiddleware',
	'django.contrib.messages.middleware.MessageMiddleware',
	'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'protoboard.urls'


#ASGI_APPLICATION = "protoboard.routing.application"

WSGI_APPLICATION = 'protoboard.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases



from os.path import join



TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [join(BASE_DIR, TEMPLATE_DIR),
            # insert your TEMPLATE_DIRS here
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                # Insert your TEMPLATE_CONTEXT_PROCESSORS here or use this
                # list if you haven't customized them:
                'django.contrib.auth.context_processors.auth',
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.media',
                'django.template.context_processors.static',
                'django.template.context_processors.tz',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

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

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")
SESSION_COOKIE_SAMESITE = None

LOGOUT_REDIRECT_URL ="/"

__author__ = 'mariosky'

import psycopg2
import os
import sys
from django.conf import settings
from django.core.wsgi import get_wsgi_application
sys.path.append('/code')


SITE_ID =""

if len(sys.argv) == 2:
    SITE_ID = sys.argv[1]
else:
    print ("You need to send the Site Id as a parameter.")
    exit()

print ("####### DJANGO SETTINGS")
os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
application = get_wsgi_application()

con = psycopg2.connect(database=settings.DATABASES['default']['NAME'],user=settings.DATABASES['default']['USER'],
                       host=settings.DATABASES['default']['HOST'],password=settings.DATABASES['default']['PASSWORD'],)
print (con)

cur = con.cursor()


try:
    cur.execute("""UPDATE django_site
   SET domain=%s, name=%s where id=1;""",(SITE_ID,SITE_ID))
except Exception as e:
    print (e.message)
    print ("""Error on: UPDATE django_site""")


con.commit()

cur.close()
con.close()

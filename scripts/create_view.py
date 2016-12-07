__author__ = 'mariosky'

import psycopg2
import os
import sys
from django.conf import settings
from django.core.wsgi import get_wsgi_application



SITE_ID =""




if len(sys.argv) == 2:
    SITE_ID = sys.argv[1]
else:
    print "You need to send the Site Id as a parameter."
    exit()

print "####### DJANGO SETTINGS"
os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
application = get_wsgi_application()

con = psycopg2.connect(database=settings.DATABASES['default']['NAME'],user=settings.DATABASES['default']['USER'],
                       host=settings.DATABASES['default']['HOST'],password=settings.DATABASES['default']['PASSWORD'],)
print con

cur = con.cursor()

cur.execute("""CREATE OR REPLACE VIEW activitytree_ula_vw AS
 SELECT ul.user_id, ul.learning_activity_id, ul.pre_condition, ul.progress_status, ul.objective_status, ul.objective_measure, la.parent_id, la.rollup_progress,  la.name
   FROM activitytree_learningactivity la
   JOIN activitytree_userlearningactivity ul ON la.id = ul.learning_activity_id;""")


cur.execute( """ALTER TABLE activitytree_ula_vw OWNER TO %s;""" % settings.DATABASES['default']['USER'])

cur.execute("""ALTER TABLE auth_user
  ADD CONSTRAINT auth_user_email_key UNIQUE(email);
COMMENT ON CONSTRAINT auth_user_email_key ON auth_user IS 'Unique email ';""")



cur.execute("""UPDATE django_site
   SET domain=%s, name=%s where id=1;""",(SITE_ID,SITE_ID))


con.commit()

cur.close()
con.close()
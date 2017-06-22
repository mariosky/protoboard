__author__ = 'mariosky'

import psycopg2
import os
import sys
from django.conf import settings
from django.core.wsgi import get_wsgi_application


print "####### DJANGO SETTINGS"
os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
application = get_wsgi_application()

con = psycopg2.connect(database=settings.DATABASES['default']['NAME'],user=settings.DATABASES['default']['USER'],
                       host=settings.DATABASES['default']['HOST'],password=settings.DATABASES['default']['PASSWORD'],)
print con

cur = con.cursor()

try:
    cur.execute("""CREATE OR REPLACE VIEW activitytree_ula_vw AS
 SELECT ul.user_id, ul.learning_activity_id, ul.pre_condition, ul.progress_status, ul.objective_status, ul.objective_measure, la.parent_id, la.rollup_progress,  la.name
   FROM activitytree_learningactivity la
   JOIN activitytree_userlearningactivity ul ON la.id = ul.learning_activity_id;""")
except Exception as e:
    print e.message
    print """CREATE OR REPLACE VIEW activitytree_ula_vw """


try:
    cur.execute( """ALTER TABLE activitytree_ula_vw OWNER TO %s;""" % settings.DATABASES['default']['USER'])
except Exception as e:
    print e.message
    print """Error on: ALTER TABLE activitytree_ula_vw OWNER TO """


try:
    cur.execute("""ALTER TABLE auth_user
      ADD CONSTRAINT auth_user_email_key UNIQUE(email);
      COMMENT ON CONSTRAINT auth_user_email_key ON auth_user IS 'Unique email ';""")
except Exception as e:
    print e.message
    print """Error on: ADD CONSTRAINT auth_user_email_key UNIQUE"""



con.commit()

cur.close()
con.close()


if __name__ == "__main__":
    import os
    from django.core.wsgi import get_wsgi_application

    print "####### DJANGO SETTINGS"

    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()

from django.contrib.auth.models import User
from activitytree.interaction_handler import SimpleSequencing
from activitytree.models import LearningStyleInventory

estudiantes = [
('edgar',          '1234',17,13,16,12,14,16, 9),
('osuna',       '1234',15,12,14,18,14,19, 8),
('malu',         '1234', 7,10, 4, 8,17,14,16),
('jose',        '1234',17, 6,16,13,14,11, 8),
('david',         '1234',15,10,13,14,17,15,11),
('juan',    '1234',11,13,11,10,13,18, 8),
('cota',              '1234',13, 7,18,14,12,10,13),
('omar',            '1234', 7, 3, 7,12,16,17, 6),
('santana',           '1234',10, 9,13,13,13,14,13),
('hector',  '1234', 1,11,11,11,18,13,13),
('edie',           '1234',14, 6,16,12,12,13,12),
('baby',      '1234',15,18,20,17,13,18,17),
('saul',            '1234',13,11,14,11,14,14,13),
('brenda',             '1234',17,13,20,12,14,11,16),
('samara',         '1234',14,15,13,12,15,16,12),
('daniel',      '1234', 9, 8,15,11,13,14,13),
('jorge',           '1234',17,12,14,17,19,18,14),
('mike',             '1234',15,16,17,18,18,13,11),
('luis',            '1234',11, 7,11,10,11,12, 6)]

for e in estudiantes:
    User.objects.filter(username=e[0]).delete()
    u = User.objects.create_user(e[0],e[0], e[1])
    u.is_active = True
    u.save()
    lsu=LearningStyleInventory(visual=e[2],verbal=e[3],aural=e[4],physical=e[5],logical=e[6],
                          social=e[7], solitary=e[8], user = u)
    lsu.save()
    print e[0], e[1]

from django.core.management.base import BaseCommand, CommandError

import psycopg2
import sys
from django.conf import settings
sys.path.append('/code')


class Command(BaseCommand):
    help = 'Creates Activity Tree View'

    def handle(self, *args, **options):
        con = psycopg2.connect(database=settings.DATABASES['default']['NAME'],
                               user=settings.DATABASES['default']['USER'],
                               host=settings.DATABASES['default']['HOST'],
                               password=settings.DATABASES['default']['PASSWORD'], )
        print(con)

        cur = con.cursor()

        try:
            cur.execute("""CREATE OR REPLACE VIEW activitytree_ula_vw AS
         SELECT ul.user_id, ul.learning_activity_id, ul.pre_condition, ul.progress_status, ul.objective_status, ul.objective_measure, la.parent_id, la.rollup_progress,  la.name
           FROM activitytree_learningactivity la
           JOIN activitytree_userlearningactivity ul ON la.id = ul.learning_activity_id;""")
        except Exception as e:
            self.stdout.write(e)
            self.stdout.write("""CREATE OR REPLACE VIEW activitytree_ula_vw """)

        try:
            cur.execute("""ALTER TABLE activitytree_ula_vw OWNER TO %s;""" % settings.DATABASES['default']['USER'])
        except Exception as e:
            self.stdout.write(e.message)
            self.stdout.write("""Error on: ALTER TABLE activitytree_ula_vw OWNER TO """)

        con.commit()

        cur.close()
        con.close()
        self.stdout.write(self.style.SUCCESS('Vista creada correctamente'))







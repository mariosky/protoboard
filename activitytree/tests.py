__author__ = 'mario'

if __name__ == "__main__":
    import os
    from django.core.wsgi import get_wsgi_application

    print "####### DJANGO SETTINGS"

    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()





#from django.test import TestCase
from activitytree.interaction_handler import *
from activitytree.models import *
from django.contrib.auth.models import User
from activitytree.courses import *


def setup():
    test_users = [
        ('test', '1234', 17, 13, 16, 12, 14, 16, 9),
        ('demo', '1234', 15, 12, 14, 18, 14, 19, 8),
        ('doe', '1234', 7, 10, 4, 8, 17, 14, 16)]

    users = []

    for e in test_users:
        User.objects.filter(username=e[0]).delete()
        u = User.objects.create_user(e[0], e[0]+'@gmail.com', e[1])
        u.is_active = True
        u.save()
        users.append(u)
        lsu = LearningStyleInventory(visual=e[2], verbal=e[3], aural=e[4], physical=e[5], logical=e[6],
                                     social=e[7], solitary=e[8], user=u)
        lsu.save()



    #Create A Course from file

    list_course_file = open('../scripts/ListPractice.json')
    list_course_json = list_course_file.read()
    print list_course_json
    course_id,course_uri = create_empty_course('myTest',users[0])
    upload_course_from_json( list_course_json,course_id, users[0])


learning_activity  = LearningActivity.objects.filter(name="Ordena la Lista")[0]
user = User.objects.filter(username='doe')[0]
print user
user_learning_activity  = UserLearningActivity.objects.filter(learning_activity=learning_activity,user=user)
rule = user_learning_activity[0].parse_rollup_rule("completed IF All completed")
#user_learning_activity[0].eval_rollup_rule("completed IF All completed")

print rule

query = """SELECT count(*) as count, (  SELECT count(*)
                            FROM activitytree_ula_vw
                            WHERE parent_id = %s
                            AND user_id = %s
                            AND rollup_%s = TRUE ) as total
FROM   activitytree_ula_vw U
WHERE  parent_id = %s
AND user_id = %s AND ( %s_status = '%s' OR pre_condition = 'skip') AND rollup_%s = TRUE """ % (
learning_activity.id,
user.id, rule['status_type'], learning_activity.id, user.id,
rule['status_type'], rule['antecedent_status'], rule['status_type'])

print query
ss = SimpleSequencing()
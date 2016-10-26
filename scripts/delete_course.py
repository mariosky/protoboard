


if __name__ == "__main__":
    import os
    import sys

    from django.core.wsgi import get_wsgi_application
    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()

    from activitytree.models import Course,ActivityTree,LearningActivity, UserLearningActivity

    if len(sys.argv) == 2:
        course = None
        try:
            print "Deleting Course"
            ID = sys.argv[1]
            course = Course.objects.get(pk=ID)
            course.delete()
        except Exception as e:
            print "Deleting Course -- An exception was thrown."
            print  e.message
        try:
            print "Deleting User Learning Activity"
            UserLearningActivity.objects.filter(learning_activity__root__parent_id=ID).delete()
            UserLearningActivity.objects.filter(learning_activity__root__id=ID).delete()
        except Exception as e:
            print "Deleting User Learning Activity -- An exception was thrown."
            print  e.message
        try:
            print "Deleting Learning Activity"
            LearningActivity.objects.filter(root_id=ID).delete()
            LearningActivity.objects.filter(pk=ID).delete()
        except Exception as e:
            print "Deleting Learning Activity -- An exception was thrown."
            print  e.message
        try:
            print "Deleting Activity Tree"
            ActivityTree.objects.filter(root_activity_id=ID).delete()

        except Exception as e:
            print "Deleting Activity Tree-- An exception was thrown."
            print  e.message






            print "Are you sure you want to delete the course: %s" % (course.short_description)






    else:
        print "You need to send the Course Id as a parameter."












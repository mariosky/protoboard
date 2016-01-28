# -*- coding: utf-8 -*-
__author__ = 'mariosky'

if __name__ == "__main__":
    import os
    from django.core.wsgi import get_wsgi_application

    print "####### DJANGO SETTINGS"

    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()




import json
from activitytree.models import LearningActivity, Course, AuthorLearningActivity
from interaction_handler import sql_activity_tree

def create_course_from_json( json_tree, user ):
    activity_tree = json.loads(json_tree)[0]
    _traverse_create(activity_tree, user=user)

def update_course_from_json( json_tree, user):
    activity_tree = json.loads(json_tree)[0]
    _traverse_update(activity_tree, user=user)


def create_empty_course(url,user, short_description=""):
        learning_activity = LearningActivity(
        parent =  None,
        root   =  None,
        name = 'New Course',
        uri = '/activity/'+url)
        learning_activity.save()

        course = Course(short_description=short_description, root=learning_activity)
        course.save()

        auth = AuthorLearningActivity(user=user, learning_activity=learning_activity )
        auth.save()

        return learning_activity.id


def _traverse_create(activity, parent=None, root=None, user=None):
    learning_activity = LearningActivity(
        parent = parent or None,
        root   = root or None,
        name = activity['learning_activity']['name'],
        slug = activity['learning_activity']['slug'],
        uri = activity['learning_activity']['uri'],
        lom = activity['learning_activity']['lom'] or "",
        secondary_text=activity['learning_activity']['secondary_text'],
        attempt_limit=activity['learning_activity']['attempt_limit'] ,
        available_until=activity['learning_activity']['available_until'] ,
        available_from =activity['learning_activity']['available_from'],
        heading=activity['learning_activity']['heading'],
        description =activity['learning_activity']['description'],
        image = activity['learning_activity']['image'],
        pre_condition_rule =activity['learning_activity']['pre_condition_rule'] or "",
        rollup_rule  =activity['learning_activity']['rollup_rule'],
        is_container = activity['learning_activity']['is_container'],
        is_visible = activity['learning_activity']['is_visible'],
        order_in_container = activity['order'],
        choice_exit = activity['learning_activity']['choice_exit'],
        rollup_progress= activity['learning_activity']['rollup_progress'])

    learning_activity.save()

    # Si es raiz es curso
    if root is None:
        root = learning_activity
        curso = Course(short_description=activity['learning_activity']['description'], root=root)
        curso.save()

        auth = AuthorLearningActivity(user=user, learning_activity=root )
        auth.save()



    if 'children' in activity:
        if activity['children']:
            for child in activity['children']:
                _traverse_create(child, learning_activity, root)
    else:
        pass



def _traverse_update(activity, parent=None, root=None, user=None):
    learning_activity = None
    #If root is None then this is the root activity,
    #it must be created in advance, so we get the activity.
    if root is None:
        root = LearningActivity.objects.get(pk=activity['learning_activity']['id'])
        learning_activity = root
    
    elif activity['learning_activity']['id'].startswith('new'):
        learning_activity = LearningActivity(
            parent = parent or None,
            root   = root or None,
            name = activity['learning_activity']['name'],
            slug = activity['learning_activity']['slug'],
            uri = activity['learning_activity']['uri'],
            lom = activity['learning_activity']['lom'] or "",
            secondary_text=activity['learning_activity']['secondary_text'],
            attempt_limit=activity['learning_activity']['attempt_limit'] ,
            available_until=activity['learning_activity']['available_until'] ,
            available_from =activity['learning_activity']['available_from'],
            heading=activity['learning_activity']['heading'],
            description =activity['learning_activity']['description'],
            image = activity['learning_activity']['image'],
            pre_condition_rule =activity['learning_activity']['pre_condition_rule'] or "",
            rollup_rule  =activity['learning_activity']['rollup_rule'],
            is_container = activity['learning_activity']['is_container'],
            is_visible = activity['learning_activity']['is_visible'],
            order_in_container = activity['order'],
            choice_exit = activity['learning_activity']['choice_exit'],
            rollup_progress= activity['learning_activity']['rollup_progress'])
        learning_activity.save()
    else:
        learning_activity = LearningActivity.objects.get(pk=activity['learning_activity']['id'])
        learning_activity.parent = parent or None,
        learning_activity.root   = root or None,
        learning_activity.name = activity['learning_activity']['name'],
        learning_activity.slug = activity['learning_activity']['slug'],
        learning_activity.uri = activity['learning_activity']['uri'],
        learning_activity.lom = activity['learning_activity']['lom'] or "",
        learning_activity.secondary_text=activity['learning_activity']['secondary_text'],
        learning_activity.attempt_limit=activity['learning_activity']['attempt_limit'] ,
        learning_activity.available_until=activity['learning_activity']['available_until'] ,
        learning_activity.available_from =activity['learning_activity']['available_from'],
        learning_activity.heading=activity['learning_activity']['heading'],
        learning_activity.description =activity['learning_activity']['description'],
        learning_activity.image = activity['learning_activity']['image'],
        learning_activity.pre_condition_rule =activity['learning_activity']['pre_condition_rule'] or "",
        learning_activity.rollup_rule  =activity['learning_activity']['rollup_rule'],
        learning_activity.is_container = activity['learning_activity']['is_container'],
        learning_activity.is_visible = activity['learning_activity']['is_visible'],
        learning_activity.order_in_container = activity['order'],
        learning_activity.choice_exit = activity['learning_activity']['choice_exit'],
        learning_activity.rollup_progress= activity['learning_activity']['rollup_progress']
        learning_activity.save()

    if 'children' in activity:
        if activity['children']:
            for child in activity['children']:
                _traverse_update(child, learning_activity, root)
    else:
        pass




def activity_tree(parent, nodes):
    #find children

    if parent is None:
        children = [v for k,v in nodes.items() if  v["parent_id"] is None]
    else:
        children = [v for k,v in nodes.items() if parent == v["parent_id"]]
    print 'children',children
    node_list = []

    if children:
        for child in children:
            _tree = {}
            _tree['id']=child["id"]
            _tree['order']=child["order_in_container"]
            _tree['learning_activity']=child
            _tree['children']=activity_tree(child["id"],nodes)
            node_list.append(_tree)

    return node_list



def get_activity_tree(id):
    tree = sql_activity_tree(id)
    print 'tree',tree
    result = activity_tree(None,tree)
    return result
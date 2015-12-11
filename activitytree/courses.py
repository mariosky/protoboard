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
    _traverse(activity_tree, user=user)


def _traverse(activity, parent=None, root=None, user=None):
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
                _traverse(child, learning_activity, root)
    else:
        pass




def activity_tree(parent, nodes):
    #find children
    _tree = {}
    if parent is None:
        children = [v for k,v in nodes.items() if  v["parent_id"] is None]
    else:
        children = [v for k,v in nodes.items() if parent == v["parent_id"]]

    node_list = []

    if children:
        for child in children:
            _tree['id']=child["id"]
            _tree['order']=child["order_in_container"]
            _tree['learning_activity']=child
            _tree['children']=activity_tree(child["id"],nodes)
        node_list.append(_tree)
    return node_list



def get_activity_tree(id):
    tree = sql_activity_tree(id)
    result = activity_tree(None,tree)
    return result
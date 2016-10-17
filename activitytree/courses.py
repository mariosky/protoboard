# -*- coding: utf-8 -*-
__author__ = 'mariosky'

if __name__ == "__main__":
    import os
    from django.core.wsgi import get_wsgi_application

    print "####### DJANGO SETTINGS"

    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()




import json
from activitytree.models import LearningActivity, Course, AuthorLearningActivity,UserLearningActivity
from interaction_handler import SimpleSequencing
import ast


def update_course_from_json( json_tree, user):
    activity_tree = json.loads(json_tree)[0]
    print "update_course_from_json",activity_tree
    _traverse_update(activity_tree, user=user)



def upload_course_from_json( json_tree,course_id, user):
    activity_tree = json.loads(json_tree)[0]
    print "upload_course_from_json",activity_tree['id']
    activity_tree['id'] = course_id
    print activity_tree['id'], course_id
    print "final",activity_tree
    _traverse_upload(activity_tree, root=None, user=user)


def add_precondition(rule):
    if rule is not None:
        rule = rule.encode('ascii','ignore')
        if 'conditions' in rule:
            try:
                rule = ast.literal_eval(rule)
                if rule['conditions']:
                    string = ''
                    first = True
                    for elem in rule['conditions']:
                        if 'user' in elem or 'context' in elem:
                            if first:
                                first = False
                                if elem['option'] in ( 'level','points','experience','visual','aural','verbal',
                                                                 'physical','logical','social','solitary'):
                                    string += "if self.get_user_attr('{0}') {1} {2}".format(elem['option'],
                                                                                     elem['operator'], elem['value'])
                                elif elem['option']  == "time":
                                    string += "if self.get_time_condition('{0}','{1}','{2}')".format(elem['option'],
                                                                             elem['operator'],  elem['value'])
                                else:
                                    string += "if self.get_user_attr('{0}') {1} '{2}'".format(elem['option'],
                                                                                     elem['operator'], elem['value'])
                            else:

                                if elem['option'] in ( 'level','points','experience','visual','aural','verbal',
                                                                 'physical','logical','social','solitary'):
                                    string += " and self.get_user_attr('{0}') {1} {2}".format(elem['option'],
                                                                                    elem['operator'], elem['value'])
                                elif elem['option'] == "time":
                                    string += " and self.get_time_condition('{0}','{1}','{2}')".format(elem['option'],
                                                                                   elem['operator'], elem['value'])
                                else:
                                    string += " and self.get_user_attr('{0}') {1} '{2}'".format(elem['option'],
                                                                                      elem['operator'], elem['value'])
                        else:
                            if first:
                                first = False
                                if  (elem['option'] == 'num_attempts' or elem['option'] == 'objective_measure'):

                                    string += "if self.get_attr('{0}','{1}') {2} {3}".format(elem['uri'],
                                                                            elem['option'],elem['operator'], elem['value'])
                                else :
                                    string += "if self.get_attr('{0}','{1}') {2} '{3}'".format(elem['uri'], elem['option'],
                                                                                        elem['operator'], elem['value'])
                            else:

                                if elem['option'] == 'num_attempts' or elem['option'] == 'objective_measure':
                                    string += " and self.get_attr('{0}','{1}') {2} {3}".format(elem['uri'], elem['option'],
                                                                                          elem['operator'], elem['value'])
                                else:
                                    string += " and self.get_attr('{0}','{1}') {2} '{3}'".format(elem['uri'],
                                                                           elem['option'], elem['operator'], elem['value'])



                    else:
                        if 'precondition' in rule:
                            string += ":\n" \
                                    "    activity['pre_condition'] = '{0}'\n" \
                                    "else:\n" \
                                    "    activity['pre_condition'] = ''".format(rule['precondition'])
                        else:
                            string += ":\n" \
                                    "    activity['pre_condition'] = ''\n" \
                                    "else:\n" \
                                    "    activity['pre_condition'] = ''"
                    return string
                else:
                    pass
            except Exception:
                pass
        else:
            rule = ""
            return rule
    return rule


def create_empty_course(url,user, name ='New Course', short_description="", is_private=False):
        learning_activity = LearningActivity(
        parent =  None,
        root   =  None,
        is_container = True,
        name = name,

        uri = '/activity/'+url)
        learning_activity.save()

        course = Course(short_description=short_description, root=learning_activity, private=is_private)
        course.save()

        auth = AuthorLearningActivity(user=user, learning_activity=learning_activity )
        auth.save()

        return learning_activity.id,learning_activity.uri





def _traverse_update(activity, parent=None, root=None, user=None):

    learning_activity = None
    #If root is None then this is the root activity,
    #it must be created in advance, so we get the activity.
    if root is None:
        root = LearningActivity.objects.get(pk=activity['id'])

        if 'state' not in activity['learning_activity']:
            print "Root:SAVE"

            root.name = activity['learning_activity']['name']
            root.uri = activity['learning_activity']['uri']
            root.lom = activity['learning_activity']['lom'] or ""
            root.attempt_limit=activity['learning_activity']['attempt_limit']
            root.available_until=activity['learning_activity']['available_until']
            root.available_from =activity['learning_activity']['available_from']
            root.description =activity['learning_activity']['description']
            root.image = activity['learning_activity']['image']
            root.rules = activity['learning_activity']['rules'] or ""
            root.pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or ""
            root.rollup_rule  = ('rollup_rule' in activity['learning_activity'] and  activity['learning_activity']['rollup_rule']) or ""
            root.save()

        learning_activity = root
    
    elif 'state' in activity['learning_activity'] and  activity['learning_activity']['state']=='Added':
        learning_activity = LearningActivity(
            parent = parent,
            root   = root,
            name = activity['learning_activity']['name'],
            uri = activity['learning_activity']['uri'],
            lom = activity['learning_activity']['lom'] or "",
            attempt_limit=activity['learning_activity']['attempt_limit'] ,
            available_until=activity['learning_activity']['available_until'] ,
            available_from =activity['learning_activity']['available_from'],
            description =activity['learning_activity']['description'],
            image = activity['learning_activity']['image'],
            pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or "",
            rollup_rule  = activity['learning_activity']['rollup_rule'],
            is_container = activity['learning_activity']['is_container'],
            is_visible = activity['learning_activity']['is_visible'],
            rules=activity['learning_activity']['rules'] or "",
            order_in_container = activity['learning_activity']['order_in_container'],
            choice_exit = activity['learning_activity']['choice_exit'],
            rollup_progress= activity['learning_activity']['rollup_progress'])
        learning_activity.save()

        #Subscribe students taking the course to the new activity

        subscribed_users = root.activity_tree.all()

        for subscription in subscribed_users:
            ula = UserLearningActivity(user=subscription.user, learning_activity=learning_activity)
            ula.save()

    elif 'state' in activity['learning_activity'] and  activity['learning_activity']['state']=="Deleted":


        learning_activity = LearningActivity.objects.get(pk=activity['learning_activity']['id'])
        learning_activity.delete()


    else:

        #We need to update the learning activity
        learning_activity = LearningActivity.objects.get(pk=activity['learning_activity']['id'])
        learning_activity.parent = parent
        learning_activity.root   = root
        learning_activity.name = activity['learning_activity']['name']
        learning_activity.uri = activity['learning_activity']['uri']
        learning_activity.lom = activity['learning_activity']['lom'] or ""
        learning_activity.attempt_limit=activity['learning_activity']['attempt_limit']
        learning_activity.available_until=activity['learning_activity']['available_until']
        learning_activity.available_from =activity['learning_activity']['available_from']
        learning_activity.description =activity['learning_activity']['description']
        learning_activity.image = activity['learning_activity']['image']
        learning_activity.pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or ""
        learning_activity.rollup_rule  = ('rollup_rule' in activity['learning_activity'] and  activity['learning_activity']['rollup_rule']) or ""
        learning_activity.is_container = activity['learning_activity']['is_container']
        learning_activity.is_visible = activity['learning_activity']['is_visible']
        learning_activity.order_in_container = activity['learning_activity']['order_in_container']
        learning_activity.choice_exit = activity['learning_activity']['choice_exit']
        learning_activity.rules = activity['learning_activity']['rules'] or ""
        learning_activity.rollup_progress= ('rollup_progress' in activity['learning_activity'] and activity['learning_activity']['rollup_progress']) or ""
        print activity['learning_activity']['name'].encode('utf-8'),activity['learning_activity']['choice_exit']
        learning_activity.save()

    if 'children' in activity:
        if activity['children']:
            for child in activity['children']:
                _traverse_update(child, parent=learning_activity, root=root)
    else:
        pass


def _traverse_upload(activity, parent=None, root=None, user=None):

    learning_activity = None
    #If root is None then this is the root activity,
    #it must be created in advance, so we get the activity.
    if root is None:

        root = LearningActivity.objects.get(pk=activity['id'])
        learning_activity = root
        print "upload root", root, root.id,activity['id']


    else:
        learning_activity = LearningActivity(
            parent = parent,
            root   = root,
            name = activity['learning_activity']['name'],
            uri = activity['learning_activity']['uri'],
            lom = activity['learning_activity']['lom'] or "",
            attempt_limit=activity['learning_activity']['attempt_limit'] ,
            available_until=activity['learning_activity']['available_until'] ,
            available_from =activity['learning_activity']['available_from'],
            description =activity['learning_activity']['description'],
            image = activity['learning_activity']['image'],
            pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or "",
            rollup_rule  =('rollup_rule' in activity['learning_activity'] and  activity['learning_activity']['rollup_rule']) or "",
            is_container = activity['learning_activity']['is_container'],
            is_visible = activity['learning_activity']['is_visible'],
            rules=activity['learning_activity']['rules'] or "",
            order_in_container = activity['learning_activity']['order_in_container'],
            choice_exit = activity['learning_activity']['choice_exit'],
            rollup_progress= ('rollup_progress' in activity['learning_activity'] and activity['learning_activity']['rollup_progress']) or "")
        learning_activity.save()
        print "upload activity",learning_activity


    if 'children' in activity:
        if activity['children']:
            for child in activity['children']:
                _traverse_upload(child, parent=learning_activity, root=root)
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
    ss = SimpleSequencing()
    tree = ss.sql_activity_tree(id)
    result = activity_tree(None,tree)
    print 'get',result
    return result
# -*- coding: utf-8 -*-
__author__ = 'mariosky'



if __name__ == "__main__":
    import os
    from django.core.wsgi import get_wsgi_application

    print("####### DJANGO SETTINGS")

    os.environ['DJANGO_SETTINGS_MODULE'] = "protoboard.settings"
    application = get_wsgi_application()


import json
from activitytree.models import LearningActivity, Course, UserLearningActivity
from .interaction_handler import SimpleSequencing
import ast


def update_course_from_json( json_tree, user):
    activity_tree = json.loads(json_tree)[0]
    print("update_course_from_json",activity_tree)
    _traverse_update(activity_tree, user=user)



def upload_course_from_json( json_tree,course_id, user):
    activity_tree = json.loads(json_tree)[0]
    activity_tree['id'] = course_id
    _traverse_upload(activity_tree, root=None, user=user)


def add_precondition(rule):

    if rule is not None:
        #print('tha rule 1:', rule)
        #rule = rule.encode('ascii','ignore')
        #print('tha rule:', rule)
        if 'conditions' in rule:
            try:
                rule = ast.literal_eval(rule)
                print('tha dict rule:', rule)
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
                                elif elem['option']  == 'time':
                                    string += "if self.get_time_condition('{0}','{1}')".format(elem['operator'],  elem['value'])
                                elif elem['option'] == 'dayof':
                                    string += "if self.get_day_of_week() {0} '{1}'".format(elem['operator'],
                                                                                               elem['value'])
                                else:
                                    string += "if self.get_user_attr('{0}') {1} '{2}'".format(elem['option'],
                                                                                     elem['operator'], elem['value'])
                            else:

                                if elem['option'] in ( 'level','points','experience','visual','aural','verbal',
                                                                 'physical','logical','social','solitary'):
                                    string += " and self.get_user_attr('{0}') {1} {2}".format(elem['option'],
                                                                                    elem['operator'], elem['value'])
                                elif elem['option'] == 'time':
                                    string += " and self.get_time_condition('{0}','{1}')".format(
                                                                                   elem['operator'], elem['value'])
                                elif elem['option'] == 'dayof':
                                    string += "and self.get_day_of_week() {0} '{1}'".format(elem['operator'],
                                                                                           elem['value'])
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

                    if 'precondition' in rule:
                        string += ":\n" \
                                "    activity['pre_condition'] = '{0}'".format(rule['precondition'])
                    else:
                        string += ":\n" \
                                "    activity['pre_condition'] = ''"

                    if 'else' in rule:
                        string +=  "\n" \
                                "else:\n" \
                                "    activity['pre_condition'] = '{0}'".format(rule['else'])
                    else:
                        string += "\n" \
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







def _traverse_update(activity, parent=None, root=None, user=None):

    learning_activity = None
    #If root is None then this is the root activity,
    #it must be created in advance, so we get the activity.
    if root is None:
        root = LearningActivity.objects.get(pk=activity['id'])

        if 'state' not in activity['learning_activity']:
            print("Root:SAVE")

            root.name = activity['learning_activity']['name']
            root.uri = activity['learning_activity']['uri']
            root.attempt_limit=activity['learning_activity']['attempt_limit']
            root.available_until=activity['learning_activity']['available_until']
            root.available_from =activity['learning_activity']['available_from']
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
            attempt_limit=activity['learning_activity']['attempt_limit'] ,
            available_until=activity['learning_activity']['available_until'] ,
            available_from =activity['learning_activity']['available_from'],
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
        learning_activity.attempt_limit=activity['learning_activity']['attempt_limit']
        learning_activity.available_until=activity['learning_activity']['available_until']
        learning_activity.available_from =activity['learning_activity']['available_from']
        learning_activity.pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or ""
        learning_activity.rollup_rule  = ('rollup_rule' in activity['learning_activity'] and  activity['learning_activity']['rollup_rule']) or ""
        learning_activity.is_container = activity['learning_activity']['is_container']
        learning_activity.is_visible = activity['learning_activity']['is_visible']
        learning_activity.order_in_container = activity['learning_activity']['order_in_container']
        learning_activity.choice_exit = activity['learning_activity']['choice_exit']
        learning_activity.rules = activity['learning_activity']['rules'] or ""
        learning_activity.rollup_progress= ('rollup_progress' in activity['learning_activity'] and activity['learning_activity']['rollup_progress']) or ""
        print(activity['learning_activity']['name'].encode('utf-8'),activity['learning_activity']['choice_exit'])
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
        print("upload root", root, root.id,activity['id'])


    else:
        learning_activity = LearningActivity(
            parent = parent,
            root   = root,
            name = activity['learning_activity']['name'],
            uri = activity['learning_activity']['uri'],
            attempt_limit=activity['learning_activity']['attempt_limit'] ,
            available_until=activity['learning_activity']['available_until'] ,
            available_from =activity['learning_activity']['available_from'],
            pre_condition_rule = add_precondition(activity['learning_activity']['rules']) or "",
            rollup_rule  =('rollup_rule' in activity['learning_activity'] and  activity['learning_activity']['rollup_rule']) or "",
            is_container = activity['learning_activity']['is_container'],
            is_visible = activity['learning_activity']['is_visible'],
            rules=activity['learning_activity']['rules'] or "",
            order_in_container = activity['learning_activity']['order_in_container'],
            choice_exit = activity['learning_activity']['choice_exit'],
            rollup_progress= ('rollup_progress' in activity['learning_activity'] and activity['learning_activity']['rollup_progress']) or "")
        learning_activity.save()
        print("upload activity",learning_activity)


    if 'children' in activity:
        if activity['children']:
            for child in activity['children']:
                _traverse_upload(child, parent=learning_activity, root=root)
    else:
        pass


def activity_tree(parent, nodes):
    #find children

    if parent is None:
        children = [v for k,v in list(nodes.items()) if  v["parent_id"] is None]
    else:
        children = [v for k,v in list(nodes.items()) if parent == v["parent_id"]]
    print('children',children)
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
    print('get',result)
    return result





def get_course_list(id):
    # id is Root Learning Activity 
    node_list = []

    def traverse(nodes):
        for node in nodes:
            node_list.append((node['learning_activity']['path'], node['learning_activity']['name'], node['order'], node['learning_activity']['uri']))
            if node['children']:
                order = node['children'].sort(key=lambda node: node['order'])
                traverse(node['children'])
            else:
                pass
        return node_list

    tree = get_activity_tree(id)
    node_list = traverse(tree)
    course_list = []
    course_name = None
    subsec_name = None
    for e in node_list:
        path = e[0].split('|')
        depth = len(path)
        if depth == 1:
            continue

        elif depth == 2:
            subsec_name = e[1]
        else:
            course_list.append({'sec': subsec_name, 'title':e[1], 'path':e[0].replace('|','.'), 'uri': e[3]})
    return course_list





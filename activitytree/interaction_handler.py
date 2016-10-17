# -*- coding: utf-8 -*-
#!/usr/bin/env python

from activitytree.models import ActivityTree, UserLearningActivity, User
import xml.etree.ElementTree as ET

from django.db import connection
from django.utils import timezone
import pytz


import datetime
from lxml import etree

#Exceptions



class Error(Exception):
    """Base class for exceptions in this module."""
    pass


class TransitionError(Error):
    """Raised when an operation attempts a state transition that's not
    allowed.

    Attributes:
        previous -- state at beginning of transition
        next -- attempted new state
        message -- explanation of why the specific transition is not allowed
    """

    def __init__(self, previous, next, message):
        self.previous = previous
        self.next = next
        self.message = message


class NotAllowed(Error):
    """Raised when an invalid action is encounterd

    Attributes:
        action  -- action to be executed
        message -- explanation of why the specific action is not allowed
    """

    def __init__(self, action, message):
        self.action = action
        self.message = message

    def __str__(self):
        return """%s not allowed, %s""" % (self.action, self.message,)


class SimpleSequencing(object):
    def __init__(self, context=None):
        self.RECORDS = {}
        self.USER = None
        self.context=context
    def set_current(self, ula):
        atree = ula.get_atree()

        #If there is a current activity don't do anything
        if atree.current_activity:
            if atree.current_activity == ula:
                return
            else:
                raise NotAllowed('Set Current', "Another activity is already the current activity")

        # Set current activity if everything is fine 
        atree.current_activity = ula
        ula.is_current = True
        ula.last_visited = timezone.now()
        ula.save()
        atree.save()

    def get_current(self, ula):
        atree = ula.get_atree()

        if atree.current_activity:
            return atree.current_activity
        else:
            return None

    def get_path(self,current):
        while current.parent:
            yield current
            current = current.parent
        if not current.parent:
            yield current

    def get_current_path(self, current):
        path = [la for la in self.get_path(current.learning_activity)]
        path.reverse()
        return path



    def exit(self, ula, progress_status=None, objective_measure=None, kmdynamics=None, attempt=False):

        atree = ActivityTree.objects.get(user=ula.user, root_activity=ula.learning_activity.get_root())

        if not ula.is_current:
            raise NotAllowed('Set Current', "Can only exit a current activity")
            #pass
        else:
            ula.is_current = False
            atree.current_activity = None
            if progress_status:
                ula.progress_status = progress_status
            if objective_measure is not None:
                ula.objective_measure = objective_measure
            if kmdynamics is not None:
                ula.kmdynamics = kmdynamics
            ula.last_visited = timezone.now()
            if attempt:
                ula.num_attempts += 1
            ula.save()
            atree.save()
            ###
            ### IF  rollup_progress = True
            ###
            ula.rollup_rules()

    def update(self, ula, progress_status=None, objective_measure=None, attempt=False):
        #if not ula.is_current:
        #    raise NotAllowed('Update', "Can only update a current activity")
        #else:
        if progress_status is not None:
            ula.progress_status = progress_status
        if objective_measure is not None:
            ula.objective_measure = objective_measure
        ula.last_visited = timezone.now()
        if attempt:
            ula.num_attempts += 1
        ula.save()

    def suspend(self, user, activity):
        pass

    def resume(self, user, activity):
        pass

    def assignActivityTree(self, user, activity):
        #Only root activities can be assigned
        if activity.parent is None:
            #If Root bring a List of all child nodes recursive
            nodeList = activity.get_children(recursive=True)
            #Plus root
            nodeList.append(activity)
            #Create another tree of UserLearningActiviy instances
            #All init at default values
            for node in nodeList:
                ula = UserLearningActivity(user=user, learning_activity=node)
                ula.save()
            #Create an instance of ActivityTree
            atree = ActivityTree(user=user, root_activity=activity)
            atree.save()
        else:
            raise NotAllowed('Assign Activity Tree', "Only Root Nodes can be assigned")

    def get_next(self, ula, current):
        if current:
            eroot = self.get_nav(ula)
            navlist = [e for e in eroot.iter()]
            current_found = False
            for i, item in enumerate(navlist):
                if (item.get("uri") == current.learning_activity.uri) or current_found:
                    current_found = True
                    if i + 1 >= len(navlist):
                        return None
                    next = navlist[i + 1]

                    if next.get("is_container") == "False" and next.get("pre_condition") <> "disabled":
                        return next.get("id")
            return None
        else:
            return None

    def get_prev(self, ula, current):

        if current:
            eroot = self.get_nav(ula)
            navlist = [e for e in eroot.iter()]
            navlist.reverse()
            current_found = False
            for i, item in enumerate(navlist):
                if (item.get("uri") == current.learning_activity.uri) or current_found:
                    current_found = True
                    if i + 1 >= len(navlist):
                        return None
                    next = navlist[i + 1]

                    if next.get("is_container") == "False" and next.get("pre_condition") <> "disabled":
                        return next.get("id")
            return None
        else:
            return None

    def _get_children(self, id):
        children = [v for k,v in  self.RECORDS.items() if id == v["parent_id"] ]
        return children

    def xml_row(self, row):
        str_dict = {}
        for k,v in row.items():
            str_dict[k]=unicode(v)
        return str_dict

    def sql(self, root_id,user_id):
        query = """
        WITH RECURSIVE nodes_cte AS (
        SELECT 	n.id, n.parent_id, n.name, n.id::TEXT AS path,
                n.description, n.image,  n.uri, n.lom, n.root_id,
                n.pre_condition_rule,
                n.choice_exit, n.attempt_limit, n.available_from,
                n.available_until, n.is_container, n.is_visible, n.order_in_container
        FROM activitytree_learningactivity AS n
        WHERE n.parent_id = %s
            UNION ALL
        SELECT 	c.id, c.parent_id, c.name, c.id::TEXT AS path,
                c.description, c.image,  c.uri, c.lom, c.root_id,
                c.pre_condition_rule,
                c.choice_exit, c.attempt_limit, c.available_from,
                c.available_until, c.is_container, c.is_visible, c.order_in_container
        FROM nodes_cte AS p, activitytree_learningactivity AS c
        WHERE c.parent_id = p.id
        )
        (
        SELECT  la.id, parent_id, name, ''as path,
                 description, image, uri, lom, root_id,
                pre_condition_rule,
                choice_exit, attempt_limit, available_from,
                available_until, is_container, is_visible, order_in_container,
                pre_condition, recommendation_value, progress_status, objective_status,
                objective_measure, last_visited, num_attempts, is_current

        FROM activitytree_learningactivity la, activitytree_userlearningactivity ula

        WHERE la.id = %s
            AND la.id = ula.learning_activity_id
            AND ula.user_id = %s

        UNION ALL
        SELECT  nd.id, parent_id, name,path,
                description, image,  uri, lom, root_id,
                pre_condition_rule,
                choice_exit, attempt_limit, available_from,
                available_until, is_container, is_visible, order_in_container,
                pre_condition, recommendation_value, progress_status, objective_status,
                objective_measure, last_visited, num_attempts, is_current

        FROM nodes_cte AS nd, activitytree_userlearningactivity ula
        WHERE
               nd.id = ula.learning_activity_id
               AND ula.user_id = %s


        ORDER BY path ASC

        );"""

        recs = None
        with connection.cursor() as cur:
            try:
                cur.execute(query,(root_id,root_id,user_id,user_id))
                recs = self.dictfetchall(cur)
                print recs
            finally:
                cur.close()

        for record in recs:
            self.RECORDS[ record["id"]] = dict(record)
        self.USER = User.objects.get(pk=user_id)




    def sql_activity_tree(self,root_id):
        query= """
    WITH RECURSIVE nodes_cte AS (
    SELECT 	n.id, n.parent_id, n.name, n.id::TEXT AS path,
            n.description, n.image, n.uri, n.lom, n.root_id,
            n.pre_condition_rule,
            n.choice_exit, n.attempt_limit, n.available_from,
            n.available_until, n.is_container, n.is_visible, n.order_in_container, n.rules,n.rollup_rule,n.rollup_progress
    FROM activitytree_learningactivity AS n
    WHERE n.id = %s
        UNION ALL
    SELECT 	c.id, c.parent_id, c.name, path || '|'|| c.id::TEXT  AS path ,
         c.description, c.image, c.uri, c.lom, c.root_id,
            c.pre_condition_rule,
            c.choice_exit, c.attempt_limit, c.available_from,
            c.available_until, c.is_container, c.is_visible, c.order_in_container, c.rules,c.rollup_rule,c.rollup_progress
    FROM nodes_cte AS p, activitytree_learningactivity AS c
    WHERE c.parent_id = p.id
    )

    SELECT *
    FROM nodes_cte

    ORDER BY path ASC;"""

        recs = None
        with connection.cursor() as cur:
            try:
                cur.execute(query, (root_id,))

                recs = self.dictfetchall(cur)
            finally:
                cur.close()

        r = {}
        for record in recs:
            r[record["id"]] = dict(record)
        return r




    def dictfetchall(self,cursor):
        "Return all rows from a cursor as a dict"
        columns = [col[0] for col in cursor.description]
        return [
            dict(zip(columns, row))
            for row in cursor.fetchall()
        ]


    def _get_nav(self, id,xml_tree=None):
        #If is the root add the id attribute
        if self.RECORDS[id]["parent_id"] is None:
            xml_tree = ET.Element("item")
            xml_tree.attrib = self.xml_row(self.RECORDS[id])

        children = self._get_children(id)
        children.sort(key=lambda x: x['order_in_container'])
        if children:
            for activity in children:

                exec(activity['pre_condition_rule'])
                activity['pre_condition_rule']=""

                #Add the activities to the xml_tree with the new precondition

                #If stopForwardTraversal stop recursion and return the xml_tree
                #up to this point
                if activity['pre_condition'] == 'stopForwardTraversal':
                    ET.SubElement(xml_tree,'item',self.xml_row(activity))
                    return xml_tree

                #If skip dont include this activity
                #and dont recurse to this activity
                #children activities
                elif activity['pre_condition']  == 'skip':
                    continue

                elif activity['num_attempts'] >=  int(activity['attempt_limit']) and int(activity['attempt_limit']) < 100:
                    activity['pre_condition'] = 'disabled'

                elif activity['pre_condition']  == 'disabled':
                    ET.SubElement(xml_tree, 'item', self.xml_row(activity))
                    continue

                # Recursevly call get nav attaching the current activity to the
                # xml_tree we are constructing
                self._get_nav(activity['id'],ET.SubElement(xml_tree,'item',self.xml_row(activity)))
        else:
            pass
        return xml_tree


    def get_attr(self, uri, attr):
        for k,v in self.RECORDS.items():
            if uri == v["uri"]:
                return v[attr]
        return None

    def get_user_attr(self,attr):
        print self.context,attr
        if hasattr(self.USER, attr):
            return getattr(self.USER, attr)
        if hasattr(self.USER, 'learningstyleinventory'):
            if hasattr(self.USER.learningstyleinventory, attr):
                return getattr(self.USER.learningstyleinventory, attr)
        if hasattr(self.USER, 'userprofile'):
            if hasattr(self.USER.userprofile, attr):
                return getattr(self.USER.userprofile, attr)
        return None

    def get_time_condition(self, opertator, time_value):
        if 'time_zone' in self.context:
            server = timezone.now()
            user_tz = pytz.timezone(self.context['time_zone'])
            print server.astimezone(user_tz).strftime("%H:%M:%S"),opertator,time_value
            return server.astimezone(user_tz).strftime("%H:%M:%S")



    def get_nav(self,root):
        self.RECORDS = {}
        self.sql(root.learning_activity.id,root.user_id)
        return self._get_nav(root.learning_activity.id)

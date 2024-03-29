from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
from django.core.serializers.json import DjangoJSONEncoder
# Create your models here.
from decimal import Decimal


def get_timezone():
    return getattr(settings, 'TIME_ZONE', 'UTC')

###
# MODELS
###


class LearningStyleInventory(models.Model):
    visual = models.PositiveSmallIntegerField()
    verbal = models.PositiveSmallIntegerField()
    aural = models.PositiveSmallIntegerField()
    physical = models.PositiveSmallIntegerField()
    logical = models.PositiveSmallIntegerField()
    social = models.PositiveSmallIntegerField()
    solitary = models.PositiveSmallIntegerField()
    user = models.OneToOneField(User, unique=True, on_delete=models.CASCADE)


class UserProfile(models.Model):
    user = models.OneToOneField(User, unique=True, on_delete=models.CASCADE)
    timezone = models.CharField(max_length=30, null=True)
    reputation = models.PositiveSmallIntegerField(default=80)
    experience = models.PositiveSmallIntegerField(default=0)


class AuthorProfile(models.Model):
    user = models.OneToOneField(User, unique=True, on_delete=models.CASCADE)
    image = models.URLField(blank=True)
    cover_image = models.URLField(blank=True)
    short_about = models.CharField(max_length=128, blank=True)
    about = models.TextField(blank=True)
    location = models.TextField(blank=True)
    web_page = models.CharField(max_length=256, blank=True)
    twitter = models.CharField(max_length=256, blank=True)
    github = models.CharField(max_length=256, blank=True)
    youtube = models.CharField(max_length=256, blank=True)
    twitch = models.CharField(max_length=256, blank=True)
    instagram = models.CharField(max_length=256, blank=True)
    google_scholar = models.CharField(max_length=256, blank=True)
    linkedin = models.CharField(max_length=256, blank=True)

    def student_count(self):
        from django.db import connection
        query = """SELECT count(*)
                   FROM public.activitytree_course as course,
                        public.activitytree_activitytree as tree
                   WHERE course.root_id = root_activity_id
                   AND author_id =  %s;""" % (self.user.id)
        with connection.cursor() as cursor:
            cursor.execute(query)
            row = cursor.fetchone()
        return row[0]


class LearningActivityLocal(models.Model):
    title = models.CharField(max_length=128)
    uri = models.URLField(blank=True, unique=True)

    def get_absolute_url(self):
        return "{uri}/".format(uri=self.uri)

    def __str__(self):
        return "{title}=>{uri}".format(title=self.title, uri=self.uri)


class LearningActivity(models.Model):
    """ Esta clase implementa los nodos del arbol de actividades """
    name = models.CharField(max_length=128)
    uri = models.URLField(blank=True)
    parent = models.ForeignKey(to='LearningActivity',
                               null=True,
                               related_name='children',
                               on_delete=models.CASCADE)
    root = models.ForeignKey(to='LearningActivity',
                             on_delete=models.CASCADE, null=True)
    pre_condition_rule = models.TextField(blank=True)

    choice_exit = models.BooleanField(default=True)
    rollup_rule = models.TextField(blank=True,
                                   default="completed IF All completed")

    rollup_progress = models.BooleanField(default=True)
    # default value of attempt_limit (100) means no restriction
    # in number of attempts, max attempts = 99
    attempt_limit = models.PositiveSmallIntegerField(default=100)

    available_from = models.DateTimeField(null=True)
    available_until = models.DateTimeField(null=True)
    is_container = models.BooleanField(default=False)
    is_visible = models.BooleanField(default=True)

    order_in_container = models.PositiveIntegerField(default=0)
    rules = models.TextField(blank=True)

    def get_absolute_url(self):
        return "/{id}{uri}/".format(id=self.id, uri=self.uri)

    def get_children(self, recursive=False):
        lst = []
        for r in self.children.order_by('order_in_container'):
            lst.append(r)
            if recursive:
                lst.extend(r.get_children(True))
        return lst

    def is_leaf(self):
        if self.is_container:
            return False
        else:
            return True

    def get_root(self):
        if self.root:
            return self.root
        else:
            return self

    def __str__(self):
        return self.name


class UserLearningActivity(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    learning_activity = models.ForeignKey(to='LearningActivity',
                                          on_delete=models.CASCADE)
    pre_condition = models.CharField(max_length=32, default="", blank=True)
    recommendation_value = models.PositiveSmallIntegerField(null=True,
                                                            default=0)
    progress_status = models.CharField(max_length=16, default="incomplete")
    objective_status = models.CharField(max_length=16, default="notSatisfied")
    objective_measure = models.FloatField(null=True, default=0)
    last_visited = models.DateTimeField(null=True, default=None)
    num_attempts = models.PositiveSmallIntegerField(default=0)
    suspended = models.BooleanField(default=False)
    accumulated_time = models.DecimalField(null=True, decimal_places=2,
                                           max_digits=3,
                                           default=Decimal('0.0'))
    is_current = models.BooleanField(default=False)

    class Meta:
        unique_together = ("user", "learning_activity")

    def __unicode__(self):
        return self.user.first_name + ":" + self.learning_activity.name

    def is_root(self):
        if self.learning_activity.parent is None:
            return True
        else:
            return False

    def get_atree(self):
        return ActivityTree.objects.get(user=self.user,
                                        root_activity=self.learning_activity.get_root())

    def eval_pre_condition_rule(self):
        self.pre_condition = ""
        if self.learning_activity.pre_condition_rule != "":
            exec(self.learning_activity.pre_condition_rule)
            super(UserLearningActivity, self).save()

    def eval_post_condition_rule(self):
        self.pre_condition = ""
        if self.learning_activity.post_condition_rule != "":
            exec(self.learning_activity.post_condition_rule)
            super(UserLearningActivity, self).save()

    def get_objective_measure(self, activity_name):   # REVISAR
        activity = UserLearningActivity.objects.select_related('user', 'learning_activity').filter(user=self.user,learning_activity=LearningActivity.objects.filter(name=activity_name))
        if activity[0] is None or activity[0].objective_measure is None:
            return 0
        else:
            return activity[0].objective_measure

    def get_ula_attr(self, activity_name, attr):
        activity = UserLearningActivity.objects.select_related('user','learning_activity').filter(user = self.user,
            learning_activity = LearningActivity.objects.filter(name=activity_name))
        return getattr(activity[0],attr)


            
    def get_children(self, recursive = False):
        l=[]
        for r in UserLearningActivity.objects.filter(learning_activity__parent=self.learning_activity,user=self.user).order_by('learning_activity__order_in_container'):
            l.append(r)          
            if recursive:
                l.extend(r.get_children(True))
        return l
    
    def parse_rollup_rule(self, r):
        """ Rollup Rule:
          (completed | incomplete )
             IF ( (All|Any|None) | ( (AT LEAST) (number) (PERCENT | COUNT) ) ) 
               (completed | incomplete )
        """
        rule = {}
        
        status_values = ['completed' , 'incomplete']
        quantifiers = ['All','Any','None']
        functions = ['PERCENT','COUNT']
        rule_list = r.split()
        
        if rule_list[0] not in status_values:  
            return None #raise Exception: expecting a status value
        else:
            rule['status_type'] = 'progress'
        rule['consequent_status'] = rule_list[0]
        
        if rule_list[1] != 'IF':
            return None #raise Exception: expecting a status value
        
        if rule_list[2] in quantifiers:
            rule['rule_type'] = 'quantifier'
            rule['quantifier'] =  rule_list[2]
        elif rule_list[2] == 'AT' and rule_list[3] == 'LEAST':
            rule['rule_type'] = 'at_least'
        else:
            return None #raise Exception: expecting a status value
        
        if rule['rule_type']=='quantifier':
            if rule_list[3] in status_values:
                rule['antecedent_status'] =  rule_list[3]   
                return rule
            else:
                return None
        elif  rule['rule_type']=='at_least':
            try:
                rule['number'] = float( rule_list[4])
            except ValueError:
                return None
            if rule_list[5] in functions:
                rule['function_value'] =  rule_list[5]
            else: 
                return None
            
            if rule_list[6]  in status_values: 
                rule['antecedent_status'] =  rule_list[6]   
                return rule
            else:
                return None
        else:
            return None #raise Exception: expecting a status value
    
    def eval_rollup_rule(self, r):

        #We parse the rule
        try:
            rule = self.parse_rollup_rule(r)
        except:
           pass
        
        
        from django.db import connection, transaction
        cursor = connection.cursor()
        
        query =  """SELECT count(*) as count, (  SELECT count(*) 
                                                FROM activitytree_ula_vw 
                                                WHERE parent_id = %s 
                                                AND user_id = %s 
                                                AND rollup_%s = TRUE ) as total
                    FROM   activitytree_ula_vw U
                    WHERE  parent_id = %s 
                    AND user_id = %s AND ( %s_status = '%s' OR pre_condition = 'skip') AND rollup_%s = TRUE """  %  (self.learning_activity.id, 
                             self.user.id, rule['status_type'], self.learning_activity.id, self.user.id,
                            rule['status_type'], rule['antecedent_status'],rule['status_type'] )

        cursor.execute(query)
        r = cursor.fetchone()

        #count: How many are completed?

        #total: How many are needed?

        count , total = r

        #We decide according to rule

        if rule['rule_type'] == 'quantifier':
            if rule['quantifier'] == 'All':
                if count == total:
                    consequent_status = rule['consequent_status']
                else:
                    return None
            elif rule['quantifier'] == 'Any':
                if count > 0:
                    consequent_status = rule['consequent_status']
                else:
                    return None
            elif rule['quantifier'] == 'None':
                if count == 0:
                    consequent_status = rule['consequent_status']
                else:
                    return None
        elif rule['rule_type'] == 'at_least':
            if rule['function_value'] == 'COUNT':
                if count >= rule['number']:
                    consequent_status = rule['consequent_status']
                else:
                    return None
            if rule['function_value'] == 'PERCENT':
                if total > 0:
                    if rule['number'] >= count/total:
                        consequent_status = rule['consequent_status']
                    else:
                        return None
                else:
                    return None

        self.progress_status = consequent_status

        super(UserLearningActivity, self).save()
        
    def rollup_rules(self):
        ##Until root
            if self.learning_activity.rollup_rule and self.learning_activity.is_container:
                self.eval_rollup_rule(self.learning_activity.rollup_rule)
            if self.learning_activity.parent != None:
                parent = UserLearningActivity.objects.filter(learning_activity=self.learning_activity.parent,user=self.user)[0]
                parent.rollup_rules()     


class Course(models.Model):
    author = models.ForeignKey(User,on_delete=models.CASCADE,null = True , default=None)
    uri = models.SlugField(blank=True, unique=True)
    root = models.OneToOneField('LearningActivity', on_delete=models.CASCADE)
    metadata = models.JSONField(null=True, encoder=DjangoJSONEncoder)
    related = models.ManyToManyField("self",blank=True)
    def __str__(self):
        return self.uri


class ActivityTree(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    root_activity = models.ForeignKey(to='LearningActivity',
                                      related_name='activity_tree',
                                      on_delete=models.CASCADE)
    current_activity = models.ForeignKey(to='UserLearningActivity',
                                         on_delete=models.SET_NULL,
                                         related_name='current_in',
                                         null=True,
                                         default=None)

    class Meta:
        unique_together = ("user", "root_activity")


#
# Se puede cambiar a CouchDB, MongoDB, Redis, etc.
#
class ULA_Event(models.Model):
    ULA = models.ForeignKey(UserLearningActivity, on_delete=models.CASCADE)
    time_stamp = models.TimeField(auto_now=True)
    context = models.TextField()


class LearningActivityRating(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    learning_activity = models.ForeignKey(LearningActivity, on_delete=models.CASCADE)
    time = models.DateTimeField(auto_now=True)
    rating = models.PositiveSmallIntegerField()
    context = models.PositiveSmallIntegerField()

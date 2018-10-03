# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseNotFound
from django.http import JsonResponse

from django.template.response import TemplateResponse

from django.db.models import Avg, Count
from django.db import IntegrityError
from django.db import transaction
from django.contrib.sites.shortcuts import get_current_site
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import REDIRECT_FIELD_NAME
from django.conf import settings
from django.urls import reverse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import models as auth_models
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.template import RequestContext
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.csrf import csrf_exempt
from django.utils import timezone

#from retest import re_test

import logging
import xml.etree.ElementTree as ET
import uuid

import urllib
from urllib.parse import urlparse
import json

from activitytree.retest import re_test
import pymongo
from pymongo import errors
from pymongo import MongoClient

import redis
import bleach
from activitytree.bleach_whitelist import all_tags, attrs

from activitytree.mongo_activities import Activity

from eval_code.RedisCola import Cola, Task

from activitytree.models import Course, ActivityTree, UserLearningActivity, LearningActivity, ULA_Event, \
    LearningActivityRating, LearningStyleInventory
from activitytree.interaction_handler import SimpleSequencing
from activitytree.models import UserProfile
from activitytree.courses import get_activity_tree, update_course_from_json, create_empty_course, upload_course_from_json
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages

logger = logging.getLogger(__name__)


def welcome(request):
    courses = Course.objects.all()
    print(request)

    if request.user.is_authenticated and request.user != 'AnonymousUser':
        return render(request,
                      'activitytree/welcome.html',
                                   { 'courses': courses
                                   # , 'plus_scope':plus_scope,'plus_id':plus_id
                                   } )
    else:
        return render(request,'activitytree/welcome.html',
                                  {'user_name': None, 'courses': courses
                                   # ,'plus_scope':plus_scope,'plus_id':plus_id
                                   } )


def course_list(request):
    courses = Course.objects.all()

    if request.user.is_authenticated and request.user != 'AnonymousUser':
        return render(request,'activitytree/course_list.html',
                                  {'courses': courses
                                   # , 'plus_scope':plus_scope,'plus_id':plus_id
                                   })
    else:
        return render(request,'activitytree/course_list.html',
                                  {'user_name': None, 'courses': courses
                                   # ,'plus_scope':plus_scope,'plus_id':plus_id
                                   })


def instructor(request):
    if request.user.is_authenticated and request.user != 'AnonymousUser':
        courses = LearningActivity.objects.filter(authorlearningactivity__user=request.user, root=None)

        return render(request, 'activitytree/instructor_home.html',
                                  {'courses': courses
                                   # , 'plus_scope':plus_scope,'plus_id':plus_id
                                   })

    else:
        return HttpResponseRedirect('/accounts/login/?next=%s' % request.path)


def student(request):
    if request.user.is_authenticated and request.user != 'AnonymousUser':
        courses = LearningActivity.objects.filter(authorlearningactivity__user=request.user, root=None)

        return render(request,'activitytree/student_home.html',
                                  {'courses': courses
                                   # , 'plus_scope':plus_scope,'plus_id':plus_id
                                   })

    else:
        return HttpResponseRedirect('/login/?next=%s' % request.path)


def my_courses(request):
    if request.user.is_authenticated and request.user != 'AnonymousUser':
        courses = LearningActivity.objects.filter(authorlearningactivity__user=request.user, root=None)

        return render(request,'activitytree/instructor_home.html',
                                  {'courses': courses
                                   # , 'plus_scope':plus_scope,'plus_id':plus_id
                                   })
    else:
        return HttpResponseRedirect('/login/?next=%s' % request.path)


def my_enrolled_courses(request,
                        status='incomplete'):
    """view that determines if user has unfinished courses, and returns the courses"""

    if request.user.is_authenticated and request.user != 'AnonymousUser':

        courses = Course.objects.filter(root__userlearningactivity__user=request.user,
                                        root__userlearningactivity__progress_status=status)
        return render(request,'activitytree/my_enrolled_courses.html',
                                  {'courses': courses, 'status': status})
    else:
        return HttpResponseRedirect('/login/?next=%s' % request.path)


def course_info(request, course_id):
    # Must have credentials
    if request.method == 'GET':
        mycourse = get_object_or_404(Course, root_id=course_id)
        if request.user.is_authenticated and request.user != 'AnonymousUser':
            # Are yoy taking this course?
            # Are the instructor?

            return render(request,'activitytree/course_info.html',
                                      {'course_id': course_id, 'course': mycourse
                                       })
        else:
            # Genearal AnonymousUser info
            return render('activitytree/course_info.html',
                                      {'course_id': course_id, 'course': mycourse
                                       })

    else:
        return HttpResponseNotFound('<h1>HTTP METHOD IS NOT VALID</h1>')


def course(request, course_id=None):
    # Must have credentials
    if request.user.is_authenticated and request.user != 'AnonymousUser':

        # POST:
        # Add or Delete a New Course
        if request.method == 'POST':

            # IF course_id then a DELETE
            if course_id:
                # Get course and delete only if the user or staff
                mycourse = None
                if not request.user.is_superuser:
                    mycourse = get_object_or_404(LearningActivity, pk=course_id,
                                                 authorlearningactivity__user=request.user)

                if (mycourse or request.user.is_superuser):
                    LearningActivity.objects.filter(root=course_id).delete()
                    LearningActivity.objects.get(id=course_id).delete()

                return HttpResponseRedirect(reverse('my_courses'))

            # IF course_uri IS a CREATE or UPDATE

            if 'course_uri' in request.POST and 'action' in request.POST:
                is_private = 'private' in request.POST
                if request.POST['action'] == 'create':
                    course_id, course_uri = create_empty_course(request.POST['course_uri'], request.user,
                                                                request.POST['course_name'],
                                                                request.POST['course_short_description'],
                                                                is_private)
                    return HttpResponseRedirect(reverse('course', args=[course_id]))

                elif request.POST['action'] == 'update' and 'course_id' in request.POST:


                    mycourse = get_object_or_404(Course, root_id=request.POST['course_id'],
                                                 root__authorlearningactivity__user=request.user)
                    mycourse.short_description = request.POST['course_short_description']
                    mycourse.html_description = bleach.clean(request.POST['html_description'], tags=all_tags,
                                                             attributes=attrs)
                    mycourse.save()
                    mycourse.root.image = request.POST['image_url']
                    mycourse.root.name = request.POST['course_name']
                    mycourse.root.save()

                    return HttpResponseRedirect(reverse('course', args=[request.POST['course_id']]))

                return HttpResponseRedirect(reverse('course', args=[course_id]))


            else:
                return HttpResponseNotFound(u'<h1>Falta información para enviarse a la petición</h1>')
        # GET:
        # Edit course

        elif request.method == 'GET':
            if course_id:
                # Is yours or you are staff?
                mycourse = None
                if not request.user.is_superuser:
                    mycourse = get_object_or_404(Course, root_id=course_id,
                                                 root__authorlearningactivity__user=request.user)

                if (mycourse or request.user.is_superuser):
                    return render(request,'activitytree/course_builder.html',
                                              {'course_id': course_id, 'course': mycourse
                                               })
            else:
                return HttpResponseNotFound('<h1>Course ID not Found</h1>')
    else:
        # please log in
        return HttpResponseRedirect('/login/?next=%s' % request.path)

@login_required()
def profile_tz(request):
    if request.is_ajax():
        if request.method == 'POST':

            data = json.loads(request.body)


            if data['method'] == 'upsert':
                if hasattr(request.user, 'userprofile'):
                    request.user.userprofile.timezone = data['tz']
                    request.user.userprofile.save()
                    request.user.save()
                else:
                    user_profile = UserProfile(timezone=data['tz'],user=request.user)
                    user_profile.save()
                return HttpResponse(json.dumps({"result": "success", "tz":data['tz'], "error": None}), content_type='application/json')
            elif data['method'] == 'delete':
                if hasattr(request.user, 'userprofile'):
                    request.user.userprofile.timezone = None
                    request.user.userprofile.save()
                    request.user.save()
                # Else dont bother
                return HttpResponse(json.dumps({"result": "success", "error": None}),
                                    content_type='application/json')
        elif request.method == 'GET':
            try:
                request.user.userprofile
                return HttpResponse(json.dumps({"result": "found",
                                                "tz":request.user.userprofile.timezone,
                                                "experience":request.user.userprofile.experience,
                                                "reputation":request.user.userprofile.reputation
                                                }), content_type='application/json')
            except ObjectDoesNotExist:
                return HttpResponse(json.dumps( {"result": "not_found", "error": None}), content_type='application/json')

@login_required()
def profile_experience(request):
    if request.is_ajax():
        if request.method == 'POST':

            data = json.loads(request.body)


            if data['method'] == 'upsert':
                if hasattr(request.user, 'userprofile'):
                    request.user.userprofile.experience = data['experience']
                    request.user.userprofile.save()
                    request.user.save()
                else:
                    user_profile = UserProfile(experience=data['experience'], user=request.user)
                    user_profile.save()
                return HttpResponse(json.dumps({"result": "success", "experience": data['experience'], "error": None}),
                                    content_type='application/json')
            elif data['method'] == 'delete':
                if hasattr(request.user, 'userprofile'):
                    request.user.userprofile.experience = None
                    request.user.userprofile.save()
                    request.user.save()
                # Else dont bother
                return HttpResponse(json.dumps({"result": "success", "error": None}),
                                    content_type='application/json')
        elif request.method == 'GET':
            try:
                request.user.userprofile
                return HttpResponse(json.dumps({"result": "found",
                                                "experience": request.user.userprofile.experience,
                                                "reputation": request.user.userprofile.reputation
                                                }), content_type='application/json')
            except ObjectDoesNotExist:
                return HttpResponse(json.dumps({"result": "not_found", "error": None}),
                                    content_type='application/json')

@login_required()
def profile_learning_style(request):
    if request.is_ajax():
        if request.method == 'POST':

            data = json.loads(request.body)


            if data['method'] == 'upsert':
                if hasattr(request.user, 'learningstyleinventory'):
                    request.user.learningstyleinventory.visual = data['visual']
                    request.user.learningstyleinventory.verbal = data['verbal']
                    request.user.learningstyleinventory.aural = data['aural']
                    request.user.learningstyleinventory.physical = data['physical']
                    request.user.learningstyleinventory.logical = data['logical']
                    request.user.learningstyleinventory.social = data['social']
                    request.user.learningstyleinventory.solitary = data['solitary']
                    request.user.learningstyleinventory.save()
                    request.user.save()
                else:
                    user_learningstyleinventory = LearningStyleInventory(visual=data['visual'],
                                               verbal=data['verbal'],
                                               aural = data['aural'],
                                               physical=data['physical'],
                                               logical=data['logical'],
                                               social=data['social'],
                                               solitary=data['solitary'],
                                               user=request.user)
                    user_learningstyleinventory.save()
                return HttpResponse(
                    json.dumps({"result": "success",  "error": None}),
                    content_type='application/json')
            elif data['method'] == 'delete':
                if hasattr(request.user, 'learningstyleinventory'):
                    # Delete record
                    # Else dont bother
                    request.user.learningstyleinventory.delete()

                    pass
                return HttpResponse(json.dumps({"result": "success", "error": None}),
                                    content_type='application/json')
        elif request.method == 'GET':
            try:
                request.user.learningstyleinventory
                return HttpResponse(json.dumps({"result": "found",
                                                "visual":request.user.learningstyleinventory.visual,
                                                "verbal" : request.user.learningstyleinventory.verbal,
                                                "aural" : request.user.learningstyleinventory.aural,
                                                "physical" : request.user.learningstyleinventory.physical,
                                                "logical" :request.user.learningstyleinventory.logical,
                                                "social" : request.user.learningstyleinventory.social,
                                                "solitary" : request.user.learningstyleinventory.solitary
                                                }), content_type='application/json')
            except ObjectDoesNotExist:
                return HttpResponse(json.dumps({"result": "not_found", "error": None}),
                                    content_type='application/json')

# @csrf_exempt
@login_required()
def upload_activity(request):  # view that receives activity data and saves it to database
    if request.is_ajax():
        if request.method == 'POST':
            actividad = json.loads(request.body)
            client = MongoClient(settings.MONGO_DB)
            db = client.protoboard_database
            activities_collection = db.activities_collection

            if actividad['type'] == 'video':
                try:
                    if not actividad['_id']:
                        ## Is a new activity Generate a Global ID
                        actividad['_id'] = '/activity/video/' + str(uuid.uuid1())
                    actividad['content'] = actividad['description']
                    message = activities_collection.update({'_id': actividad['_id'], 'author': actividad['author']},
                                                           actividad, upsert=True)
                    return HttpResponse(json.dumps(message))
                except pymongo.errors.DuplicateKeyError as e:
                    if e.code == 11000:
                        return HttpResponse(json.dumps({'message': 'Duplicated'}))
            elif actividad['type'] == 'text':
                try:
                    if not actividad['_id']:
                        ## Is a new activity Generate a Global ID
                        actividad['_id'] = '/activity/' + str(uuid.uuid1())
                    message = activities_collection.update({'_id': actividad['_id'], 'author': actividad['author']},
                                                           actividad, upsert=True)
                    return HttpResponse(json.dumps(message))
                except pymongo.errors.DuplicateKeyError as e:
                    if e.code == 11000:
                        return HttpResponse(json.dumps({'message': 'Duplicated'}))
            elif actividad['type'] == 'quiz':
                try:
                    if not actividad['_id']:
                        ## Is a new activity Generate a Global ID
                        actividad['_id'] = '/test/' + str(uuid.uuid1())

                    message = activities_collection.update({'_id': actividad['_id'], 'author': actividad['author']},
                                                           actividad, upsert=True)
                    return HttpResponse(json.dumps(message))
                except pymongo.errors.DuplicateKeyError as e:
                    if e.code == 11000:
                        return HttpResponse(json.dumps({'message': 'Duplicated'}))
            elif actividad['type'] == 'prog':
                try:
                    if not actividad['_id']:
                        ## Is a new activity Generate a Global ID
                        actividad['_id'] = '/program/' + str(uuid.uuid1())
                    ## We need to clean the HTML to be rendered to users
                    actividad['instructions'] = bleach.clean(actividad['instructions'], tags=all_tags, attributes=attrs)
                    actividad['HTML_code'] = bleach.clean(actividad['HTML_code'], tags=all_tags, attributes=attrs)

                    message = activities_collection.update({'_id': actividad['_id'], 'author': actividad['author']},
                                                           actividad, upsert=True)
                    return HttpResponse(json.dumps(message))
                except pymongo.errors.DuplicateKeyError as e:
                    if e.code == 11000:
                        return HttpResponse(json.dumps({'message': 'Duplicated'}))
            else:
                "Tipo de actividad no existe"
        elif request.method == 'GET':
            return HttpResponse("Error")
        return HttpResponse("Error")


@login_required()
def build_quiz(request):
    if request.method == 'POST':
        return HttpResponse('Error')
    # GET:
    # Edit course
    elif request.method == 'GET':
        return render(request,'activitytree/quiz_builder.html')
    else:
        return HttpResponseNotFound('<h1>Course ID not Found</h1>')


def search(request):
    if request.method == 'GET':
        return render(request,'activitytree/search.html')
    else:
        return HttpResponseNotFound('not found')


def build_program(request):
    if request.is_ajax():
        if request.method == 'POST':
            return HttpResponseRedirect('/build_program')
        elif request.method == 'GET':
            return render(request,'activitytree/program_builder.html')
    else:
        if request.method == 'POST':
            if request.POST.get('id'):
                return HttpResponse('id')
            return HttpResponseRedirect('/build_program')
        elif request.method == 'GET':
            return render(request,'activitytree/program_builder.html')


@login_required()
def activity_builder(request):
    if request.method == 'POST':
        return HttpResponse('Error')
    elif request.method == 'GET':
        return render(request,'activitytree/activity_builder.html')
    else:
        return HttpResponseNotFound('<h1>Course ID not Found</h1>')


def dashboard(request, path_id):
    if request.user.is_authenticated:
        if request.method == 'GET':

            s = SimpleSequencing()

            # First, the requested_activity  exists??
            # Gets the Learning Activity object from uri
            requested_activity = None
            try:
                requested_activity = UserLearningActivity.objects.get(learning_activity__id=path_id, user=request.user)
            except (ObjectDoesNotExist, IndexError) as e:
                requested_activity = None

            if not requested_activity:
                return HttpResponseNotFound('<h1>Activity not found</h1>')

            # Gets the root of the User Learning Activity
            root = UserLearningActivity.objects.get(learning_activity_id=path_id, user=request.user)

            # Exits last activity, and sets requested activity as current
            # if choice_exit consider complete


            _XML = s.get_nav(root)
            # Escape for javascript
            XML = ET.tostring(_XML, encoding='unicode').replace('"', r'\"')  # navegation_tree = s.nav_to_html(nav)

            return render(request,'activitytree/dashboard.html', {'XML_NAV': XML,
                                                                      'children': requested_activity.get_children(),
                                                                      'uri': root.learning_activity.uri,
                                                                      'root': root.learning_activity.uri,
                                                                      'root_id': '/%s' % (root.learning_activity.id,)

                                                                      })


@csrf_protect
def course_view(request):
    if request.user.is_authenticated and request.user != 'AnonymousUser' and request.method == 'POST':
        rpc = json.loads(request.body)

        if rpc["method"] == 'post_course':
            update_course_from_json(json_tree=rpc['params'][0], user=request.user)
            result = {"result": "added", "error": None, "id": 1}
            return HttpResponse(json.dumps(result), content_type='application/javascript')

        elif rpc["method"] == 'get_course':
            rpc = json.loads(request.body)
            course = get_activity_tree(rpc['params'][0])
            return HttpResponse(json.dumps(course), content_type='application/javascript')
    else:
        result = {"result": "added", "error": "Error", "id": 1}
        return HttpResponse(json.dumps(result), content_type='application/javascript')


def get_context(request):
    context = {}
    if hasattr(request.user, "userprofile"):
        context['time_zone'] = request.user.userprofile.timezone
    return context


def path_activity(request, path_id, uri):
    learning_activity = None
    try:
        learning_activity = LearningActivity.objects.get(pk=path_id)
    except ObjectDoesNotExist:
        return HttpResponseNotFound('<h1>Learning Activity not found</h1>')

    if request.user.is_authenticated:
        root = None

        s = SimpleSequencing(context=get_context(request))

        requested_activity = None

        if request.method == 'GET':
            try:
                requested_activity = UserLearningActivity.objects.get(learning_activity__id=path_id, user=request.user)
            except (ObjectDoesNotExist, IndexError) as e:
                requested_activity = None

            # The requested_activity was NOT FOUND
            if not requested_activity:  # The requested_activity was not found
                # Maybe a
                # 'start' REQUEST?
                #    if 'nav' in request.GET and request.GET['nav'] == 'start':
                if learning_activity and learning_activity.root is None:
                    s.assignActivityTree(request.user, learning_activity)
                    requested_activity = UserLearningActivity.objects.get(learning_activity__id=path_id,
                                                                          user=request.user)
                    _set_current(request, requested_activity, requested_activity, s)
                    return HttpResponseRedirect('/%s%s' % (path_id, uri))
                # If is not a root learning activity then sorry, not found
                else:
                    return HttpResponseNotFound('<h1>Activity not found</h1>')
                    # Else NOT FOUND
                    # else:
                    #    return HttpResponseNotFound('<h1>Activity not found</h1>')

            # We have a valid requested_activity, lets handle OTHER NAVIGATION REQUEST

            # Get root of activity tree
            root = \
            UserLearningActivity.objects.filter(learning_activity=requested_activity.learning_activity.get_root(),
                                                user=request.user)[0]
            # 'continue' REQUEST?
            if requested_activity.is_root() and 'nav' in request.GET and request.GET['nav'] == 'continue':
                current_activity = s.get_current(requested_activity)
                if current_activity:
                    requested_activity = current_activity
                    return HttpResponseRedirect(
                        '/%s%s' % (requested_activity.learning_activity.id, requested_activity.learning_activity.uri))
                else:
                    _set_current(request, requested_activity, root, s, progress_status=None)
            # Else is a
            # 'choice' REQUEST
            else:
                _set_current(request, requested_activity, root, s)

        if request.method == 'POST' and 'nav_event' in request.POST:
            # Get root of activity tree
            root = None
            try:
                root = UserLearningActivity.objects.get(learning_activity__id=path_id, user=request.user)
            except (ObjectDoesNotExist, IndexError) as e:
                root = None

            if not root or not root.is_root():
                return HttpResponseNotFound('<h1>Activity not found</h1>')

            current_activity = s.get_current(root)

            if current_activity.learning_activity.choice_exit:
                progress_status = 'completed'
            else:
                progress_status = None


            next_uri = None
            # 'next' REQUEST
            if request.POST['nav_event'] == 'next':
                # Go TO NEXT ACTIVITY
                s.exit(current_activity, progress_status=progress_status)
                next_uri = s.get_next(root, current_activity)

            # 'prev' REQUEST
            elif request.POST['nav_event'] == 'prev':
                # Go TO PREV ACTIVITY
                s.exit(current_activity, progress_status=progress_status)
                next_uri = s.get_prev(root, current_activity)

            # No more activities ?
            if next_uri is None:
                return HttpResponseRedirect('/%s%s' % (root.learning_activity.id, root.learning_activity.uri))

            else:
                next_activity = UserLearningActivity.objects.get(learning_activity__id=next_uri, user=request.user)
                return HttpResponseRedirect(
                    '/%s%s' % (next_activity.learning_activity.id, next_activity.learning_activity.uri))

        _XML = s.get_nav(root)


        # Escape for javascript
        XML = ET.tostring(_XML, encoding='unicode').replace('"', r'\"')
        print('XML:', XML)
        breadcrumbs = s.get_current_path(requested_activity)

        rating_totals = LearningActivityRating.objects.filter(
            learning_activity__uri=requested_activity.learning_activity.uri).aggregate(Count('rating'), Avg('rating'))

        activity_content = Activity.get(requested_activity.learning_activity.uri)

        if activity_content and 'content' in activity_content:
            content = activity_content['content']
        else:
            content = ""

        if (requested_activity.learning_activity.uri).split('/')[2] == 'video':
            return render(request, 'activitytree/video.html',

                                      {'XML_NAV': XML,
                                       'uri': requested_activity.learning_activity.uri,
                                       'uri_id': requested_activity.learning_activity.id,
                                       'video': activity_content,
                                       'current_site': get_current_site(request),

                                       'breadcrumbs': breadcrumbs,
                                       'root': requested_activity.learning_activity.get_root().uri,
                                       'root_id': '/%s' % requested_activity.learning_activity.get_root().id,
                                       'rating_totals': rating_totals})

        elif requested_activity.learning_activity.is_container:

            return render(request,'activitytree/container_list.html',

                                      {
                                          'XML_NAV': XML,
                                          'children': requested_activity.get_children(),
                                          'uri_id': '/%s' % requested_activity.learning_activity.id,
                                          'uri': requested_activity.learning_activity.uri,
                                          'current_site': get_current_site(request),
                                          'content': content,
                                          'root': requested_activity.learning_activity.get_root().uri,
                                          'root_id': '/%s' % requested_activity.learning_activity.get_root().id,
                                          'breadcrumbs': breadcrumbs})
        else:
            return render(request,'activitytree/activity.html',

                                      {'XML_NAV': XML,
                                       'uri': requested_activity.learning_activity.uri,
                                       'current_site': get_current_site(request),
                                       'uri_id': '/%s' % requested_activity.learning_activity.id,
                                       'content': content,
                                       'root': requested_activity.learning_activity.get_root().uri,
                                       'root_id': '/%s' % requested_activity.learning_activity.get_root().id,
                                       'breadcrumbs': breadcrumbs,
                                       'rating_totals': rating_totals})

    else:
        return HttpResponseRedirect('/login/?next=%s' % request.path)


def activity(request, uri=None):
    if request.method == 'GET':

        # Check if public, all public for now
        if False:
            return HttpResponseRedirect('/login/?next=%s' % request.path)

        activity_content = Activity.get('/%s' % uri)

        if activity_content and 'content' in activity_content:
            content = activity_content['content']
        else:
            content = ""

        if (uri).split('/')[1] == 'video':

            return render(request,'activitytree/video.html',

                                      {'XML_NAV': None,
                                       'uri': uri,
                                       'video': activity_content,
                                       'current_site': get_current_site(request),
                                       'breadcrumbs': None})


        else:
            return render(request,'activitytree/activity.html',

                                      {'XML_NAV': None,
                                       'uri': uri,
                                       'content': content,
                                       'breadcrumbs': None,
                                       'current_site': get_current_site(request)
                                       })


            # Do something for anonymous users.


def path_test(request, path_id, uri):
    if request.user.is_authenticated:
        s = SimpleSequencing(context=get_context(request))
        try:
            requested_activity = UserLearningActivity.objects.get(learning_activity__id=path_id, user=request.user)
        except ObjectDoesNotExist as e:
            return HttpResponseNotFound('<h1>Learning Activity not found</h1>')

        root = None

        try:
            root = UserLearningActivity.objects.get(learning_activity=requested_activity.learning_activity.get_root(),
                                                    user=request.user)
        except (ObjectDoesNotExist, IndexError) as e:
            return HttpResponseNotFound('<h1>Path not found</h1>')

        feedback = None
        # IF 100 attempts there is really no limit
        if requested_activity.learning_activity.attempt_limit < 100:
            attempts_left = requested_activity.learning_activity.attempt_limit - requested_activity.num_attempts
        else:
            attempts_left = 100

        if request.method == 'GET':
            # Exits last activity, and sets requested activity as current
            # if choice_exit consider complete
            _set_current(request, requested_activity, root, s, progress_status=None)

        elif request.method == 'POST':
            if 'check' in request.POST and attempts_left:

                quiz = Activity.get(requested_activity.learning_activity.uri)

                feedback = _check_quiz(request.POST, quiz)
                print('feedback',feedback)
                # Updates the current Learning Activity
                objective_measure = float(feedback['total_correct']) / len(quiz['questions']) * 100
                if feedback['total_correct'] >= int(quiz['satisfied_at_least']):
                    progress_status = 'completed'
                else:
                    progress_status = 'incomplete'

                s.update(requested_activity, progress_status=progress_status, attempt=True,
                         objective_measure=objective_measure)
                # IF 100 attempts there is really no limit
                if requested_activity.learning_activity.attempt_limit < 100:
                    attempts_left -= 1


                    # Gets the current navegation tree as HTML

        _XML = s.get_nav(root)
        # Escape for javascript
        XML = ET.tostring(_XML, encoding='unicode').replace('"', r'\"')  # navegation_tree = s.nav_to_html(nav)
        rating_totals = LearningActivityRating.objects.filter(
            learning_activity__uri=requested_activity.learning_activity.uri).aggregate(Count('rating'), Avg('rating'))

        breadcrumbs = s.get_current_path(requested_activity)

        test = Activity.get(requested_activity.learning_activity.uri)
        if feedback:

            for q in test['questions']:
                q_id = str(q['id'])
                if q_id in feedback:
                    q['feedback'] = feedback[q_id]
                    if q['interaction'] in ['choiceInteraction', 'simpleChoice']:
                        q['feedback_options'] = zip(q['options'], feedback[q_id]['user_answer'],
                                                    feedback[q_id]['checked'])

        return render(request,'activitytree/' + (requested_activity.learning_activity.uri).split('/')[1] + '.html',
                                  {'XML_NAV': XML,
                                   'uri': requested_activity.learning_activity.uri,
                                   'content': test,
                                   'feedback': feedback,
                                   'breadcrumbs': breadcrumbs,
                                   'uri_id': '/%s' % requested_activity.learning_activity.id,

                                   'attempt_limit': requested_activity.learning_activity.attempt_limit,
                                   'num_attempts': requested_activity.num_attempts,
                                   'attempts_left': attempts_left,
                                   'root_id': '/%s' % requested_activity.learning_activity.get_root().id,

                                   'root': requested_activity.learning_activity.get_root().uri})
    else:

        return HttpResponseRedirect('/login/?next=%s' % request.path)
        # Do something for anonymous users.


def path_program(request, path_id, uri):
    if request.user.is_authenticated:
        s = SimpleSequencing(context=get_context(request))
        try:
            requested_activity = UserLearningActivity.objects.get(learning_activity__id=path_id, user=request.user)
        except ObjectDoesNotExist as e:
            return HttpResponseNotFound('<h1>Learning Activity not found</h1>')
        root = None
        try:
            root = UserLearningActivity.objects.get(learning_activity=requested_activity.learning_activity.get_root(),
                                                    user=request.user)
        except (ObjectDoesNotExist, IndexError) as e:
            return HttpResponseNotFound('<h1>Path not found</h1>')

        if request.method == 'GET':
            # Exits last activity, and sets requested activity as current
            # if choice_exit consider complete
            _set_current(request, requested_activity, root, s)

        # Gets the current navegation tree as XML
        _XML = s.get_nav(root)
        # Escape for javascript
        XML = ET.tostring(_XML, encoding='unicode').replace('"', r'\"')

        breadcrumbs = s.get_current_path(requested_activity)
        program_quiz = Activity.get(requested_activity.learning_activity.uri)

        rating_totals = LearningActivityRating.objects.filter(
            learning_activity__uri=requested_activity.learning_activity.uri).aggregate(Count('rating'), Avg('rating'))

        ## TO DO:
        ## The activity was not found

        if program_quiz and program_quiz['lang'] == 'javascript':
            template = 'activitytree/programjs.html'
        else:
            template = 'activitytree/program.html'

        return render(request, {'program_quiz': program_quiz,
                                             'activity_uri': requested_activity.learning_activity.uri,
                                             'uri_id': '%s' % requested_activity.learning_activity.id,
                                             'uri': requested_activity.learning_activity.uri,
                                             'current_site': get_current_site(request),
                                             'breadcrumbs': breadcrumbs,
                                             'root': requested_activity.learning_activity.get_root().uri,
                                             'root_id': '/%s' % requested_activity.learning_activity.get_root().id,
                                             'XML_NAV': XML, 'rating_totals': rating_totals
                                             })

    else:
        return HttpResponseRedirect('/login/?next=%s' % request.path)


@transaction.atomic
def program(request, uri):
    program_quiz = Activity.get(request.path)

    if program_quiz:

        if program_quiz['lang'] == 'javascript':
            template = 'activitytree/programjs.html'
        else:
            template = 'activitytree/program.html'

        return render(request,template, {'program_quiz': program_quiz,
                                             'activity_uri': request.path,
                                             'current_site': get_current_site(request),
                                             'breadcrumbs': None,
                                             'root': None,
                                             'XML_NAV': None
                                             })
    else:

        return HttpResponseNotFound('<h1>Activity not found</h1>')


@transaction.atomic
def test(request, uri):
    quiz = Activity.get(request.path)
    if quiz:

        template = 'activitytree/test.html'
        return render(request,template, {
            'content': quiz,
            'activity_uri': request.path,
            'breadcrumbs': None,
            'root': None,
            'XML_NAV': None
        })

    else:

        return HttpResponseNotFound('<h1>Activity not found</h1>')


@csrf_protect
def test_program(request):
    if request.is_ajax():
        if request.method == 'POST':
            import os
            data = json.loads(request.body)
            unit_test = data['unit_test']
            correct_code = data['correct_code']
            try:
                logger.error("REDIS:" + os.environ['REDIS_HOST'])
                server = Cola(data['lang'])
                task = {"id": None, "method": "exec", "params": {"code": correct_code, "test": unit_test}}
                logger.error(task)
                task_id = server.enqueue(**task)
                logger.error(task_id)
                result = [{"result": "added", "id": task_id}]
                return HttpResponse(json.dumps({"id": task_id}))
            except redis.ConnectionError:
                return HttpResponse("Error")
    else:
        return HttpResponse("Error")







@csrf_protect
def execute_queue(request):
    # logger.error("VIEW execute_queue")
    if request.method == 'POST':
        # Read RPC message from client
        rpc = json.loads(request.body)

        # Get params
        # Code to execute
        code = rpc["params"][0]
        # URI of Activity
        activity_uri = rpc["method"]

        # Get Activity from MongoDB
        program_test = Activity.get(activity_uri)

        print('program_test')
        print(type(program_test['unit_test']))


        #Get Regular Expresion Test (RET) if there is one, if not set to None
        retest = ('reg_exp' in program_test and program_test['reg_exp']) or None



        #If there is a RET run test
        if retest:
            test_errors = re_test(code,retest)
            if test_errors:
                # Return Error
                result = {"outcome": 0, "result": { "successes": [], "failures": test_errors,
  		                    "errors": [], "result": "Failure", "stdout": ""}}


                return HttpResponse(json.dumps(result), content_type='application/javascript' )

        # Get Unittest
        unit_test = program_test['unit_test']

        server = Cola(program_test['lang'])
        task = {"id": None, "method": "exec", "params": {"code": code, "test": unit_test}}
        logger.debug(task)
        task_id = None
        try:
            task_id = server.enqueue(**task)
        except Exception:

            result = {"result": "error", "error": "Server Not Found", "id": task_id,"success": False}
            return HttpResponse(json.dumps(result), content_type='application/javascript', status=503)


        logger.debug(task_id)
        rpc['task_id'] = task_id

        if request.user.is_authenticated and 'id' in rpc:
            ula = None
            try:
                ula = UserLearningActivity.objects.get(learning_activity__id=rpc["id"], user=request.user)

                s = SimpleSequencing(context=get_context(request))
                s.update(ula)
                ## Mouse Dynamics
                event = ULA_Event.objects.create(ULA=ula, context=rpc)
                event.save()
            except ObjectDoesNotExist:
                # Assume is a non assigned program

                pass
        result = {"result": "added", "error": None, "id": task_id}
        return HttpResponse(json.dumps(result), content_type='application/javascript')


@csrf_protect
def javascript_result(request):
    if request.method == 'POST':
        rpc = json.loads(request.body)

        code = rpc["params"][0]
        activity_uri = rpc["method"]
        program_test = Activity.get(activity_uri)

        if request.user.is_authenticated and 'id' in rpc:
            ula = None
            try:
                ula = UserLearningActivity.objects.get(learning_activity__id=rpc["id"], user=request.user)

                s = SimpleSequencing(context=get_context(request))
                if rpc['result'] == 'Success':
                    s.update(ula, progress_status='completed', objective_measure=30, attempt=True)
                else:
                    s.update(ula, attempt=True)
                # s.update(ula)
                ## Mouse Dynamics
                event = ULA_Event.objects.create(ULA=ula, context=rpc)
                event.save()
            except ObjectDoesNotExist:
                # Assume is a non assigned program
                pass

        return HttpResponse(json.dumps({}), content_type='application/javascript')


@csrf_protect
def get_result(request):
    if request.method == 'POST':
        rpc = json.loads(request.body)
        # We only need the Task identifier
        # TO DO:

        task_id = rpc["id"]

        # No ID, Task Not Found
        if not task_id:
            return HttpResponse(json.dumps({'outcome': -1}), content_type='application/javascript')


        t = Task(id=task_id)

        # outcome:
        # -1 No result found
        # 0 Sub-process Success
        # 1 Sub-process Failure
        if t.get_result(task_id.split(':')[0]):

            if t.result:

                string_json = ""
                try:
                    string_json = json.loads(t.result[0])
                except Exception as e:
                    print ("string_json exception", e)

                if request.user.is_authenticated:
                    try:
                        ula = UserLearningActivity.objects.get(learning_activity__uri=rpc["params"][0],
                                                               user=request.user)
                        s = SimpleSequencing(context=get_context(request))

                        if string_json['result'] == 'Success':
                            s.update(ula, progress_status='completed', objective_measure=30, attempt=True)

                        else:
                            s.update(ula, attempt=True)
                    except Exception as e:
                        print ("update ULA", e)

                result = json.dumps({'result': string_json, 'outcome': t.result[1]})
                return HttpResponse(result, content_type='application/javascript')

            else:
                return HttpResponse(json.dumps({'outcome': -1}), content_type='application/javascript')
        else:
            return HttpResponse(json.dumps({'outcome': -1}), content_type='application/javascript')


def _get_learning_activity(uri):
    try:
        la = LearningActivity.objects.get(uri=uri)
    except ObjectDoesNotExist:
        return None
    return la


def _get_ula(request, uri):
    try:
        la = _get_learning_activity(uri)
        if la is None:
            return None
    except ObjectDoesNotExist:
        return None

    # Let's get the requested user learning activity
    try:
        requested_activity = UserLearningActivity.objects.filter(learning_activity__uri=uri, user=request.user)[0]
    except (ObjectDoesNotExist, IndexError) as e:
        # User does not have a tracking activity tree
        # If the requested activity is the root of a tree
        # register the user to it
        return None
    return requested_activity


def _set_current(request, requested_activity, root, s, progress_status=None):
    # Sets the requested  Learning Activity as current

    atree = ActivityTree.objects.get(user=request.user, root_activity=root.learning_activity.get_root())

    # Exits last activty
    if atree.current_activity:
        if request.method == 'GET' and atree.current_activity.learning_activity.choice_exit:
            progress_status = 'completed'
        s.exit(atree.current_activity, progress_status=progress_status)
    s.set_current(requested_activity)


def _quiz(post_dict, quiz):
    print(post_dict)
    print('quiz', quiz)
    #answerDict = dict(post_dict.iterlists())
    answerDict = dict(post_dict)
    print('answerDict',answerDict)
    checked = {}

    for q in quiz['questions']:
        id = str(q['id'])
        answer = q['answer']
        interaction = q['interaction']
        checked[id] = {}
        print (id in answerDict)
        if interaction in ['choiceInteraction', 'simpleChoice']:
            if id in answerDict:

                user = answerDict[id]
                user_index = [int(a.split("_")[-1]) for a in user]
                user_answer = [int(i in user_index) for i in range(len(answer))]

                if answer == user_answer:
                    checked[id]['correct'] = 1
                else:
                    checked[id]['correct'] = 0

                checked[id]['checked'] = [(user_answer[i] == answer[i]) and (answer[i] == 1) for i in
                                          range(len(answer))]
                checked[id]['user_answer'] = user_answer
            else:
                checked[id]['correct'] = 0
                checked[id]['checked'] = [False for _ in range(len(answer))]
                checked[id]['user_answer'] = [0 for _ in range(len(answer))]
        elif interaction in ['textEntryInteraction']:
            if id in answerDict:
                user_answer = answerDict[id][0]
                checked[id]['user_answer'] = user_answer

                if user_answer in answer:
                    checked[id]['correct'] = 1
                else:
                    checked[id]['correct'] = 0
    checked['total_correct'] = sum([float(checked[key]['correct']) for key in checked if key not in ['checked']])
    print ('checked',checked)
    return checked


def _check_survey(post_dict, quiz):
    answerDict = dict(post_dict.iterlists())
    checked = {}
    for q in quiz['questions']:
        id = q['id']
        answer = q['answer']
        interaction = q['interaction']
        checked[id] = {}

        if interaction in ['choiceInteraction', 'simpleChoice']:
            if unicode(id) in answerDict:
                user = answerDict[unicode(id)]
                user_index = [int(a.split("_")[-1]) for a in user]
                user_answer = [int(i in user_index) for i in range(len(answer))]

                if 1 in user_answer:
                    checked[id]['correct'] = 1
                else:
                    checked[id]['correct'] = 0

                checked[id]['checked'] = [(user_answer[i] == answer[i]) and (answer[i] == 1) for i in
                                          range(len(answer))]
                checked[id]['user_answer'] = user_answer
            else:
                checked[id]['correct'] = 0
                checked[id]['checked'] = [False for _ in range(len(answer))]
                checked[id]['user_answer'] = [0 for _ in range(len(answer))]
        elif interaction in ['textEntryInteraction']:
            if unicode(id) in answerDict:
                user_answer = answerDict[unicode(id)][0]
                checked[id]['user_answer'] = user_answer

                if True:
                    checked[id]['correct'] = 1
                else:
                    checked[id]['correct'] = 0
    checked['total_correct'] = sum([float(checked[key]['correct']) for key in checked if key not in ['checked']])

    return checked


def login_view(request, template_name='registration/login.html', redirect_field_name=REDIRECT_FIELD_NAME):
    context = {}

    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                if 'next' in request.GET:
                    return HttpResponseRedirect(request.GET['next'])
                else:

                    return HttpResponseRedirect('/')


                    # Redirect to a success page.
            else:

                context['errors'] = 'User is locked'

        else:
            context['errors'] = 'Invalid Login'

        return TemplateResponse(request, template_name, context, current_app=None)

    else:
        if 'next' in request.GET:
            context['next'] = request.GET['next']
            context['hidde_login_link'] = True
            request.session['after_login'] = request.GET['next']
            context['GOOGLE_APP_ID'] = settings.GOOGLE_APP_ID

        return TemplateResponse(request, template_name, context, current_app=None)


def ajax_vote(request, type, uri):
    activity_uri = request.path[len('/ajax_vote'):]
    if request.user.is_authenticated:
        if request.method == 'POST':
            activity = UserLearningActivity.objects.filter(learning_activity__uri=activity_uri, user=request.user)[0]
            activity.user_rating = int(request.POST['rate'])
            activity.save()

        vals = UserLearningActivity.objects.filter(learning_activity__uri=activity_uri).aggregate(Avg('user_rating'),
                                                                                                  Count('user_rating'))
        response_data = {'avg': vals['user_rating__avg'], 'votes': vals['user_rating__count']}

        return HttpResponse(json.dumps(response_data), content_type="application/json")
    else:
        return HttpResponse(content="Ya voto?")



def register(request):
    if request.method == 'POST':
        f = UserCreationForm(request.POST)
        if f.is_valid():
            f.save()
            username = f.cleaned_data.get('username')
            raw_password = f.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)


            return HttpResponseRedirect('/welcome/')

    else:
        f = UserCreationForm()

    return render(request, 'registration/registration_form.html', {'form': f})



def get_activities(request):
    activities = Activity.get_new()
    json_docs = [doc for doc in activities]
    return HttpResponse(json.dumps(json_docs), content_type='application/javascript')


@login_required
def my_activities(request):  # view used by activity_builder, returns all activities by user
    client = MongoClient(settings.MONGO_DB)
    db = client.protoboard_database
    activities_collection = db.activities_collection
    user = request.GET['user']
    page = int(request.GET['page'])
    activities = Activity.get_by_user(user, page)
    count = activities_collection.find({'author': user},
                                       {'_id': 1, 'title': 1, 'lang': 1, 'type': 1, 'description': 1, 'icon': 1,
                                        'level': 1, 'tags': 1}).sort("$natural", pymongo.DESCENDING).count()
    count = {'count': count}
    json_docs = [doc for doc in activities]
    json_docs.append(count)
    return HttpResponse(json.dumps(json_docs), content_type='application/javascript')

@csrf_exempt
def search_prueba(request):  # view used by search, receives page and query and returns count of docs and activities
    MONGO_PAGE_SIZE = 20
    client = MongoClient(settings.MONGO_DB)
    db = client.protoboard_database
    activities_collection = db.activities_collection
    actividad = json.loads(request.body)
    query = []
    page = 0
    for k, v in actividad.items():
        if k == 'page':
            page = v
        else:
            query.append(v)
    if len(query) == 0:
        message = "null"
        return HttpResponse(json.dumps(message), content_type='application/javascript')
    else:
        activities = activities_collection.find({'$and': query},
                                                {'_id': 1, 'title': 1, 'lang': 1, 'type': 1, 'description': 1,
                                                 'icon': 1, 'level': 1, 'tags': 1, 'image_url': 1}).sort("$natural",
                                                                                                         pymongo.DESCENDING).limit(
            MONGO_PAGE_SIZE).skip(page * MONGO_PAGE_SIZE)
        count = activities_collection.find({'$and': query},
                                           {'_id': 1, 'title': 1, 'lang': 1, 'type': 1, 'description': 1, 'icon': 1,
                                            'level': 1, 'tags': 1, 'image_url': 1}).sort("$natural",
                                                                                         pymongo.DESCENDING).count()
        count = {'count': count}
        json_docs = [doc for doc in activities]
        json_docs.append(count)
        return HttpResponse(json.dumps(json_docs), content_type='application/javascript')


def check_activity(request):  # view that checks if activity id already exists
    actividad = Activity.get_title(request.GET['valor'])
    json_docs = [doc for doc in actividad]
    return HttpResponse(json.dumps(json_docs), content_type='application/javascript')


@login_required
def delActivity(request):  # view that receives user and id of activity to be deleted
    if request.method == 'POST':
        user = request.POST['user']
        _id = request.POST['_id']
        try:
            message = Activity.del_activity(_id, user)
            return HttpResponse(message)
        except Exception as e:
            return HttpResponse(e)


def get_activity(request):
    if request.method == 'GET':
        # We first get the Activity
        _id = request.GET['_id']

        try:
            mongo_answer = Activity.get_activity(_id)
            activity = mongo_answer[0]

            # Are you  AnonymousUser?

            if request.user == 'AnonymousUser' or not hasattr(request.user, 'email') or activity[
                'author'] != request.user.email:
                # Its not yours, you can have it read_only
                activity['readonly'] = 'readonly'

            return HttpResponse(json.dumps([activity]), content_type='application/javascript')

        except Exception as e:
            return HttpResponse(e)

    else:
        actividad = json.loads(request.body)
        _id = actividad['_id']
        user = actividad['author']
        type = actividad['type']
        try:
            message = Activity.get_activity(_id, user)
            json_docs = [doc for doc in message]
            return HttpResponse(json.dumps(json_docs), content_type='application/javascript')
        except Exception as e:
            return HttpResponse(e)


@login_required
def users(request, user_id=None, course_id=None, ):
    if user_id == None or user_id == "":
        users = User.objects.all()

        return render(request,'activitytree/users.html', {'users': users})
    elif course_id == None or course_id == "":
        user = User.objects.get(pk=user_id)
        cursos = user.activitytree_set.all()

        return render(request,'activitytree/user.html', {'user': user, 'cursos': user})

    else:
        user = User.objects.get(pk=user_id)
        # Gets the current navegation tree as HTML
        root = None

        try:
            root = UserLearningActivity.objects.get(learning_activity__id=course_id, user=user_id)
        except (ObjectDoesNotExist, IndexError) as e:
            root = None

        s = SimpleSequencing(context=get_context(request))
        _XML = s.get_nav(root)
        # Escape for javascript
        XML = ET.tostring(_XML, encoding='unicode').replace('"', r'\"')
        return render(request,'activitytree/dashboard.html', {'user': user, 'XML_NAV': XML})


@login_required
def me(request):
    if request.method == 'GET':
        return render(request,'activitytree/me.html', {'time':timezone.now()})
    if request.method == 'POST':
        try:

            request.user.username = request.POST["username"]
            request.user.first_name = request.POST["first_name"]
            request.user.last_name = request.POST["last_name"]
            request.user.email = request.POST["email"]
            request.user.save()

        except:

            return JsonResponse({"error": True})

        return JsonResponse({"success": True, "error": None})


@csrf_exempt
def upload_course(request):
    if request.method == 'POST':
        # We need a Course ID
        if request.POST and 'course_id' in request.POST:

            json_course = request.FILES['fileToUpload'].read()

            upload_course_from_json(json_course, request.POST['course_id'], request.user)
            request.FILES['fileToUpload'].close()

            result = {"result": "added", "error": None, "id": None}
            return HttpResponse(json.dumps(result), content_type='application/javascript')



        else:
            # We can create a NEW empty course?
            result = {"result": "error", "error": "No course id supplied", "id": None}
            return HttpResponse(json.dumps(result), content_type='application/javascript')
    else:
        # We can create a NEW empty course?
        result = {"result": "error", "error": "Only PUT is supported", "id": None}
        return HttpResponse(json.dumps(result), content_type='application/javascript')


@csrf_protect
def rate_object(request):
    if request.method == 'POST':

        vote = json.loads(request.body)
        la = LearningActivity.objects.get(uri=vote["uri"])

        rating = LearningActivityRating(user=request.user, learning_activity=la, rating=vote["rating"], context=0)
        rating.save()

        result = {"result": "added", "error": None, "id": None}
        return HttpResponse(json.dumps(result), content_type='application/javascript')


@login_required
def logout_view(request):
    # Log a user out using Django's logout function and redirect them
    # back to the homepage.
    logout(request)
    return HttpResponseRedirect('/')

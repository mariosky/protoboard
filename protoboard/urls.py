from django.conf.urls import patterns, include, url
from activitytree.forms import ProtoPasswordResetForm
from registration.backends.default.views import RegistrationView

#from django.contrib import admin
#admin.autodiscover()





urlpatterns = patterns('',
    # Example:
      (r'^$','activitytree.views.welcome'),
      (r'^welcome/$','activitytree.views.welcome'),
      (r'^dashboard/(?P<path_id>[0-9]+)$','activitytree.views.dashboard'),

      (r'^(?P<uri>activity/([\w+](\/*)(-*))+)$','activitytree.views.activity'),
      (r'^(?P<path_id>[0-9]+)(?P<uri>/activity/([\w+](\/*)(-*))+)$','activitytree.views.path_activity'),

      (r'^(?P<path_id>[0-9]+)(?P<uri>/test/([\w+](\/*)(-*))+)$','activitytree.views.path_test'),

      (r'^(?P<path_id>[0-9]+)(?P<uri>/program/([\w+](\/*)(-*))+)$','activitytree.views.path_program'),

      (r'^(?P<uri>program/([\w+](\/*)(-*))+)$','activitytree.views.program'),

      (r'^execute_queue$','activitytree.views.execute_queue'),
      (r'^post_course$','activitytree.views.course_view'),
      (r'^get_course$','activitytree.views.course_view'),
      (r'^delete_course/(?P<course_id>[0-9]*)$','activitytree.views.course'),

      url(r'^my_courses$','activitytree.views.my_courses',name='my_courses'),

      (r'^javascript_result$','activitytree.views.javascript_result'),
      (r'^get_activities$','activitytree.views.get_activities'),

      (r'^get_result$','activitytree.views.get_result'),
      (r'^me$','activitytree.views.me'),
      (r'^users/(?P<user_id>[0-9]*)(\/*)(?P<course_id>[0-9]*)$','activitytree.views.users'),

      url(r'^course-builder/(?P<course_id>([\w+](\/*)(-*))+)$','activitytree.views.course',name="course"),
      url(r'^course-builder/?$','activitytree.views.course',name="course"),


      (r'^activitybuilder$','activitytree.views.activity_builder'),
      (r'^actividad$','activitytree.views.typeactivity'),
      (r'^my_activities$','activitytree.views.my_activities'),
      (r'^delete_activity$','activitytree.views.delActivity'),
      (r'^prueba$','activitytree.views.prueba'),
      (r'^get_activity$','activitytree.views.check_activity'),
      (r'^addquiz$','activitytree.views.addQuiz'),
      (r'^build_quiz$','activitytree.views.build_quiz'),
      (r'^build_program$','activitytree.views.build_program'),


      (r'^unlink_facebook/?$', 'activitytree.views.unlink_facebook'),
      (r'^unlink_google/?$', 'activitytree.views.unlink_google'),
      (r'^rate_object$','activitytree.views.rate_object'),
      (r'^facebook/get_login/?$', 'activitytree.views.facebook_get_login'),
      (r'^facebook/login/?$','activitytree.views.facebook_login'),

      (r'^GoogleCallback/?$','activitytree.views.google_callback'),
      (r'^GoogleLink/?$','activitytree.views.google_link'),

      (r'^logout/?$', 'activitytree.views.logout_view'),
      (r'^login/$', 'activitytree.views.login_view', {'template_name': 'registration/login.html'}),

#     url(r'^register/$', RegistrationView.as_view(), name='registration_register'),
      url(r'^password_reset/$', 'django.contrib.auth.views.password_reset',{'password_reset_form':ProtoPasswordResetForm } ),
      url(r'^logout/$', 'activitytree.views.logout'),
      # Hack horrible para el logout
      (r'^accounts/login/$', 'activitytree.views.login_view', {'template_name': 'registration/login.html'}),

      url('', include('django.contrib.auth.urls')),
      ('', include('registration.backends.default.urls')),
      #url('', include('social.apps.django_app.urls', namespace='social')),



    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # (r'^admin/', include(admin.site.urls)),
)

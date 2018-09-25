from django.urls import path, re_path, include
from activitytree.forms import ProtoPasswordResetForm
from activitytree import views

from django.contrib.auth import views as auth_views
from django.contrib import admin





urlpatterns = [

      path('',views.welcome),
      path('admin/', admin.site.urls),

      path('welcome/',views.welcome),
      path('instructor/', views.instructor),
      path('student/', views.my_enrolled_courses),
      path('courses/', views.course_list),
      re_path('^course_info/(?P<course_id>[0-9]*)$',views.course_info),
      re_path('dashboard/(?P<path_id>[0-9]+)$', views.dashboard),

      re_path('^(?P<uri>activity/([\w+](\/*)(-*))+)$', views.activity),

      re_path('^(?P<path_id>[0-9]+)(?P<uri>/activity/([\w+](\/*)(-*))+)$',views.path_activity),

      re_path(r'^(?P<path_id>[0-9]+)(?P<uri>/test/([\w+](\/*)(-*))+)$',views.path_test),

      re_path(r'^(?P<path_id>[0-9]+)(?P<uri>/program/([\w+](\/*)(-*))+)$',views.path_program),

      re_path(r'^(?P<uri>program/([\w+](\/*)(-*))+)$',views.program),
      re_path(r'^(?P<uri>test/([\w+](\/*)(-*))+)$',views.test),

      path('execute_queue/',views.execute_queue),
      path('post_course/',views.course_view),
      path('get_course/',views.course_view),
      re_path('delete_course/(?P<course_id>[0-9]*)$',views.course),

      path('my_courses/', views.my_courses,name='my_courses'),

      path('javascript_result/',views.javascript_result),
      path('get_activities/',views.get_activities),

      path('get_result/',views.get_result),
      path(r'me/',views.me),
      path(r'me/profile/tz/', views.profile_tz),
      path(r'me/profile/experience/', views.profile_experience),
      path(r'me/profile/learning_style/',views.profile_learning_style),
      re_path('^users/(?P<user_id>[0-9]*)(\/*)(?P<course_id>[0-9]*)$',views.users),
               re_path('^course-builder/(?P<course_id>([\w+](\/*)(-*))+)$', views.course,name="course"),
               re_path('^course-builder/?$',views.course,name="course"),
      path(r'test_program/',views.test_program),
      path(r'search_prueba/',views.search_prueba),
      re_path(r'^my_enrolled_courses/(?P<status>(incomplete|completed))$',views.my_enrolled_courses),
      path(r'search/',views.search),
      path(r'activitybuilder/',views.activity_builder),
      path(r'my_activities/',views.my_activities),
      path(r'delete_activity/',views.delActivity),
      path(r'upload_activity/',views.upload_activity),
      path(r'get_activity/',views.check_activity),
      path(r'get_id/',views.get_activity),
      path(r'build_quiz/',views.build_quiz),
      path(r'build_program/',views.build_program),
      path(r'unlink_facebook/',views.unlink_facebook),
      path(r'unlink_google/', views.unlink_google),
      path(r'rate_object/',views.rate_object),
      path(r'upload_course/', views.upload_course),
#      path(r'facebook/get_login/', views.facebook_get_login),
#      path(r'facebook/login/',views.facebook_login),
      path('register/', views.register, name='register'),
#      path(r'GoogleCallback/',views.google_callback),
#      path(r'GoogleLink/',views.google_link),
      path('accounts/login/', auth_views.LoginView.as_view(template_name='registration/login.html')),
      path('accounts/logout/', auth_views.LogoutView.as_view()),
#      path(r'logout/', views.logout_view),


#               re_path(r'^password_reset/$', auth_views.PasswordResetView.as_view(),{'password_reset_form':ProtoPasswordResetForm } ),


            #   re_path('', include(auth_urls)),
 ]

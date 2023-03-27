from django.urls import path, re_path, include
from activitytree import views

from django.contrib.auth import views as auth_views
from django.contrib import admin





urlpatterns = [
      path('',views.welcome),
      path('admin/', admin.site.urls),
      path('delete-course/<int:course_id>/', views.delete_course_view, name='delete_course_view'),
      path('update-course/<int:course_id>/', views.update_course_view, name='update_course_view'),
      path('add-course/',views.add_course_view),
      path('welcome/',views.welcome),
      path('instructor/', views.instructor),
      path('instructor_info/<int:user_id>/', views.instructor_profile, name='instructor_profile'),
      
      path('student/', views.my_enrolled_courses),
      path('courses/', views.course_list),
      re_path('^course_info/(?P<course_id>[0-9]*)$',views.course_info),
      re_path('dashboard/(?P<path_id>[0-9]+)$', views.dashboard),
      path('activity/<uuid:uuid>/', views.activity),
      path('activity/<str:type>/<uuid:uuid>/', views.activity),
      
      re_path('^(?P<path_id>[0-9]+)(?P<uri>/activity/([\w+](\/*)(-*))+)$',views.path_activity),
      re_path(r'^(?P<path_id>[0-9]+)(?P<uri>/quiz/([\w+](\/*)(-*))+)$',views.path_quiz),
      re_path(r'^(?P<path_id>[0-9]+)(?P<uri>/program/([\w+](\/*)(-*))+)$',views.path_program),
      re_path(r'^(?P<uri>program/([\w+](\/*)(-*))+)$',views.program),
      re_path(r'^(?P<uri>quiz/([\w+](\/*)(-*))+)$',views.quiz),

      path('execute_queue/',views.execute_queue),
      path('post_course/',views.course_view),
      path('get_course/',views.course_view),
      path('course/<int:course_id>/students/', views.course_students),

      path('my_courses/', views.my_courses,name='my_courses'),

      path('javascript_result/',views.javascript_result),
      path('get_new_activities/',views.get_new_activities),
      path('get_frontpage/',views.get_front_page_activities),

      path('get_result/',views.get_result),
      path(r'accounts/profile/', views.my_enrolled_courses),
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
      path(r'rate_object/',views.rate_object),
      path(r'upload_course/', views.upload_course),
      path('register/', views.register, name='register'),

      path('accounts/', include('django_registration.backends.activation.urls')),
      path('accounts/', include('django.contrib.auth.urls')),
      path('comments/', include('django_comments_xtd.urls')),
      path('accounts/login/', auth_views.LoginView.as_view(template_name='registration/login.html')),
      path('accounts/logout/', auth_views.LogoutView.as_view()),
      path('accounts/password_reset/', auth_views.PasswordResetView.as_view()),

      path('accounts/password_change/', auth_views.PasswordChangeView.as_view(), name='password_change'),
      path('accounts/password_change/done/', auth_views.PasswordChangeDoneView.as_view(), name='password_change_done'),

      path('accounts/password_reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
      path('accounts/password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
      path('accounts/reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
      path('accounts/reset/done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
 ]

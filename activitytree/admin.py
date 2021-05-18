from django.contrib import admin
from .models import Course, LearningActivity, AuthorProfile


@admin.register(Course, LearningActivity, AuthorProfile)
class AuthorAdmin(admin.ModelAdmin):
    pass


from django.contrib import admin

# Register your models here.

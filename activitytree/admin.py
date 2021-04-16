from django.contrib import admin
from .models import Course, LearningActivity


@admin.register(Course, LearningActivity)
class AuthorAdmin(admin.ModelAdmin):
    pass


from django.contrib import admin

# Register your models here.

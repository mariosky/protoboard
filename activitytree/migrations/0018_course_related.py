# Generated by Django 3.2 on 2021-06-17 18:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activitytree', '0017_auto_20210526_0224'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='related',
            field=models.ManyToManyField(related_name='_activitytree_course_related_+', to='activitytree.Course'),
        ),
    ]
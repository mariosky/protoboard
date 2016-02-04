# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('activitytree', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='learningactivity',
            name='heading',
        ),
        migrations.RemoveField(
            model_name='learningactivity',
            name='secondary_text',
        ),
        migrations.RemoveField(
            model_name='learningactivity',
            name='slug',
        ),
        migrations.AlterField(
            model_name='course',
            name='root',
            field=models.OneToOneField(to='activitytree.LearningActivity'),
        ),
    ]

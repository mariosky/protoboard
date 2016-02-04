# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
from decimal import Decimal


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ActivityTree',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='AuthorLearningActivity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('time', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('short_description', models.TextField()),
                ('image', models.ImageField(upload_to=b'courses', blank=True)),
                ('start_date', models.DateField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='FacebookSession',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('access_token', models.TextField(unique=True)),
                ('expires', models.IntegerField(null=True)),
                ('uid', models.BigIntegerField(unique=True, null=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='GoogleSession',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('access_token', models.TextField(unique=True)),
                ('expires_in', models.IntegerField(null=True)),
                ('refresh_token', models.TextField(null=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='LearningActivity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=128)),
                ('heading', models.CharField(max_length=128, blank=True)),
                ('secondary_text', models.CharField(max_length=128, blank=True)),
                ('description', models.TextField(blank=True)),
                ('image', models.URLField(blank=True)),
                ('slug', models.SlugField(blank=True)),
                ('uri', models.URLField(blank=True)),
                ('lom', models.URLField(blank=True)),
                ('pre_condition_rule', models.TextField(blank=True)),
                ('choice_exit', models.BooleanField(default=True)),
                ('rollup_rule', models.TextField(default=b'completed IF All completed', blank=True)),
                ('rollup_progress', models.BooleanField(default=True)),
                ('attempt_limit', models.PositiveSmallIntegerField(default=100)),
                ('available_from', models.DateTimeField(null=True)),
                ('available_until', models.DateTimeField(null=True)),
                ('is_container', models.BooleanField(default=False)),
                ('is_visible', models.BooleanField(default=True)),
                ('order_in_container', models.PositiveIntegerField(default=0)),
                ('parent', models.ForeignKey(related_name='children', to='activitytree.LearningActivity', null=True)),
                ('root', models.ForeignKey(to='activitytree.LearningActivity', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='LearningActivityRating',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('time', models.DateTimeField(auto_now=True)),
                ('rating', models.PositiveSmallIntegerField()),
                ('context', models.PositiveSmallIntegerField()),
                ('learning_activity', models.ForeignKey(to='activitytree.LearningActivity')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='LearningStyleInventory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('visual', models.PositiveSmallIntegerField()),
                ('verbal', models.PositiveSmallIntegerField()),
                ('aural', models.PositiveSmallIntegerField()),
                ('physical', models.PositiveSmallIntegerField()),
                ('logical', models.PositiveSmallIntegerField()),
                ('social', models.PositiveSmallIntegerField()),
                ('solitary', models.PositiveSmallIntegerField()),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ULA_Event',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('time_stamp', models.TimeField(auto_now=True)),
                ('context', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='UserLearningActivity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pre_condition', models.CharField(default=b'', max_length=32, blank=True)),
                ('recommendation_value', models.PositiveSmallIntegerField(default=0, null=True)),
                ('progress_status', models.CharField(default=b'incomplete', max_length=16, blank=True)),
                ('objective_status', models.CharField(default=b'notSatisfied', max_length=16, blank=True)),
                ('objective_measure', models.FloatField(default=None, null=True)),
                ('last_visited', models.DateTimeField(default=None, null=True)),
                ('num_attempts', models.PositiveSmallIntegerField(default=0)),
                ('suspended', models.BooleanField(default=False)),
                ('accumulated_time', models.DecimalField(default=Decimal('0.0'), null=True, max_digits=3, decimal_places=2)),
                ('is_current', models.BooleanField(default=False)),
                ('learning_activity', models.ForeignKey(to='activitytree.LearningActivity')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('facebook_uid', models.DecimalField(unique=True, null=True, max_digits=25, decimal_places=0)),
                ('google_uid', models.DecimalField(unique=True, null=True, max_digits=25, decimal_places=0)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='ula_event',
            name='ULA',
            field=models.ForeignKey(to='activitytree.UserLearningActivity'),
        ),
        migrations.AddField(
            model_name='course',
            name='root',
            field=models.ForeignKey(to='activitytree.LearningActivity'),
        ),
        migrations.AddField(
            model_name='authorlearningactivity',
            name='learning_activity',
            field=models.ForeignKey(to='activitytree.LearningActivity'),
        ),
        migrations.AddField(
            model_name='authorlearningactivity',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='activitytree',
            name='current_activity',
            field=models.ForeignKey(related_name='current_in', default=None, to='activitytree.UserLearningActivity', null=True),
        ),
        migrations.AddField(
            model_name='activitytree',
            name='root_activity',
            field=models.ForeignKey(related_name='activity_tree', to='activitytree.LearningActivity'),
        ),
        migrations.AddField(
            model_name='activitytree',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterUniqueTogether(
            name='userlearningactivity',
            unique_together=set([('user', 'learning_activity')]),
        ),
        migrations.AlterUniqueTogether(
            name='facebooksession',
            unique_together=set([('access_token', 'expires'), ('user', 'uid')]),
        ),
        migrations.AlterUniqueTogether(
            name='activitytree',
            unique_together=set([('user', 'root_activity')]),
        ),
    ]

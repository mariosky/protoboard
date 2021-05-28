# Generated by Django 3.2 on 2021-05-14 19:23

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('activitytree', '0011_rename_meta_data_course_metadata'),
    ]

    operations = [
        migrations.CreateModel(
            name='AuthorProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.URLField(blank=True)),
                ('cover_image', models.URLField(blank=True)),
                ('short_about', models.CharField(blank=True, max_length=128)),
                ('about', models.TextField(blank=True)),
                ('location', models.TextField(blank=True)),
                ('web_page', models.CharField(blank=True, max_length=256)),
                ('twitter', models.CharField(blank=True, max_length=256)),
                ('github', models.CharField(blank=True, max_length=256)),
                ('youtube', models.CharField(blank=True, max_length=256)),
                ('twitch', models.CharField(blank=True, max_length=256)),
                ('instagram', models.CharField(blank=True, max_length=256)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
# Generated by Django 3.2 on 2021-04-18 04:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('activitytree', '0010_auto_20210418_0216'),
    ]

    operations = [
        migrations.RenameField(
            model_name='course',
            old_name='meta_data',
            new_name='metadata',
        ),
    ]
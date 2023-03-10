
from django import template
from django.contrib.auth.models import Group

register = template.Library()

@register.filter(name='has_group')
def has_group(user, group_name):
    return user.groups.filter(name=group_name).exists()


@register.filter
def duration(td):
    if td:
        return "{}h {}m".format(td[4:6], td[7:9])
    else:
        return " "



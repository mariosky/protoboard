__author__ = 'mariosky'
#Facebook backend basado en: http://djangosnippets.org/snippets/2065/
# 16 June 2010 Added missing imports. Cleaned up the template.
#Shouts out to @obeattie and @whalesalad
#Author: barnardo
#Posted: June 15, 2010
import datetime
from django.contrib.auth import models as auth_models
from activitytree.models import FacebookSession, GoogleSession,UserProfile

import urllib.request, urllib.parse, urllib.error
import json
from decimal import Decimal


class AuthError(Exception):
    """Base class for exceptions in this module."""
    pass



class AuthAlreadyAssociated(AuthError):
    """Raised when a User is using an account with an email associated with another provider
for instance a Facebook Account and a Google account with the same email.
    Attributes:
        action  -- action to be executed
        message -- explanation of why the specific action is not allowed
    """

    def __init__(self, action):
        self.action = action


    def __str__(self):
        return """email in use %s""" % (self.action, )




def facebook_query_me(access_token, fields=None, metadata=False):

        url = 'https://graph.facebook.com/me'

        params = {'access_token':access_token}

        if metadata:
            params['metadata'] = 1
        if fields:
            params['fields'] = fields

        url += '?' + urllib.parse.urlencode(params)

        print(urllib.parse.urlencode(params))
        print(url)

        response = ''
        try:
            response = json.load(urllib.request.urlopen(url))

            if 'error' in response:
                error = response['error']
                raise Exception(error['type'], error['message'])
        except:
            return None
        return response


def google_query_me(access_token, fields=None):
    url = 'https://www.googleapis.com/plus/v1/people/me'
    params = {'access_token':access_token}
    if fields:
            params['fields'] = fields

    url += '?' + urllib.parse.urlencode(params)

    response = ''
    try:
         response = json.load(urllib.request.urlopen(url))

         if 'error' in response:
             error = response['error']
             #TO DO: log error
             raise Exception(error['type'], error['message'])
    except:
         return None
    return response



class FacebookBackend:

    def authenticate(self,app, **kwargs):
        if app == "facebook":
            access_token = kwargs["access_token"][0]
            expires = kwargs["expires"][0]

            profile = facebook_query_me(access_token,'email,first_name,last_name')
            if 'email' not in profile:
                return None # EMAIL_NOT_FOUND

            try:
                #This user/email exists?
                user = auth_models.User.objects.get(email=profile['email'])

            except auth_models.User.DoesNotExist as e:
                # IF NOT
                # We create a new user
                # Sometimes names are not set in profile
                first_name = 'N/A' or 'first_name' in profile or profile['first_name']
                last_name = 'N/A' or 'last_name' in profile or profile['last_name']
                # We copy user data from their profile
                user = auth_models.User(username=profile['email'], email=profile['email'], is_active=True, first_name = first_name, last_name= last_name)
                user.set_unusable_password()
                user.save()

            user_profile, created = UserProfile.objects.get_or_create(user=user)
            user_profile.facebook_uid = profile['id']
            user_profile.save()


            #Renew or create facbook session
            try:
                FacebookSession.objects.get(user=user).delete()
            except FacebookSession.DoesNotExist as e:
                pass

            facebook_session = FacebookSession.objects.get_or_create(access_token=access_token)[0]

            facebook_session.uid = profile['id']
            facebook_session.expires = expires
            facebook_session.user = user
            facebook_session.save()
            return user

        elif app == "google":

            access_token = kwargs["access_token"]
            expires_in = kwargs["expires_in"]
            refresh_token = kwargs["id_token"]
            profile = google_query_me(access_token)

            email = "emails" in profile and profile["emails"] and profile["emails"][0]["value"] or None


            if not email:
                return None

            try:
                #This user/email exists?
                user = auth_models.User.objects.get(email=email)


            except auth_models.User.DoesNotExist as e:
                # We create a new user
                print(e)
                user = auth_models.User(username=email, email=email, is_active=True, first_name = profile["name"]['givenName'], last_name= profile["name"]['familyName'])
                user.set_unusable_password()
                user.save()

                user_profile = UserProfile(google_uid = profile['id'],user=user)
                user_profile.save()


            user_profile, created = UserProfile.objects.get_or_create(user=user)
            user_profile.google_uid = profile['id']
            user_profile.save()



            #Renew or create google  session

            try:
                GoogleSession.objects.filter(user=user).delete()
            except GoogleSession.DoesNotExist as e:
                print(e)

            google_session = GoogleSession.objects.get_or_create(access_token=access_token, user = user)[0]
            google_session.expires_in = expires_in
            google_session.refresh_token = refresh_token
            google_session.save()


            return user







    def get_user(self, user_id):

        try:
            return auth_models.User.objects.get(pk=user_id)
        except auth_models.User.DoesNotExist:
            return None
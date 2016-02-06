__author__ = 'mario'


import pymongo
from pymongo import MongoClient
from django.conf import settings

_client = MongoClient(settings.MONGO_DB)
_db = _client.protoboard_database
_activities_collection = _db.activities_collection

class Activity:
    @staticmethod
    def get(uri):
        return _activities_collection.find_one({'_id':uri})

    @staticmethod
    def get_all_programming():
        return _activities_collection.find( {'lang':{ '$exists': True}}, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1})

    @staticmethod
    def get_all():
        return _activities_collection.find( {'type': { '$ne':'quiz' } }, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1})

    @staticmethod
    def get_by_user(user):
        return _activities_collection.find({'author': user}, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1}).sort("$natural", pymongo.DESCENDING)


    @staticmethod
    def get_title(title):
        return _activities_collection.find({'title': title}, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1})
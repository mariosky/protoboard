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
        return _activities_collection.find( {'type': { '$ne':'quiz' } }, { '_id':1, 'title':1, 'tags': 1, 'lang':1, 'type': 1,'description':1,'icon':1,'level':1})

    @staticmethod
    def _get_all():
        return _activities_collection.find({},
                                           {'_id': 1, 'title': 1, 'tags': 1, 'lang': 1, 'type': 1, 'description': 1,
                                            'icon': 1, 'level': 1})

    @staticmethod
    def get_by_user(user, page):
        return _activities_collection.find({'author': user}, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1, 'tags':1}).sort("$natural", pymongo.DESCENDING).limit(5).skip(page)

    @staticmethod
    def get_by_admin(page):
        return _activities_collection.find({}, { '_id':1, 'title':1, 'lang':1,'type':1,'description':1,'icon':1,'level':1, 'tags':1}).sort("$natural", pymongo.DESCENDING).limit(5).skip(page)


    @staticmethod
    def get_new():
        return _activities_collection.find({'type': {'$ne': 'quiz'}},
                                           {'_id': 1, 'title': 1, 'tags': 1, 'lang': 1, 'type': 1, 'description': 1,
                                            'icon': 1, 'level': 1, 'image_url':1}).sort("$natural", pymongo.DESCENDING).limit(4)


    @staticmethod
    def get_title(title):
        return _activities_collection.find({'_id': title}, { '_id':1, 'author':1})

    @staticmethod
    def del_activity(_id, user):
        return _activities_collection.remove({'_id': _id, 'author': user})

    @staticmethod
    def del_activity_admin(_id):
        return _activities_collection.remove({'_id': _id})

    @staticmethod
    def get_activity(_id, user = None):
        if user is None:
            return _activities_collection.find({'_id': _id})
        else:
            return _activities_collection.find({'_id': _id, 'author': user})


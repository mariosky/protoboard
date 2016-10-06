import pymongo
from pymongo import MongoClient
from django.conf import settings


_client = MongoClient(settings.MONGO_DB)




class Context:
    def __init__(self, user_id, root_id):
        self.user_id = user_id
        self.root_id = root_id
        self._db = _client.protoboard_database
        self._context_collection = self._db.context_collection


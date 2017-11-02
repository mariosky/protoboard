FROM mongo
COPY activities.json /activities.json
CMD mongoimport --host mongodb --db protoboard_database --collection activities_collection --type json --file /activities.json --upsert

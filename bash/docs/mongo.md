# MONGO

## 1. Dump
Using container:
- Init container:
``````
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo /bin/bash
``````

- Create dump
``````
mongodump --uri="<URI>" --db <DB> --collection <COLLECTION> --out /path/to/directory
``````

- Combination:
``````
URI=""
DB_NAME=""
COLLECTION_NAME=""
DIRECTORY="/backup"
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo mongodump --uri="${URI}" --db ${DB_NAME} --collection ${COLLECTION_NAME} --out ${DIRECTORY}
``````

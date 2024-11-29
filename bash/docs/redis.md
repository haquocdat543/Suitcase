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
URI="mongodb+srv://PomUcdUsr:3k1K1SXcC4casmtrk41@staging-pom-ucd-serverl.yhhpkj7.mongodb.net/?retryWrites=true&w=majority"
DB_NAME="pom_ucd"
COLLECTION_NAME=""
DIRECTORY="/backup"
mongodump --uri="${URI}" --db ${DB_NAME}
``````

### FULL DATABASE
```
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo /bin/bash
```
```
URI=""
DB_NAME=""
DIRECTORY="/backup"
mongodump --uri="${URI}" --db ${DB_NAME} --out ${DIRECTORY}
```

### SPECIFIC COLLECTION
```
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo /bin/bash
```
```
URI=""
DB_NAME=""
DIRECTORY="/backup"
COLLECTION_NAME=""
mongodump --uri="${URI}" --db ${DB_NAME} --collection ${COLLECTION_NAME} --out ${DIRECTORY}
```

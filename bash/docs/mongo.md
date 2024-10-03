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

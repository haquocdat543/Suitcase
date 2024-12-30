# MONGO

## 1. Dump
Using container:
- Init container:
```bash
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo /bin/bash
```

- Create dump
```bash
mongodump --uri="<URI>" --db <DB> --collection <COLLECTION> --out /path/to/directory
```

- Combination:
```bash
URI=""
DB_NAME=""
COLLECTION_NAME=""
DIRECTORY="/backup"
docker run -it --rm -v $(pwd)/mongo-backup:/backup:rw mongo mongodump --uri="${URI}" --db ${DB_NAME} --collection ${COLLECTION_NAME} --out ${DIRECTORY}
```

## 2. Installation
### 3. ALPINE
```bash
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

apk update

apk add mongodb mongodb-tools
```

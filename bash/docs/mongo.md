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
## 2. Connect
Remeber to surround URI by double quotes:
```bash
mongosh "${URI}"
```

## 3. Operation
### 1. List databases
```bash
show dbs
```

```bash
show databases
```

```bash
use yourDatabaseName
```

### 2. List collections
```bash
show collections
```

```js
db.getCollectionNames()
```

### 3. Get collection data
```js
db.collectionName.find()
```

With pretty mode:
```js
db.collectionName.find().pretty()
```

With limits:
```js
db.collectionName.find().limit(5)
```

With specific fields:
```js
db.collectionName.find({}, { fieldName: 1 })
```
```js
db.collectionName.find({ fieldName: "value" })
```

```js
db.collectionName.findOne()
```

```js
db.collectionName.find().sort({ fieldName: 1 })  // Ascending
db.collectionName.find().sort({ fieldName: -1 }) // Descending
```

### 4. Delete collection data
```js
db.collectionName.deleteMany({})
```

Drop entire collection ( indexing include ):
```js
db.collectionName.drop()
```

### 5. Delete database
Drop database:
* Note: this is dangerous operation [ Need to backup database first ]
```js
use yourDatabaseName
db.dropDatabase()
```

## 4. Installation
### 3. ALPINE
```bash
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

apk update

apk add mongodb mongodb-tools
```

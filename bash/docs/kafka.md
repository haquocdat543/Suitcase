# KAFKA

## 1. Download
### 1. Binary
```
#!/bin/bash

# Get url as argument
URL=${1}

# Gunzip
KAKFA_GUNZIP=$(ls -1 | grep kafka)
gunzip ${KAKFA_GUNZIP}

# Tar unzip
KAKFA_TAR=$(ls -1 | grep kafka)
tar -xvzf ${KAKFA_TAR}
```

## Initialize cluster
### 1. Kafka with KRaft
Generate UID:
```
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
```

Format log directories:
```
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties
```

Start the Kafka Server:
```
bin/kafka-server-start.sh config/kraft/server.properties
```

### 2. Kafka with ZooKeeper
```
bin/zookeeper-server-start.sh config/zookeeper.properties
```

```
bin/kafka-server-start.sh config/server.properties
```

### 3. Kafka with Docker
```
docker run -p 9092:9092 apache/kafka:3.8.0
```

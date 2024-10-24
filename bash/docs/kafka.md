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

## 2. Initialize cluster
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

## 3. Operation
### 1. Shell - Kafka
#### 1. Topics
List all topics:
```
KAFKA_HOST="localhost:9092"
kafka-topics.sh --bootstrap-server ${KAFKA_HOST} --list
```

Create topic:
```
TOPIC_NAME="quickstart-events"
KAFKA_HOST="localhost:9092"
bin/kafka-topics.sh --create --topic ${TOPIC_NAME} --bootstrap-server ${KAFKA_HOST}
```

Describe topic:
```
TOPIC_NAME="quickstart-events"
KAFKA_HOST="localhost:9092"
bin/kafka-topics.sh --describe --topic ${TOPIC_NAME} --bootstrap-server ${KAFKA_HOST}
```

Write event to topic:
```
TOPIC_NAME="quickstart-events"
KAFKA_HOST="localhost:9092"
bin/kafka-console-producer.sh --topic ${TOPIC_NAME} --bootstrap-server ${KAFKA_HOST}
```

Read event from topic:
```
TOPIC_NAME="quickstart-events"
KAFKA_HOST="localhost:9092"
bin/kafka-console-consumer.sh --topic ${TOPIC_NAME} --from-beginning --bootstrap-server ${KAFKA_HOST}
```

#### 2. User and Client
```
USER_NAME="user1"
KAFKA_HOST="localhost:9092"
bin/kafka-configs.sh --bootstrap-server ${KAFKA_HOST} --describe --entity-type users --entity-name ${USER_NAME}
```

### 2. Shell - Zookeeper
#### 1. Topics
```
ZOOKEEPER_HOST="localhost:2181"
kafka-topics.sh --zookeeper ${ZOOKEEPER_HOST} --list
```

# REDIS

## LOGIN
```bash
export REDIS_PASSWORD=
redis-cli -a ${REDIS_PASSWORD}
```

## GET ALL DATABASE
```bash
export REDIS_PASSWORD=
redis-cli -a ${REDIS_PASSWORD} info keyspace
```

## GET ALL KEYS
```bash
export REDIS_PASSWORD=
redis-cli -a ${REDIS_PASSWORD} KEYS *
```

## GET ALL COMMAND
```bash
export REDIS_PASSWORD=
redis-cli -a ${REDIS_PASSWORD} COMMAND
```

## GET ROLE [ MASTER / SALVE ]
```bash
export REDIS_PASSWORD=
redis-cli -a ${REDIS_PASSWORD} INFO replication
```

## SEARCH WILDCARD KEYS
```bash
export REDIS_PASSWORD=
export DB=0
export REGEX=get_last_index_
redis-cli -a ${REDIS_PASSWORD} -n ${DB} KEYS "${REGEX}*"
```

## DELETE WILDCARD KEYS
```bash
export REDIS_PASSWORD=
export DB=0
export REGEX=get_last_index_
redis-cli -a ${REDIS_PASSWORD} -n ${DB} KEYS "${REGEX}*" | xargs -I {} redis-cli -a ${REDIS_PASSWORD} -n ${DB} DEL {}
```


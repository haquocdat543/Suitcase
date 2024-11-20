# REDIS

## LOGIN
```
redis-cli -a <AUTHENTICATE_TOKEN> 
```

## GET ALL DATABASE
```
redis-cli -a <AUTHENTICATE_TOKEN> info keyspace
```

## GET ALL KEYS
```
redis-cli -a <AUTHENTICATE_TOKEN> KEYS *
```

## GET ALL COMMAND
```
redis-cli -a <AUTHENTICATE_TOKEN> COMMAND
```

## GET ROLE [ MASTER / SALVE ]
```
redis-cli -a <AUTHENTICATE_TOKEN> INFO replication
```

## SEARCH WILDCARD KEYS
```
export REDIS_PASSWORD=
export DB=0
export REGEX=get_last_index_
redis-cli -a ${REDIS_PASSWORD} -n ${DB} KEYS "${REGEX}*"
```

## DELETE WILDCARD KEYS
```
export REDIS_PASSWORD=
export DB=0
export REGEX=get_last_index_
redis-cli -a ${REDIS_PASSWORD} -n ${DB} KEYS "${REGEX}*" | xargs -I {} redis-cli -a ${REDIS_PASSWORD} -n ${DB} DEL {}
```

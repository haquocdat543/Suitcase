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

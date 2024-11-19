# ELASTICSEARCH


## API
### Common
```
GET _all
```

### Cluster info
Cluster health:
```
GET _cluster/health
```

Cluster state:
```
GET _cluster/state
```

Cluster settings:
```
GET _cluster/settings
```
## Index
Add document
```
PUT my-index-000001/_doc/1
{
  "my_field": 5
}
```

## Alias
* A `data stream alias` points to one or more `data streams`.
* An `index alias` points to one or more `indices`.

Add an alias [ one index ]:
```
POST _aliases
{
  "actions": [
    {
      "add": {
        "index": "logs-nginx.access-prod",
        "alias": "logs"
      }
    }
  ]
}
```

Add an alias [ multiple indices ]:
```
POST _aliases
{
  "actions": [
    {
      "add": {
        "index": "logs-*",
        "alias": "logs"
      }
    }
  ]
}
```

Remove and alias [ one index ]:
```
POST _aliases
{
  "actions": [
    {
      "remove": {
        "index": "logs-nginx.access-prod",
        "alias": "logs"
      }
    }
  ]
}
```

Add an alias [ multiple indices ]:
```
POST _aliases
{
  "actions": [
    {
      "remove": {
        "index": "logs-*",
        "alias": "logs"
      }
    }
  ]
}
```

Multiple actions:
```
POST _aliases
{
  "actions": [
    {
      "remove": {
        "index": "logs-nginx.access-prod",
        "alias": "logs"
      }
    },
    {
      "add": {
        "index": "logs-my_app-default",
        "alias": "logs"
      }
    }
  ]
}
```

View aliases:
```
GET _alias
```

View aliases of [ data stream or index]:
```
GET my-data-stream/_alias
```

View alias after _alias to view its data streams or indices:
```
GET _alias/logs
```

## Scripts
Source:
```
GET my-index-000001/_search
{
  "script_fields": {
    "my_doubled_field": {
      "script": { 
        "source": "doc['my_field'].value * params['multiplier']", 
        "params": {
          "multiplier": 2
        }
      }
    }
  }
}
```

Post to Stored:
```
POST _scripts/calculate-score
{
  "script": {
    "lang": "painless",
    "source": "Math.log(_score * 2) + params['my_modifier']"
  }
}
```

Get from Stored:
```
GET _scripts/calculate-score
```

Use stored script in query:
```
GET my-index-000001/_search
{
  "query": {
    "script_score": {
      "query": {
        "match": {
            "message": "some message"
        }
      },
      "script": {
        "id": "calculate-score", 
        "params": {
          "my_modifier": 2
        }
      }
    }
  }
}
```

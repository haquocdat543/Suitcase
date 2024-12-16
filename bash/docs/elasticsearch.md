# ELASTICSEARCH

## Setup
Run locally:
```bash
curl -fsSL https://elastic.co/start-local | sh
```

## API
### Common
```bash
GET _all
```

### Cluster info
Cluster health:
```bash
GET _cluster/health
```

Cluster state:
```bash
GET _cluster/state
```

Cluster settings:
```bash
GET _cluster/settings
```
## Index
Add document
```bash
PUT my-index-000001/_doc/1
{
  "my_field": 5
}
```

## Alias
* A `data stream alias` points to one or more `data streams`.
* An `index alias` points to one or more `indices`.

Add an alias [ one index ]:
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
GET _alias
```

View aliases of [ data stream or index]:
```bash
GET my-data-stream/_alias
```

View alias after _alias to view its data streams or indices:
```bash
GET _alias/logs
```

## Scripts
Source:
```bash
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
```bash
POST _scripts/calculate-score
{
  "script": {
    "lang": "painless",
    "source": "Math.log(_score * 2) + params['my_modifier']"
  }
}
```

Get from Stored:
```bash
GET _scripts/calculate-score
```

Use stored script in query:
```bash
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

Delete stored script:
```bash
DELETE _scripts/calculate-score
```

Example:
- Create new index and document:
```bash
PUT my-index-000001/_doc/1
{
  "counter" : 1,
  "tags" : ["red"]
}
```

- Increment counter by 4:
```bash
POST my-index-000001/_update/1
{
  "script" : {
    "source": "ctx._source.counter += params.count",
    "lang": "painless",
    "params" : {
      "count" : 4
    }
  }
}
```

- Add more element to tag array:
```bash
POST my-index-000001/_update/1
{
  "script": {
    "source": "ctx._source.tags.add(params['tag'])",
    "lang": "painless",
    "params": {
      "tag": "blue"
    }
  }
}
```

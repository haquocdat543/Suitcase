# LOKI

## Query
### 1. Sum log in specific time range with pattern
```bash
count_over_time({container="some-container"} |= "some-text"[$__range])
```

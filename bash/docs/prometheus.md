# PROMETHEUS

### 1. Prometheus rule

There are 2 type of rule:
* Record
* Alert

#### 1. Record
```
groups:
- name: example
  rules:
  - record: job:http_inprogress_requests:sum
    expr: sum by (job) (http_inprogress_requests)
```
* In this example, a new time series job:http_inprogress_requests:sum is created by summing http_inprogress_requests for each job.


```
groups:
- name: example
  rules:
  - alert: HighRequestLatency
    expr: job:request_latency_seconds:mean5m{job="myjob"} > 0.5
    for: 10m
    labels:
      severity: warning
    annotations:
      summary: High request latency
```
* In this example, an alert named HighRequestLatency is triggered if the average request latency over 5 minutes exceeds 0.5 seconds for 10 minutes.

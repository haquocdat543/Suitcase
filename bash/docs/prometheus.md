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
* In this example, a new time series `job:http_inprogress_requests:sum` is created by summing http_inprogress_requests for each job.


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
* In this example, an alert named `HighRequestLatency` is triggered if the average request latency over 5 minutes exceeds 0.5 seconds for 10 minutes.

### 2. Alert manager

There are several alert manager:
* `Grouping`: Combine similar alerts to reduce noise.
* `Routing`: Direct alerts to appropriate receivers based on rules.
* `Silencing`: Temporarily mute alerts during known issues or maintenance.
* `Inhibition`: Suppress notifications for less critical alerts if more critical ones are firing.
* `Notification` Templates: Customize alert notifications.


Grouping:
```
route:
  group_by: ['alertname', 'job']
```

Routing:
```
route:
  receiver: team-X-mails
  routes:
  - match:
      severity: critical
    receiver: team-X-pager
```

Silencing:
```
silence:
  - matchers:
      - name: alertname
        value: HighRequestLatency
    createdBy: admin
    comment: "Silence during maintenance"
```

Inhibition:
```
inhibit_rules:
- source_match:
    severity: critical
  target_match:
    severity: warning
  equal: ['alertname', 'job']
```

Notification Templates:
```
receivers:
- name: 'team-X-mails'
  email_configs:
  - to: 'team-X@example.com'
    text: '{{ range .Alerts }}{{ .Annotations.summary }}\n{{ end }}'
```

### 3. Prometheus metrics
#### 1. Types
##### 1. Gauge
* method to change value:
```bash
Set(0) # set value to 0
Inc() # set increase value by 1
Dec() # decrease value by 1
Add(32) # add 32 unit to value
Sub(4) # subtract 4 unit to value
```
##### 2. Counter
* method to change value:
```bash
Reset()
Inc() # set increase value by 1
Add(32) # add 32 unit to value
```
##### 3. Histogram
* method to change value:
##### 4. Summary
* method to change value:

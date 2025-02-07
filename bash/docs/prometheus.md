# PROMETHEUS

## 1. Installation and setup
```bash
./prometheus \
--config.file="prometheus.yaml" \
--storage.tsdb.path="data/" \
--web.listen-address="0.0.0.0:9090"
```

basic configuration (prometheus.yaml):

```yaml
global:
  scrape_interval: 5s

  scrape_configs:
  - job_name: "prometheus"
    static_configs:
    - targets:
      - localhost:9090
  - job_name: "demo"
    static_configs:
    - targets:
      - demo.promlabs.com:10000
      - demo.promlabs.com:10001
      - demo.promlabs.com:10002
```

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
* Metrics from source format:
```bash
# HELP metric_name description
# HELP metric_name gauge
metric_name value
```

* Example:
- CPU
- Memory

* method to change value:
```bash
Set(0) # set value to 0
Inc() # set increase value by 1
Dec() # decrease value by 1
Add(32) # add 32 unit to value
Sub(4) # subtract 4 unit to value
```
##### 2. Counter
* Metrics from source format:
```bash
# HELP metric_name description
# HELP metric_name counter
metric_name value
```

* method to change value:
```bash
Reset()
Inc() # set increase value by 1
Add(32) # add 32 unit to value
```
* other methods:
```bash
rate()
irate()
increase()
```

##### 3. Summary
* Metrics from source format:
```bash
# HELP metric_name description
# HELP metric_name summary
metric_name{quantile="0.5"} value
metric_name{quantile="0.90"} value
metric_name{quantile="0.99"} value
metric_name_sum value
metric_name_count value

```

You can thintk summary is collection of gauges and counters

* method to change value:

Note: unable to avg()

##### 4. Histogram
* Metrics from source format:
```bash
# HELP metric_name description
# HELP metric_name histogram
metric_name{le="0.05"} value
metric_name{le="0.1"} value
metric_name{le="0.25"} value
metric_name{le="0.5"} value
metric_name{le="1"} value
metric_name{le="2.5"} value
metric_name{le="5"} value
metric_name{le="+Inf"} value
metric_name_sum value
metric_name_count value

```
* method to change value:

* Note: there are 2 types of history [normal, accumulative]

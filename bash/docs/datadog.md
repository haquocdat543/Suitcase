# DATADOG

### 1. Installation
#### 1. Helm operator
Add helm repo:
```
helm repo add datadog https://helm.datadoghq.com
helm install datadog-operator datadog/datadog-operator
```

Create secret for api-key:
* Bottom left corner `Avatar` ->> `Organization Setting` ->> `API Keys` ->> `New Key`
```
kubectl create secret generic datadog-secret --from-literal api-key=<DATADOG_API_KEY>
```

datadog-agent.yaml
```
apiVersion: datadoghq.com/v2alpha1
kind: DatadogAgent
metadata:
  name: datadog
spec:
  global:
    clusterName: <CLUSTER_NAME>
    site: <DATADOG_SITE>
    credentials:
      apiSecret:
        secretName: datadog-secret
        keyName: api-key
```
* Replace `<CLUSTER_NAME>` with a name for your cluster.
* Replace `<DATADOG_SITE>` with your Datadog site. Your site is datadoghq.com. (Ensure the correct SITE is selected on the right).

Apply agent manifest:
```
kubectl apply -f datadog-agent.yaml
```

datadog-agent.yaml ( optional ) [ Unprivileged installation ]:
```
apiVersion: datadoghq.com/v2alpha1
kind: DatadogAgent
metadata:
  name: datadog
spec:
  global:
    clusterName: <CLUSTER_NAME>
    site: <DATADOG_SITE>
    credentials:
      apiSecret:
        secretName: datadog-secret
        keyName: api-key
agent:
  config:
    securityContext:
      runAsUser: <USER_ID>
      supplementalGroups:
        - <GROUP_ID>
```
* Replace `<USER_ID>` with the UID to run the Datadog Agent.
* Replace `<GROUP_ID>` with the group ID that owns the Docker or containerd socket.

```
kubectl apply -f datadog-agent.yaml
```

datadog-agent.yaml ( optional ) [ container registry ]:
* `gcr.io/datadoghq`
* `public.ecr.aws/datadog`
* `docker.io/datadog`
```
apiVersion: datadoghq.com/v2alpha1
kind: DatadogAgent
metadata:
  name: datadog
spec:
  global:
    clusterName: <CLUSTER_NAME>
    registry: public.ecr.aws/datadog
    site: <DATADOG_SITE>
    credentials:
      apiSecret:
        secretName: datadog-secret
        keyName: api-key
```

Uninstallation:
```
kubectl delete datadogagent datadog
helm delete my-datadog-operator
```

#### 2. Helm only
Add helm repo:
```
helm repo add datadog https://helm.datadoghq.com
helm repo update
```

Create secret for apy-key:
```
kubectl create secret generic datadog-secret --from-literal api-key=<DATADOG_API_KEY>
```

datadog-values.yaml
```
datadog:
 apiKeyExistingSecret: datadog-secret
 site: <DATADOG_SITE>
```
* Replace `<DATADOG_SITE>` with your Datadog site. Your site is `datadoghq.com`. (Ensure the correct SITE is selected on the right).

Install helm repo with `value file`:
```
helm install datadog-agent -f datadog-values.yaml datadog/datadog
```

Install helm repo with `value file` ( optional ) [ Unprivileged installation ]:
```
datadog:
  apiKeyExistingSecret: datadog-secret
  site: <DATADOG_SITE>
  securityContext:
      runAsUser: <USER_ID>
      supplementalGroups:
        - <GROUP_ID>
```

Install helm repo with `value file` ( optional ) [ Container registry ]:
```
registry: public.ecr.aws/datadog
datadog:
  apiKeyExistingSecret: datadog-secret
  site: <DATADOG_SITE>
```

Uninstallation:
```
helm uninstall datadog-agent
```


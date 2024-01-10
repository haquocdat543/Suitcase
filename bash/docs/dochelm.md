# Helm
### 1. How we can find helm chart
* ArtifactHub ( Like find image on DockerHub )
  * Stable      https://charts.helm.sh/stable 
  * Bitnami     https://charts.bitnami.com/bitnami
  * Prom-repo   https://prometheus-community.github.io/helm-charts
### 2. Generate helm
```
helm create <helm-name>
```
```
tree <helm-name>
```
<helm-name>/
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   ├── serviceaccount.yaml
│   └── tests
│       └── test-connection.yaml
├── test.yaml
└── values.yaml

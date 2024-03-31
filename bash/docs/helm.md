# Helm
### 1. How we can find helm chart
* ArtifactHub ( Like find image on DockerHub )
  * Stable      https://charts.helm.sh/stable 
  * Bitnami     https://charts.bitnami.com/bitnami
  * Prom-repo   https://prometheus-community.github.io/helm-charts
### 2. Generate helm
#### 1. Generate helm folder
```
helm create <helm-name>
```

#### 2. Generate helm folder
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

#### 3. Functions
If you know Terraform already. Helm is just a `bunch` of `manifest files` **templates/** with `variables` **values.yaml** and `modules` **charts/**.

* `Chart.yaml`: A YAML file containing `information` about the chart
* `LICENSE`: OPTIONAL: A plain text file containing the `license` for the chart
* `README.md`: OPTIONAL: A human-readable `README` file
* `values.yaml`: The `default configuration values` for this chart
* `values.schema.json`: OPTIONAL: A JSON Schema for `imposing` a structure on the `values.yaml` file
* `charts/`: A directory containing any `charts` upon which this chart `depends`.
* `crds/`: Custom Resource Definitions
* `templates/`: A directory of `templates` that, when combined with `values`,
* `templates/NOTES.txt`: OPTIONAL: A plain text file containing short usage notes

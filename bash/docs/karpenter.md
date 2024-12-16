# KARPENTER

karpenter is a tool use to auto scale node amount on EKS cluster
## 1. Installation
Provisioner:
 
```yaml
---
apiVersion: karpenter.sh/v1alpha5
kind: Provisioner
metadata:
  name: default
spec:
  ttlSecondsAfterEmpty: 60 # scale down nodes after 60 seconds without workloads (excluding daemons)
  ttlSecondsUntilExpired: 604800 # expire nodes after 7 days (in seconds) = 7 * 60 * 60 * 24
  limits:
    resources:
      cpu: 100 # limit to 100 CPU cores
  requirements:
    # Include general purpose instance families
    - key: karpenter.k8s.aws/instance-family
      operator: In
    # values: [c5, m5, r5]
      values: [t3]
    # Exclude small instance sizes
    - key: karpenter.k8s.aws/instance-size
      operator: NotIn
      values: [nano, micro, small, large]
  providerRef:
    name: bottle-rocket
---
apiVersion: karpenter.k8s.aws/v1alpha1
kind: AWSNodeTemplate
metadata:
  name: bottle-rocket
spec:
  amiFamily: Bottlerocket
  subnetSelector:
    kubernetes.io/cluster/my-eks: owned
  securityGroupSelector:
    kubernetes.io/cluster/my-eks: owned

```

Deployment with high resources requests:
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        resources:
          requests:
            cpu: "4"
            memory: 4Gi
        ports:
        - containerPort: 80

```

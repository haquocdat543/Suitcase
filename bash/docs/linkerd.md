# LINKERD KUBERNETES

# Installation
## 1. Binary
Execute installation script:
```bash
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install-edge | sh
```
Export variable:
```bash
export PATH=$HOME/.linkerd2/bin:$PATH
```
Check version:
```bash
linkerd version
```

## 2. Resources
Check for prerequisites:
```bash
linkerd check --pre
```
Install linkerd resources:
```bash
linkerd install --crds | kubectl apply -f -
```
```bash
linkerd install | kubectl apply -f -
```
Check linkerd again:
```bash
linkerd check
```

## 3. Demo app
Apply resources from internet:
```bash
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml | kubectl apply -f -
```
Apply resources from internet:
```bash
kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -
```
Check proxy:
```bash
linkerd -n emojivoto check --proxy
```

## 4. Dashboard
Install dashboard:
```bash
linkerd viz install | kubectl apply -f - # install the on-cluster metrics stack
```
Check linkerd:
```
linkerd check
```
Initialize dashboard:
```
linkerd viz dashboard &
```

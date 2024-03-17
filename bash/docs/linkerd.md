# LINKERD KUBERNETES

# Installation
## 1. Binary
Execute installation script:
```
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install-edge | sh
```
Export variable:
```
export PATH=$HOME/.linkerd2/bin:$PATH
```
Check version:
```
linkerd version
```

## 2. Resources
Check for prerequisites:
```
linkerd check --pre
```
Install linkerd resources:
```
linkerd install --crds | kubectl apply -f -
```
```
linkerd install | kubectl apply -f -
```
Check linkerd again:
```
linkerd check
```

## 3. Demo app
Apply resources from internet:
```
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml | kubectl apply -f -
```
Apply resources from internet:
```
kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -
```
Check proxy:
```
linkerd -n emojivoto check --proxy
```

## 4. Dashboard
Install dashboard:
```
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

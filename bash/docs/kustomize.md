# KUSTOMIZE

## 1. Installation
Get latest kustomize binary and move it to PATH:
```
cd
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv ~/kustomize /usr/local/bin/kustomize
cd -
```

## 2. Usage
### 1. Initialization
Initialize new kustomize file:
```
kustomize init
```

### 2. Build
Build files:
```
kustomize build .
```

### 3. Overlays - base
```
```

### 4. Patch
```
```

### 5. Component
```
* base
  * kustomization.yaml
  * web-depl.yaml
  * web-svc.yaml
* components
  * cache
    * kustomization.yaml
    * cache_cfg.yaml
    * cache_depl.yaml
  * external_DB
    * external_DB_cfg.yaml
    * external_DB_depl.yaml
    * kustomization.yaml
* overlays
  * dev
    * kustomization.yaml
  * stag
    * kustomization.yaml
  * prod
    * kustomization.yaml
```

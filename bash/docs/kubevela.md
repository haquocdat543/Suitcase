# KUBERNETES KUBEVELA

## Installation
### 1. Helm
```
helm repo add kubevela https://kubevela.github.io/charts
helm repo update
helm install --create-namespace -n vela-system kubevela kubevela/vela-core --wait
```
### 2. CLI
```
vela install
```

## Binary
MacOS and Linux:
```
curl -fsSl https://kubevela.io/script/install.sh | bash
```

HomeBrew:
```
brew update
brew install kubevela
```

## VelaUX
* Default username: `admin`
* Default password: `VelaUX12345`

Local:
```
vela addon enable ~/.vela/addons/velaux
```
```
vela port-forward addon-velaux -n vela-system 8080:80
```

Remote server:
```
velad install --bind-ip=$SERVER_PUBLIC_IP
```

Cluster:
```
vela addon enable velaux serviceType=LoadBalancer
```

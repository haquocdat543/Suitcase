# Vault 

### 1. Installation
```
https://developer.hashicorp.com/vault/docs/install
```

### 2. Initialization
Development environment:
```
vault server -dev -dev-listen-address="0.0.0.0:8200"
```

Production environment:
```
vault server -prod -prod-listen-address="0.0.0.0:8200"
```

* Copy `server ip address` and access it on `browser` on `port 8200`:
* Choose `authentication method`: Choose token ->> Copy token ->> Paste token ->> Enter

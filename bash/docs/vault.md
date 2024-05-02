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

### 3. Create policy & role
terraform policy:
```
vault policy write terraform - <<EOF 
path "*" {
  capabilities = ["list", "read"]
}

path "secrets/data/*" {
  capabilities = ["create", "update", "delete", "list", "read"]
}

path "secret/data/*" {
  capabilities = ["create", "update", "delete", "list", "read"]
}

path "kv/data/*" {
  capabilities = ["create", "update", "delete", "list", "read"]
}

path "auth/token/create" {
  capabilities = ["create", "update", "list", "read"]
}
EOF
```

terraform role:
```
vault write auth/approle/role/terraform \
secret_id_ttl=10m
token_num_uses=10
token_ttl=20m token_max_ttl=30m
secret_num_id_uses=40
token_policies=terraform
```

### 4. Read value
```
vault read auth/approle/role/terraform/role-id
```

### 5. Write value
```
vault write -f auth/approle/role/terraform/secret-id
```


#!/bin/bash

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

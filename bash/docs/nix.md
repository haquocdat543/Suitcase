# NIX

## 1. Binaries
* nix-env
* nix-channel

### 1. nix env
Install packages
```bash
nix-env -i <package-name>
```

Remove packages
```bash
nix-env -e <package-name>
```

Query installed packages
```bash
nix-env --query "*"
```

Update package
```bash
nix-env -u <package-name>
```

Search package
```bash
nix-env search "regex"
```

### 1. nix shell
Experimentally:
```bash
nix-shell -p grafana
```

Experimentally run command:
```bash
nix-shell -p python3 --run "python3 --version"
```

## 2. Configuration

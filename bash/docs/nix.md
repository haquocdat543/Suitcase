# NIX

## 1. Binaries
* nix-env
* nix-channel

### 1. nix env
Install packages
```
nix-env -i <package-name>
```

Remove packages
```
nix-env -e <package-name>
```

Query installed packages
```
nix-env --query "*"
```

Update package
```
nix-env -u <package-name>
```

Search package
```
nix-env search "regex"
```

## 2. Configuration

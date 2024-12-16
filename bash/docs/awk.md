# AWK

### 1. OS Check
```bash
wk -F= '/^NAME/{print $2}' /etc/os-release
```


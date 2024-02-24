# AWK

### 1. OS Check
```
wk -F= '/^NAME/{print $2}' /etc/os-release
```


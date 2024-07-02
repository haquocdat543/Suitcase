# EFS

### 1. Initialization
Mount only ID:
```
sudo mount -t efs -o tls fs-0ab2026af51de9f31:/ efs
```

Mount by DNS:
```
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0ab2026af51de9f31.efs.ap-southeast-1.amazonaws.com:/ efs
```

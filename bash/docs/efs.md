# EFS

### 1. Initialization
### 2. Create EC2 insstance
Instance profile:
* `AmazonElasticFileSystemFullAccess`
* `AmazonElasticFileSystemClientReadWriteAccess`

### 2. Create EC2 Security group
* Need to open port `2049`
* Can be from `everywhere`
* only from instance `IP Address`
* only from instance's `security group`

### 3. Create EFS volume
Please check for:
* Volume size
* Mount target
* Access policy
* Access point

### 4. Mount EFS volume to EC2 instance
Mount only ID:
```
sudo mount -t efs -o tls fs-0ab2026af51de9f31:/ efs
```

Mount by DNS:
```
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0ab2026af51de9f31.efs.ap-southeast-1.amazonaws.com:/ efs
```

Mount by DNS on specific path:
```
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0ab2026af51de9f31.efs.ap-southeast-1.amazonaws.com:/specific/path efs
```

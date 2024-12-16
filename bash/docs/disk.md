# DISK

## Mount new one
### 1. list block
list block:
```bash
lsblk
```

list mount:
```bash
mount
```

list filesystem:
```bash
df -H
```

### 2. Format disk
Format with ext4:
```bash
sudo mkfs -t ext4 /dev/xvdf
```

### 3. Create or choose existing folder
```bash
sudo mkdir /mnt/ebs_volume
```

### 4. Mount disk to folder
```bash
sudo mount /dev/xvdf /mnt/ebs_volume
```

### 5. Mount on `etc/fstab`
Automatically mount on system boot:
```bash
echo "/dev/xvdf /mnt/ebs_volume ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab
```


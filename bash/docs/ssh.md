# SSH

## 1. Use case
#### 1. Ssh execute
```
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USERNAME@$HOST "mkdir -p ~/.kubernetes"
```
#### 2. Copy from local to server
```
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -prq "$HOME/$FILE" "$USERNAME@$HOST:/home/$USERNAME/.kubernetes/" 
```
#### 3. Copy from server to local
```
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -prq "$USERNAME@$HOST:/home/$USERNAME/.kubernetes/*" "$HOME/" 
```

## 2. Daemon
Configuration path:
```
sudo vim /etc/ssh/sshd_config
```

Systemctl start:
```
sudo systemctl start ssh
sudo systemctl enable ssh
```

Systemctl restart:
```
sudo systemctl restart ssh
```

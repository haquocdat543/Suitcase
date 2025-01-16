# SSH

## 1. Use case
#### 1. Ssh execute
```bash
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USERNAME@$HOST "mkdir -p ~/.kubernetes"
```
#### 2. Copy from local to server
```bash
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -prq "$HOME/$FILE" "$USERNAME@$HOST:/home/$USERNAME/.kubernetes/" 
```
#### 3. Copy from server to local
```bash
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -prq "$USERNAME@$HOST:/home/$USERNAME/.kubernetes/*" "$HOME/" 
```

## 2. Daemon
Configuration path:
```bash
sudo vim /etc/ssh/sshd_config
```

Systemctl start:
```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Systemctl restart:
```bash
sudo systemctl restart ssh
```

## 3. Jump & proxy
Use proxy:
```bash
ssh -i <Remote-key> -o ProxyCommand="ssh -i <Jump-key> -W %h:%p JumpUser@JumpHost -p <Jump-Port>" RemoteUser@RemoteHost
```

Setup jump server configuration:
```
Host <Jump-Name>
    hostname <Jump-Host-IP>
    user <Username>
    port <Port>
    AddKeysToAgent yes
    ForwardAgent yes
    IdentityFile "<Path-2-key>"
```

After setup configuration for jump server:
```bash
ssh -J <Jump-Name> <Remote-Username>@<Remote-IP>
```

After setup configuration for jump server [ with specific destination host port ]:
```bash
ssh -J <Jump-Name> <Remote-Username>@<Remote-IP> -p <Remote-Port>
```

## 4. Config
### 1. Both private key and password at the same time
```bash
AuthenticationMethods "publickey,password"
AuthenticationMethods "publickey,keyboard-interactive"
```

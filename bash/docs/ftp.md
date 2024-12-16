# FTP

## 1. Setup FTP
### 1 Setup on CentOS
* Note: if you are using cloud please open `port 21`

Update packages:
```bash
sudo yum update -y
```

Install vsftp:
```bash
sudo yum install vsftpd -y
```

Edit configuration file:
```bash
/etc/vsftpd/vsftpd.conf
```

Set anonymous_enable to NO to disable anonymous logins:
```toml
anonymous_enable=NO
```

Allow local users to log in:
```toml
local_enable=YES
```

Enable write permissions for local users:
```toml
write_enable=YES
```

Uncomment or add the following lines to configure passive mode:
```toml
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=31000
pasv_address=your-ec2-public-ip
```

Ensure the FTP root directory is writable:
```toml
chroot_local_user=YES
allow_writeable_chroot=YES
```

Restart the vsftpd service to apply the changes.
```toml
sudo systemctl restart vsftpd
sudo systemctl enable vsftpd
```

Create a New User:
```toml
sudo adduser ftpuser
sudo passwd ftpuser
```

Create a home directory for the FTP user and set appropriate permissions.
```bash
sudo mkdir -p /home/ftpuser/ftp
sudo chown nobody:nogroup /home/ftpuser/ftp
sudo chmod a-w /home/ftpuser/ftp
sudo mkdir /home/ftpuser/ftp/files
sudo chown ftpuser:ftpuser /home/ftpuser/ftp/files
```

## 2. Connect
### 1. Install tool
* GUI: Filezilla, WinSCP, GoodSync,...
* CLI: ftp, lftp,...

MacOS:
```bash
brew install lftp
```

CentOS:
```bash
yum install -y lftp
```

Ubuntu:
```bash
apt-get install -y ftp
```

### 2. Connect using CLI
```bash
lftp ftpuser@1.1.1.1
```
Enter password:

List files:
```bash
ls -la
```

## 1. Setup SFTP
### 1 Setup on CentOS
* Note: if you are using cloud please open `port 22`

Update packages:
```bash
sudo yum update -y 
```

Install SSH Server:
```bash
sudo yum install openssh-server -y 
```

Once installed, start the SSH service and enable it to start at boot:
```bash
sudo systemctl start sshd 
sudo systemctl enable sshd 
```

Create an SFTP User:
```bash
sudo adduser sftpuser 
```

Set the password for the new user:
```bash
sudo passwd sftpuser 
```

Configure SFTP
```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak 
```

Next, open the SSHD configuration file with a text editor of your choice. Here, we’ll use vi:
```bash
sudo vi /etc/ssh/sshd_config 
```

Add the following lines at the bottom of the file:
```toml
Match User sftpuser
    ForceCommand internal-sftp
    PasswordAuthentication yes
    ChrootDirectory /home/sftpuser
    PermitTunnel no
    AllowAgentForwarding no
    AllowTcpForwarding no
    X11Forwarding no
```

In this configuration:
* `Match User sftpuser` applies the configuration to our user, ‘sftpuser’.
* `ForceCommand internal-sftp` restricts the user to SFTP and disallows SSH.
* `PasswordAuthentication yes` allows password authentication for this user.
* `ChrootDirectory /home/sftpuser` confines the user to their home directory.
* The other lines disable various SSH features to limit the user’s capabilities.


Set Directory Permissions
```bash
sudo chown root:root /home/sftpuser 
sudo chmod 755 /home/sftpuser 
```

If the user needs a directory to upload files, you can create a directory inside the user’s home directory and give the user ownership:
```bash
sudo mkdir /home/sftpuser/files 
sudo chown sftpuser:sftpuser /home/sftpuser/files 
```

Testing SFTP Access
```bash
sftp sftpuser@your_server_ip 
```


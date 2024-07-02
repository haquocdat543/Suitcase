# FTP

## 1. Setup 
### 1 Setup on CentOS
* Note: if you are using cloud please open `port 21`

Update packages:
```
sudo yum update -y
```

Install vsftp:
```
sudo yum install vsftpd -y
```

Edit configuration file:
```
/etc/vsftpd/vsftpd.conf
```

Set anonymous_enable to NO to disable anonymous logins:
```
anonymous_enable=NO
```

Allow local users to log in:
```
local_enable=YES
```

Enable write permissions for local users:
```
write_enable=YES
```

Uncomment or add the following lines to configure passive mode:
```
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=31000
pasv_address=your-ec2-public-ip
```

Ensure the FTP root directory is writable:
```
chroot_local_user=YES
allow_writeable_chroot=YES
```

Restart the vsftpd service to apply the changes.
```
sudo systemctl restart vsftpd
sudo systemctl enable vsftpd
```

Create a New User:
```
sudo adduser ftpuser
sudo passwd ftpuser
```

Create a home directory for the FTP user and set appropriate permissions.
```
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
```
brew install lftp
```

CentOS:
```
yum install -y lftp
```

Ubuntu:
```
apt-get install -y ftp
```

### 2. Connect using CLI
```
lftp ftpuser@1.1.1.1
```
Enter password:

List files:
```
ls -la
```

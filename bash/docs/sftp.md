# SFTP

## Basic operations
1. login with SSH private key
```bash
sftp -i /path/to/key username@domain/serverip
```

2. Get local current directory
```bash
lpwd
```

3. List local files and directories
```bash
lls
```

4. change local directory path
```bash
lcd
```

5. put local or directory file to remote
```bash
put /path/to/local/file /path/to/remote/directory
```

6. Download remote file or directory
```bash
get /path/to/remote/file/or/directory
```

download to specific local path:
```bash
get /path/to/remote/file/or/directory /path/to/local/directory 
```

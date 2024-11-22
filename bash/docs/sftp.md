# SFTP

## Basic operations
1. login with SSH private key
```
sftp -i /path/to/key username@domain/serverip
```

2. Get local current directory
```
lpwd
```

3. List local files and directories
```
lls
```

4. change local directory path
```
lcd
```

5. put local or directory file to remote
```
put /path/to/local/file /path/to/remote/directory
```

6. Download remote file or directory
```
get /path/to/remote/file/or/directory
```

download to specific local path:
```
get /path/to/remote/file/or/directory /path/to/local/directory 
```

# SUDO

## 1. Case
#### 1. Prevent someone execute specific command
Edit `sudoer` file:
```
vi /etc/sudoer
```
Sample:
```
username ALL=(ALL) !/path/to/command
```
Example:
```
hadat ALL=(ALL) !/usr/local/bin/lazygit
```

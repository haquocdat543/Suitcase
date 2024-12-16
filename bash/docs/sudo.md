# SUDO

## 1. Case
#### 1. Prevent someone execute specific command
Edit `sudoer` file:
```bash
vi /etc/sudoer
```
Sample:
```toml
username ALL=(ALL) !/path/to/command
```
Example:
```toml
hadat ALL=(ALL) !/usr/local/bin/lazygit
```

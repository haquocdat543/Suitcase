# FLOCK

## 1. Sample
```bash
flock /path/to/file --command "the_actual_command"
```
## 2. Wait till the lock is released (the default behavior)
```bash
flock /path/to/file --command "the_actual_command"
```
```bash
flock -x /path/to/file --command "the_actual_command"
```
## 3. Stop if the file is locked
```bash
flock -n /path/to/file --command "the_actual_command"
```
## 4. Use a shared lock
```bash
flock -s /path/to/file "the_actual_command"
```
## 5. Unlock the file
```bash
flock -u /path/to/file --command "actual_command"
```

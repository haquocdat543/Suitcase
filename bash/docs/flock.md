# FLOCK

## 1. Sample
```
flock /path/to/file --command "the_actual_command"
```
## 2. Wait till the lock is released (the default behavior)
```
flock /path/to/file --command "the_actual_command"
```
```
flock -x /path/to/file --command "the_actual_command"
```
## 3. Stop if the file is locked
```
flock -n /path/to/file --command "the_actual_command"
```
## 4. Use a shared lock
```
flock -s /path/to/file "the_actual_command"
```
## 5. Unlock the file
```
flock -u /path/to/file --command "actual_command"
```

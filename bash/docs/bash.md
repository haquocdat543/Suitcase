# BASH

### 1. Bash
#### 1. Check if binary exist
```bash
docker version &>/dev/null || echo "Problems with docker! Check if docker is installed or/and docker daemon is running."
```

#### 2. Background running
* & sign at the end of line:
* the & character at the end of a command means that the command will be executed in the background. This allows the script to continue running the next command immediately without waiting for the previous command to finish.
```bash
long_running_command &
```


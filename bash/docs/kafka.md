# KAFKA

## 1. Download
### 1. Binary
```
#!/bin/bash

# Get url as argument
URL=${1}

# Gunzip
KAKFA_GUNZIP=$(ls -1 | grep kafka)
gunzip ${KAKFA_GUNZIP}

# Tar unzip
KAKFA_TAR=$(ls -1 | grep kafka)
tar -xvzf ${KAKFA_TAR}
```

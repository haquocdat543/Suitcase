# VELERO

## INSTALLATION
Note: this instruction guide how to install velero to Kubernetes cluster
### 1 With binary
* AWS:
```
velero install \
  --provider aws \
  --plugins velero/velero-plugin-for-aws:v1.3.0 \
  --bucket ${BUCKET} \
  --backup-location-config region=${REGION} \
  --secret-file ${PATH_TO_SECRET_FILE} \
  --use-volume-snapshots=false \
  --use-restic \
  --default-volumes-to-restic
```

## USAGE
* AWS:
Get backups
```
velero backup get
```

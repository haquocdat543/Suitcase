# VELERO

## INSTALLATION
Note: this instruction guide how to install velero to Kubernetes cluster
### 1 With binary
* AWS:
```bash
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
```bash
velero backup get
```

Create backup 
```bash
BACKUP_NAME=""
NAMESPACE=""
velero backup create ${BACKUP_NAME} --include-namespaces ${NAMESPACE} --wait
```

Restore backup 
```bash
BACKUP_NAME=""
velero restore create --from-backup=${BACKUP_NAME} --wait
```

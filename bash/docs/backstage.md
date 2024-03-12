# BAKSRAGE KUBERNETES


## 1. Deploy on kubernetes
### 1. Create namespace
Command line:
```
kubectl create namespace backstage
```
Manifest file:
```
# kubernetes/namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: backstage
```
```
kubectl apply -f kubernetes/namespace.yaml
```
### 2. Create PostgreSQL
Create `base64` encoded secret:
```
echo -n "backstage" | base64
echo -n "hunter2" | base64
```
Manifest file:
```
# kubernetes/postgres-secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: postgres-secrets
  namespace: backstage
type: Opaque
data:
  POSTGRES_USER: YmFja3N0YWdl
  POSTGRES_PASSWORD: aHVudGVyMg==
```
Apply secret:
```
kubectl apply -f kubernetes/postgres-secrets.yaml
```
Create volume [manifest file]:
```
# kubernetes/postgres-storage.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: postgres-storage
  namespace: backstage
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 2G
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: '/mnt/data'
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-storage-claim
  namespace: backstage
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2G
```
Apply volume:
```
kubectl apply -f kubernetes/postgres-storage.yam
```
Create `PostgreSQL` deployment:
```
# kubernetes/postgres.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
  namespace: backstage
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
        - name: postgres
          image: postgres:13.2-alpine
          imagePullPolicy: 'IfNotPresent'
          ports:
            - containerPort: 5432
          envFrom:
            - secretRef:
                name: postgres-secrets
          volumeMounts:
            - mountPath: /var/lib/postgresql/data
              name: postgresdb
      volumes:
        - name: postgresdb
          persistentVolumeClaim:
            claimName: postgres-storage-claim
```
```
kubectl apply -f kubernetes/postgres.yaml
```
```
kubectl get pods --namespace=backstage
```
Verify the deployment by connecting to the pod:
```
kubectl exec -it --namespace=backstage POSTGRESQL_POD_ID -- /bin/bash
bash-5.1# psql -U $POSTGRES_USER
backstage=# \q
bash-5.1# exit
```
Create service:
```
# kubernetes/postgres-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: postgres
  namespace: backstage
spec:
  selector:
    app: postgres
  ports:
    - port: 5432
```
```
kubectl apply -f kubernetes/postgres-service.yaml
```
```
kubectl get services --namespace=backstage
```

### 3. Create Backstage
Create secret:
```
# kubernetes/backstage-secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: backstage-secrets
  namespace: backstage
type: Opaque
data:
  GITHUB_TOKEN: VG9rZW5Ub2tlblRva2VuVG9rZW5NYWxrb3ZpY2hUb2tlbg==
```
```
kubectl apply -f kubernetes/backstage-secrets.yaml
```
Create deployment:
```
# kubernetes/backstage.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backstage
  namespace: backstage
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backstage
  template:
    metadata:
      labels:
        app: backstage
    spec:
      containers:
        - name: backstage
          image: backstage:1.0.0
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 7007
          envFrom:
            - secretRef:
                name: postgres-secrets
            - secretRef:
                name: backstage-secrets
# Uncomment if health checks are enabled in your app:
# https://backstage.io/docs/plugins/observability#health-checks
#          readinessProbe:
#            httpGet:
#              port: 7007
#              path: /healthcheck
#          livenessProbe:
#            httpGet:
#              port: 7007
#              path: /healthcheck
```
```
kubectl apply -f kubernetes/backstage.yaml
```
```
kubectl get deployments --namespace=backstage
```
```
kubectl get pods --namespace=backstage
```
```
kubectl logs --namespace=backstage -f BACKSTAGE_POD_ID -c backstage
```
Create service:
```
# kubernetes/backstage-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: backstage
  namespace: backstage
spec:
  selector:
    app: backstage
  type: LoadBalancer
  ports:
    - name: http
      port: 80
      targetPort: http
```
```
kubectl apply -f kubernetes/backstage-service.yaml
```

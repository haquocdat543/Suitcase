# CERT MANAGER

### 1. Installation
#### 1. Manifest
Apply manifest:
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.0/cert-manager.yaml
```

Get resources:
```
kubectl get pods --namespace cert-manager
```

#### 2. Helm
Add helm repository:
```
helm repo add jetstack https://charts.jetstack.io --force-update
```

Apply helm:
```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.0 \
  --set crds.enabled=true
```

Apply helm ( with option ):
```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.0 \
  --set crds.enabled=true \
  --set prometheus.enabled=false \  # Example: disabling prometheus using a Helm parameter
  --set webhook.timeoutSeconds=4   # Example: changing the webhook timeout using a Helm parameter
```

### 2. Implementation
#### 1. Self signed
```
apiVersion: v1
kind: Namespace
metadata:
  name: sandbox
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-issuer
spec:
  selfSigned: {}
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: my-selfsigned-ca
  namespace: sandbox
spec:
  isCA: true
  commonName: my-selfsigned-ca
  secretName: root-secret
  privateKey:
    algorithm: ECDSA
    size: 256
  issuerRef:
    name: selfsigned-issuer
    kind: ClusterIssuer
    group: cert-manager.io
---
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: my-ca-issuer
  namespace: sandbox
spec:
  ca:
    secretName: root-secret
```

#### 2. ACME
##### 1. HTTP01
##### 2. DNS01
###### 1. Cloudflare
Cloudflare[API TOKEN]:
```
piVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-token-secret
type: Opaque
stringData:
  api-token: <API Token>
---
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: example-issuer
spec:
  acme:
    ...
    solvers:
    - dns01:
        cloudflare:
          apiTokenSecretRef:
            name: cloudflare-api-token-secret
            key: api-token
```

Cloudflare[API KEY]:
```
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-api-key-secret
type: Opaque
stringData:
  api-key: <API Key>
---
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: example-issuer
spec:
  acme:
    ...
    solvers:
    - dns01:
        cloudflare:
          email: my-cloudflare-acc@example.com
          apiKeySecretRef:
            name: cloudflare-api-key-secret
            key: api-key
```

Cloudflare[TROUBLESHOOTING]:
* Actor `com.cloudflare.api.token.xxxx` requires permission `com.cloudflare.api.account.zone.list` to list zones
- The token lacks the `Zone - Zone - Read` permission
- cert-manager identified the wrong zone name for the domain due to DNS issues.

In the case of the 2nd issue you will see an error like below:
```
Events:
  Type     Reason        Age              From          Message
  ----     ------        ----             ----          -------
  Normal   Started       6s               cert-manager  Challenge scheduled for processing
  Warning  PresentError  3s (x2 over 3s)  cert-manager  Error presenting challenge: Cloudflare API Error for GET "/zones?name=<TLD>" 
            Error: 0: Actor 'com.cloudflare.api.token.xxxx' requires permission 'com.cloudflare.api.account.zone.list' to list zones
```

In this case we recommend [changing your DNS01 self-check nameservers](https://cert-manager.io/docs/configuration/acme/dns01/#setting-nameservers-for-dns01-self-check)

###### 2. Route53
Route53[IAM]
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "route53:GetChange",
      "Resource": "arn:aws:route53:::change/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets"
      ],
      "Resource": "arn:aws:route53:::hostedzone/DIKER8JEXAMPLE"
    },
    {
      "Effect": "Allow",
      "Action": "route53:ListHostedZonesByName",
      "Resource": "*"
    }
  ]
}
```

Route53[Cross Account Access]
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::XXXXXXXXXXX:role/cert-manager"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

Route53[Trust relationship]
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

Route53[ClusterIssuer]
```
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    ...
    solvers:

    # example: cross-account zone management for example.com
    # this solver uses ambient credentials (i.e. inferred from the environment or EC2 Metadata Service)
    # to assume a role in a different account
    - selector:
        dnsZones:
          - "example.com"
      dns01:
        route53:
          region: us-east-1
          hostedZoneID: DIKER8JEXAMPLE # optional, see policy above
          role: arn:aws:iam::YYYYYYYYYYYY:role/dns-manager

    # this solver handles example.org challenges
    # and uses explicit credentials
    - selector:
        dnsZones:
          - "example.org"
      dns01:
        route53:
          region: eu-central-1
          # The AWS access key ID can be specified using the literal accessKeyID parameter
          # or retrieved from a secret using the accessKeyIDSecretRef
          # If using accessKeyID, omit the accessKeyIDSecretRef parameter and vice-versa
          accessKeyID: AKIAIOSFODNN7EXAMPLE
          accessKeyIDSecretRef:
            name: prod-route53-credentials-secret
            key: access-key-id
          secretAccessKeySecretRef:
            name: prod-route53-credentials-secret
            key: secret-access-key
          # you can also assume a role with these credentials
          role: arn:aws:iam::YYYYYYYYYYYY:role/dns-manager
```

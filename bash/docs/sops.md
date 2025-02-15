# SOPS

## 1. Installation
MacOS:
```bash
brew install sops
```

Build from source [ require Go >= 1.19 ]:
```bash
mkdir -p $GOPATH/src/github.com/getsops/sops/
git clone https://github.com/getsops/sops.git $GOPATH/src/github.com/getsops/sops/
cd $GOPATH/src/github.com/getsops/sops/
make install
```

## 2. Create key
AWS KMS:
```bash
export KEY_ARN=$(aws kms create-key --description "My symmetric encryption key" --key-usage ENCRYPT_DECRYPT --origin AWS_KMS | jq -r '.KeyMetadata.Arn')
echo "Key arn: ${KEY_ARN}"
```

## 3. Usage
AWS KMS:
```bash
sops --kms '[KEY_ARN]' awsfile.yaml
```

GCP KMS:
```bash
sops --gcp-kms [GPC_KMS_RESOURCE_ID] gcpfile.yaml
```

## 4. Configuration files
```
```

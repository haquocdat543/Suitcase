# SOPS

## 1. Installation
MacOS:
```
brew install sops
```

Build from source [ require Go >= 1.19 ]:
```
mkdir -p $GOPATH/src/github.com/getsops/sops/
git clone https://github.com/getsops/sops.git $GOPATH/src/github.com/getsops/sops/
cd $GOPATH/src/github.com/getsops/sops/
make install
```

## 2. Usage
AWS KMS:
```
sops --kms '[KEY_ARN]' awsfile.yaml
```

GCP KMS:
```
sops --gcp-kms [GPC_KMS_RESOURCE_ID] gcpfile.yaml
```

## 3. Configuration files
```
```

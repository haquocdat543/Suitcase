# SERVERLESS

## 1. Installation
with npm:
```bash
npm install -g serverlesnstall -g serverlesss
```
or:
```bash
npm install -g serverless@3
```

with pip:
```bash
npm install -g serverlesnstall -g serverlesss
```
## 2. Credential configuration
```bash
serverless config credentials --provider aws --key KEY --secret SECRET --profile PROFILE
```

## 3. Sample project
```bash
sls create --template aws-nodejs --path myServerlessProject
cd myServerlessProject
```

## 4. Deploy  project
```bash
sls deploy
```

## 5. Remove project
```bash
sls remove
```

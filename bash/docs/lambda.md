# AWS Lambda

## 1. Basic operation
List function:
```bash
aws lambda list-functions
```

## 2. Configuration
### 1. Get configuration
Command:
```bash
aws lambda get-function-configuration --function-name my-function
```

### 2. Update configuration
Command:
```bash
aws lambda update-function-configuration --function-name my-function --runtime runtime
```
Example:
```bash
aws lambda update-function-configuration --function-name my-function --runtime python3.9
```

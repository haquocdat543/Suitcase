# AWS Lambda

## 1. Configuration
### 1. Get configuration
Command:
```
aws lambda get-function-configuration --function-name my-function
```

### 2. Update configuration
Command:
```
aws lambda update-function-configuration --function-name my-function --runtime runtime
```
Example:
```
aws lambda update-function-configuration --function-name my-function --runtime python3.9
```


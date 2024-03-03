# Azure

## AD ( Azure Entra ID )
#### 1. Custom roles
Eg: Vm operator
```
Microsoft.Compute/virtualMachines/read
Microsoft.Compute/virtualMachines/start/action
Microsoft.Compute/virtualMachines/stop/action
Microsoft.Compute/virtualMachines/restart/action
Microsoft.Compute/virtualMachines/delete
```

Eg: Network contributor
```
Microsoft.Network/virtualNetworks/write
Microsoft.Network/subnets/write
Microsoft.Network/networkSecurityGroups/write
```

Eg: Storage reader
```
Microsoft.OperationalInsights/workspaces/read
Microsoft.OperationalInsights/workspaces/query/action
```

Eg: Log Analytics reader
```
Microsoft.OperationalInsights/workspaces/read
Microsoft.OperationalInsights/workspaces/query/action
```

Eg: Cost viewer
```
Microsoft.CostManagement/billingAccounts/read
Microsoft.CostManagement/billingPeriods/read
```


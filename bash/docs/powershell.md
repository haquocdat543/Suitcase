# POWERSHELL

## Downdload file
### Downdload file
```powershell
Invoke-WebRequest Invoke-WebRequest ${FILE_URL}
```

### Extract file
```
Expand-Archive -Path ~\${FILE_NAME}
```

### Write output
```
$name = "myname"
Write-Output "Your name is $name."
```

### Start, stop, restart service
Start:
```
$serviceName = "wuauserv"  # Windows Update service
Start-Service -Name $serviceName
```

Stop:
```
$serviceName = "wuauserv"  # Windows Update service
Stop-Service -Name $serviceName
```

Restart:
```
$serviceName = "wuauserv"  # Windows Update service
Restart-Service -Name $serviceName
```

### Set execution policy
```
Get-ExecutionPolicy -List
```

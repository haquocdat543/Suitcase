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

### Start service
```
$serviceName = "wuauserv"  # Windows Update service
Start-Service -Name $serviceName
```

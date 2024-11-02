# POWERSHELL

## Command
### List directory items [ ls ]
```
Get-ChildItem
```

with path:
```
$directoryPath = "C:\Path\To\Directory"
Get-ChildItem -Path $directoryPath
```

### Set location [ cd ]
```
Set-Location
```

### Copy item [ cp ]
```
Copy-Item
```

### Move item [ mv ]
```
Move-Item
```

### Remove item [ rm ]
```
Remove-Item
```

### New item [ touch ]
```
New-Item
```

### Downdload file [ wget ]
```powershell
Invoke-WebRequest Invoke-WebRequest ${FILE_URL}
```

### Extract file [ unzip ]
```
Expand-Archive -Path ~\${FILE_NAME}
```

### Write output [ echo ]
```
$name = "myname"
Write-Output "Your name is $name."
```

### Start, stop, restart service [ systemctl ]
Get:
```
Get-Service
```

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

### Set execution policy [ chmod ]
```
Get-ExecutionPolicy -List
```

### Get process [ ps ]
```
Get-Process
```

### Start process
```
Start-Process
```

### Stop process
```
Stop-Process
```


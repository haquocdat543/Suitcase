# POWERSHELL

## Command
## File Operations
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

## Service operations
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

## Process management
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

## System information
### Get command
```
Get-Command
```

### Get help
```
Get-Help
```

### Get event log
```
Get-EventLog
```

## Network operations
### Test connection [ ping ] 
```
Test-Connection
```

### Get network ip addresses 
```
Get-NetIPAddress
```

### Get network adapter
```
Get-NetAdapter
```

## User and group management
### Get list of local users [ cat /etc/passwd ]
```
Get-LocalUser
```

### Create new local user [ useradd ]
```
New-LocalUser
```

### Remove user
```
Remove-LocalUser
```

### Get list of local groups
```
Get-LocalGroup
```


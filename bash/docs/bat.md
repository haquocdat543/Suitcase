# BAT in Windows

## 1. Loop
```
@echo off
setlocal enabledelayedexpansion

for /L %%i in (1,1,10) do (
    echo Iteration %%i
    rem Add your commands here
)
```

@echo off
echo Batch Script to take input.
set /p key= Type your key name: 
set /p ip= Type your server IP: 
ssh -i ~/Downloads/%key%.pem ec2-user@%ip%
pause

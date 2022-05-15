
@echo off
Echo Installing Azurite Power Plan
echo.
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/901916555925930016/975512977866366996/Azurite.pow' -OutFile C:\Windows\Azurite.pow
powercfg -import "C:\Windows\Azurite.pow" 33333333-3333-3333-3333-333333333333
del /f "C:\Windows\Azurite.pow"
powercfg -SETACTIVE "33333333-3333-3333-3333-333333333333"
exit

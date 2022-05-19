for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /s /f "Scaling"^| findstr "HKEY"') do reg add "%%i" /v "Scaling" /t REG_DWORD /d "1" /f 
pause
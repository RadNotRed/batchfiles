@echo off
color F0

if not exist "C:\Svchost\AvenSvchost.log" (
mkdir "C:\Svchost"
echo This is your First Time Running the "Tweak Svchost.bat" >> C:\Svchost\AvenSvchost.log
) >nul 2>&1 && goto StartTheTweak

if exist "C:\Svchost\AvenSvchost.log" (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "380000" /f
) >nul 2>&1 && goto DefaultFinished

:StartTheTweak
cls

for /f "tokens=2 delims==" %%i in ('wmic os get TotalVisibleMemorySize /format:value') do set MEM=%%i
set /a RAM=%MEM% + 1024000
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%RAM%" /f
cls

echo Script Finished!
timeout 2 > nul
cls

echo Press any key to exit [...]
pause > nul
exit

:DefaultFinished
cls
echo Default Value for Split Threshold (Svchost.exe) Applied!
del /s /f /q "C:\Svchost\AvenSvchost.log" >nul 2>&1
timeout 3 > nul
cls

echo Press any key to exit [...]
pause > nul
exit
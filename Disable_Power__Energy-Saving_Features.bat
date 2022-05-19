@echo off
color F0

echo Disabling Energy Saving Features [...] 
timeout 2 > nul
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >nul 2>&1
cls

echo Disabling Power-Saving Features [...] 

if exist "C:\Users\%USERNAME%\Downloads\SetACL.exe" goto powersaving
if not exist "C:\Users\%USERNAME%\Downloads\SetACL.exe" (
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/825401948349792277/936738908920754206/SetACL.exe" -OutFile "C:\Users\%USERNAME%\Downloads\SetACL.exe"
)

:powersaving
for /f %%s in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr /l "USB\VID_"') do (
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn setowner -ownr "n:Administrators" >nul 2>&1
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full" >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v SelectiveSuspendOn /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v SelectiveSuspendEnabled /t REG_BINARY /d 00 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v EnhancedPowerManagementEnabled /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" /v AllowIdleIrpInD3 /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f %%s in ('wmic PATH Win32_USBHub GET DeviceID ^| findstr /l "USB\ROOT_HUB"') do (
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters\WDF" -ot reg -actn setowner -ownr "n:Administrators" >nul 2>&1
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters" -ot reg -actn ace -ace "n:Administrators;p:full" >nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%s\Device Parameters\WDF" /v IdleInWorkingState /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f "tokens=*" %%s in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /S /F "StorPort" ^| findstr /e "StorPort"') do reg.exe add "%%s" /v "EnableIdlePowerManagement" /t REG_DWORD /d 00000000 /f >nul 2>&1
for /f "eol=E" %%s in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "IoLatencyCap" ^| findstr /v "IoLatencyCap"') do reg.exe add "%%s" /v "IoLatencyCap" /t REG_DWORD /d 00000000 /f >nul 2>&1
for /f "eol=E" %%s in ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services" /S /F "EnableHIPM" ^| findstr /v "EnableHIPM"') do (
reg.exe add "%%s" /v "EnableHIPM" /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "%%s" /v "EnableDIPM" /t REG_DWORD /d 00000000 /f >nul 2>&1
reg.exe add "%%s" /v "EnableHDDParking" /t REG_DWORD /d 00000000 /f >nul 2>&1
)
for /f "tokens=*" %%s in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /S /F "PNPCapabilities" ^| findstr /v "PNPCapabilities" ^| findstr /v "REG_DWORD" ^| findstr /v "End of search"') do (
reg.exe add "%%s" /v "PNPCapabilities" /t REG_DWORD /d 00000280 /f >nul 2>&1
)
del /s /f /q "C:\Users\%USERNAME%\Downloads\SetACL.exe" > nul
cls

echo Script Finished!
timeout 2 > nul
cls
echo Press any key to exit [...]
pause > nul
exit
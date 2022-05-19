@echo off
@title Optimizing Disk script 
Echo What is ur disk?
Echo Press "1" for HDD
Echo Press "2" for SSD
SET /P choice= I chose: 
IF /I "%choice%"=="1" GOTO HDD
IF /I "%choice%"=="2" GOTO SSD
cls

:HDD
Echo Applying HDD Tweaks
timeout /t 3
fsutil behavior set disabledeletenotify 0
cls
Echo HDD Tweaked
timeout /t 3
cls
GOTO :Disk Tweaks

:SSD
cls
Echo Applying SSD Tweaks
timeout /t 3
fsutil behavior set disabledeletenotify 0
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d "0" /f
cls
Echo SSD Tweaked
timeout /t 3
cls
GOTO :Disk Tweaks

:Disk Tweaks
Echo Applying Additional Disk Tweaks
timeout /t 3
fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
fsutil behavior set disablecompression 1
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "0" /f
cls
Echo Additional Disk Tweaks Applied
timeout /t 3
cls

set /p choice="How much RAM do you have?: 
if defined choice (
set /a svc_split_threshold=%choice% * 1024 * 1024
)
cls
Echo Applying SvcHostSplitThreshold
timeout /t 3
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "%svc_split_threshold%" /f
cls
Echo SvcHostSplitThreshold Applied!
timeout /t 3
cls

Echo Applying Memory tweaks
timeout /t 3
fsutil behavior set memoryusage 1
fsutil behavior set mftzone 2
cls
Echo Memory Tweaks Applied!
timeout /t 3
cls

Echo Your disk was successfully tweaked, restart your PC to make the changes work! ;)
timeout /t 3
exit
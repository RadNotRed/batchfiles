@echo off
title NVTelemetry Removed / By jori
color F0
mode 120,50

:NVTelemetryRemoved
cls
echo.
echo. 
echo                      Do you want to delete NVTelemetry? 
echo.     (If you delete this file you will not be able to use geforce experience) 
echo.
echo.             [1] Removed NVTelemetry         [2] No, leave
echo.
echo.
echo.                                                                          
echo.      

set /p Menu=: 

if "%Menu%"=="1" goto 1
if "%Menu%"=="2" goto 2

SET msgboxTitle=NVTelemetry Removed / By @jori
SET msgboxBody=Please type 1 or 2, the command you have entered is not in the options jori 
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"

goto NVTelemetryRemoved


:1
cd /d "%PROGRAMFILES%\NVIDIA Corporation\"
dir NvTelemetry64.dll /a /b /s
del NvTelemetry64.dll /a /s

cd /d "SYSTEM32\DriverStore\FileRepository\"
dir NvTelemetry64.dll /a /b /s
del NvTelemetry64.dll /a /s

SET msgboxTitle=NVTelemetry Removed / By Jori
SET msgboxBody=NVTelemetry.dll has been successfully removed jori
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"

exit

:2
exit
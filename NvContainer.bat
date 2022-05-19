@echo off
title NVidiaContainer Disable-Enabled / By Jori
color F0
mode 120,50

:NvidiaContainerMenu
cls
echo.
echo. 
echo               What do you want to do with the Nvidia Container
echo.    (having this service disabled will cause a break in the Nvidia Control Panel) 
echo.
echo.        [1] Disable Nvidia Container          [2] Enable Nvidia Container
echo.
echo.
echo.                                                                                  Jori
echo.                                                                                 

set /p Menu=: 

if "%Menu%"=="1" goto OFF
if "%Menu%"=="2" goto ON

SET msgboxTitle=NVidiaContainer Disable-Enabled / By jori 
SET msgboxBody=Please type 1 or 2, the command you have entered is not in the options jori
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"
goto NvidiaContainerMenu


:ON
sc config NVDisplay.ContainerLocalSystem start= demand
net start NVDisplay.ContainerLocalSystem

SET msgboxTitle=NVidiaContainer Disable-Enabled / By jori
SET msgboxBody=The changes have been made, Nvidia Container Successfully disabled jori
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"

exit


:OFF
sc config NVDisplay.ContainerLocalSystem start= disabled
net stop NVDisplay.ContainerLocalSystem 

SET msgboxTitle=NVidiaContainer Disable-Enabled by jori
SET msgboxBody=The changes have been made, Nvidia Container Successfully activated jori 
SET tmpmsgbox=%temp%\~tmpmsgbox.vbs
IF EXIST "%tmpmsgbox%" DEL /F /Q "%tmpmsgbox%"
ECHO msgbox "%msgboxBody%",0,"%msgboxTitle%">"%tmpmsgbox%"
WSCRIPT "%tmpmsgbox%"

exit
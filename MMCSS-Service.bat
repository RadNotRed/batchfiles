@echo off

echo Type "on" to enable or "off" to disable MMCSS Service
set /p con=
if /i "%con%" == "off" goto :disable
if /i "%con%" == "on" goto :enable

:enable 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\MMCSS" /v "Start" /t REG_DWORD /d "2" /f
timeout /t -1
cls

:disable
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\MMCSS" /v "Start" /t REG_DWORD /d "4" /f
timeout /t -1
cls


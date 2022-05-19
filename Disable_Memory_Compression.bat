@echo off
echo Disabling Memory Compression !
timeout /T 3 /NOBREAK > nul
PowerShell "Disable-MMAgent -MemoryCompression"
pause
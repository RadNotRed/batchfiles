for %%a in (csrss) do (
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe" /v MitigationAuditOptions /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe" /v MitigationOptions /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%a.exe\PerfOptions" /v IoPriority /t REG_DWORD /d "3" /f
)
pause
::—————————————————————————————————————————————————————————————————————————————————
@Echo off 
(Fsutil Dirty Query %SystemDrive%>Nul)&&(cd /d "%~dp0")||(PowerShell start """%~f0""" -verb RunAs & Exit /B)
Title Add or remove the context menu item "Display settings".& mode con cols=74 lines=6 & color 17 & echo.
echo    Press (A) to add "Display settings" onto the desktop context menu.
echo    Press (R) to remove "Display settings" from the desktop context menu.&Echo.
wmic cpu get AddressWidth /value|find "32">nul&&set [N]=NSudo\NSudoC_Win32.exe||set [N]=NSudo\NSudoC_x64.exe
Set "[P]=HKCR\DesktopBackground\Shell\Display"&Set "[R]=[reflection.assembly]::loadwithpartialname^('System."
Set "[S]=icon = [System.Drawing.SystemIcons]::Information;$X.visible = $true"
Set "[Y]=$X = new-object system.windows.forms.notifyicon;$X.%[S]%;$X.showballoontip^(10,'',"
Set "[O]=-ShowWindowMode:Hide -U:T REG" & CHOICE /C "AR" /M "Your choice?:" >nul 2>&1
if not %errorlevel%==1 (goto Remove_Display_settings_from_the_desktop_context_menu)
Echo    Please wait for a second or two.& Set "[Z]=[system.windows.forms.tooltipicon]::None"
%[N]% %[O]% ADD "%[P]%\command" /V "DelegateExecute" /T REG_SZ /D "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /F 
%[N]% %[O]% ADD "%[P]%" /T REG_EXPAND_SZ /D "@%SystemRoot%\System32\display.dll,-4" /F
%[N]% %[O]% ADD "%[P]%" /V "Icon" /T REG_EXPAND_SZ /D "%SystemRoot%\System32\display.dll,-1" /F
%[N]% %[O]% ADD "%[P]%" /V "Position" /T REG_SZ /D "Bottom" /F
%[N]% %[O]% ADD "%[P]%" /V "SettingsUri" /T REG_SZ /D "ms-settings:display" /F 
REG query "%[P]%" >nul 2>&1
If %errorlevel%==0 ((PowerShell.exe %[R]%Windows.Forms'^); %[R]%Drawing'^); ^
%[Y]%'[Display settings] has been added onto the desktop context menu.',%[Z]%^);$X.dispose^(^))>Nul)&Exit
:Remove_Display_settings_from_the_desktop_context_menu
%[N]% %[O]% Delete "%[P]%" /F &Echo    Please wait for a second or two.
PING -n 2 LOCALHOST>nul & Set "[Z]=[system.windows.forms.tooltipicon]::None" & REG query "%[P]%" >nul 2>&1
If not %errorlevel%==0 ((PowerShell.exe %[R]%Windows.Forms'^); %[R]%Drawing'^); ^
%[Y]%'[Display settings] has been removed from the desktop context menu.',%[Z]%^);$X.dispose^(^))>Nul)&Exit
::—————————————————————————————————————————————————————————————————————————————————
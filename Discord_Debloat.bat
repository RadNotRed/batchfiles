@echo off
TITLE discord debloat.
@echo Closing discord!
TASKKILL /T /F /IM  discord.exe
CLS
CHOICE /C YN /M "Would you like to disable updates completely?"
IF %ERRORLEVEL% EQU 1 (
@echo Deleting updates!
DEL "%HOMEPATH%\Desktop\Discord.ink" /F /Q
DEL "%HOMEPATH%\Desktop\Discord.ink - Shortcut" /F /Q
DEL "%HOMEPATH%\Desktop\Update.exe" /F /Q
DEL "%HOMEPATH%\Desktop\Update.exe - Shortcut" /F /Q
DEL "%HOMEPATH%\Desktop\Discord.exe" /F /Q
DEL "%HOMEPATH%\Desktop\Discord.exe - Shortcut" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\Update.exe" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.309\Squirrel.exe" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.308\Squirrel.exe" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.307\Squirrel.exe" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.306\Squirrel.exe" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\SquirrelSetup.log" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.309\SquirrelSetup.log" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.308\SquirrelSetup.log" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.307\SquirrelSetup.log" /F /Q
DEL "%HOMEPATH%\appdata\Local\discord\app-0.0.306\SquirrelSetup.log" /F /Q
rd /s /q "%HOMEPATH%\appdata\Local\discord\Packages"
CLS
@echo Done!)
CHOICE /C YN /M "Would you like to debloat your discord?"
IF %ERRORLEVEL% EQU 1 (
@echo Removing bloat!
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_modules\397863cd8f\2\discord_game_sdk_x64.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_modules\397863cd8f\2\discord_game_sdk_x64.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_modules\397863cd8f\2\discord_game_sdk_x64.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_modules\397863cd8f\2\discord_game_sdk_x64.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_modules\397863cd8f\2\discord_game_sdk_x86.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_modules\397863cd8f\2\discord_game_sdk_x86.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_modules\397863cd8f\2\discord_game_sdk_x86.dll" /F /Q
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_modules\397863cd8f\2\discord_game_sdk_x86.dll" /F /Q
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_cloudsync"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_cloudsync"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_cloudsync"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_cloudsync"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_dispatch"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_dispatch"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_dispatch"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_dispatch"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_erlpack"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_erlpack"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_erlpack"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_erlpack"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_game_utils"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_game_utils"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_game_utils"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_game_utils"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_media"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_media"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_media"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_media"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_spellcheck"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_spellcheck"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_spellcheck"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_spellcheck"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_krisp"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_krisp"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_krisp"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_krisp"
CLS
@echo Done!)
CHOICE /C YN /M "Would you like to remove overlay?"
IF %ERRORLEVEL% EQU 1 (
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_rpc"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_rpc"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_rpc"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_rpc"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.309\modules\discord_overlay2"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_overlay2"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.307\modules\discord_overlay2"
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.306\modules\discord_overlay2"
CLS
@echo Done!)
@echo Everything done!
@echo WARNING!
@echo AFTER RUNNING THE BATCH FILE YOU HAVE TO CREATE A DISCORD SHORTCUT
@echo FROM %HOMEPATH%\appdata\Local\discord\app-0.0.(your version)!
CLS
Pause
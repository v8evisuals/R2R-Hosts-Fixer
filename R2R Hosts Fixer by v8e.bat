@echo off
chcp 65001
color 0f
title R2R Hosts Fixer by v8e
cls
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Please run this script as an administrator!
    pause
    exit /b
)

set lines=127.0.0.1 www.r2rdownload.com^&echo.127.0.0.1 www.elephantafiles.com^&echo.127.0.0.1 www.r2rdownload.net

findstr /c:"127.0.0.1 www.r2rdownload.com" "%SystemRoot%\System32\drivers\etc\hosts" >nul
if '%errorlevel%'=='0' (
    echo The lines already exist in the hosts file.
    pause
    exit /b
)

echo Adding lines to the hosts file...
(echo.%lines%)>>"%SystemRoot%\System32\drivers\etc\hosts"
echo Lines added successfully.
pause
 
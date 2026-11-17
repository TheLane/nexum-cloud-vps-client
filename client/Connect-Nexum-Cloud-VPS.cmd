@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"
if errorlevel 1 (
 echo Cannot access the Nexum Cloud VPS Client directory.
 pause
 exit /b 1
)
if not exist "%~dp0nexum-cloud-client.exe" (
 echo Missing nexum-cloud-client.exe. Extract the entire release ZIP.
 pause
 exit /b 2
)
echo Nexum Cloud VPS / stage.nexum-mcp.ru
echo Browser authorization will open if needed.
echo Do not close this window while the client is connected.
"%~dp0nexum-cloud-client.exe" --server "https://stage.nexum-mcp.ru" connect
set "RESULT=%ERRORLEVEL%"
echo.
echo Nexum Cloud VPS Client exited with code %RESULT%.
if not "%RESULT%"=="0" pause
exit /b %RESULT%

@echo off
echo Starting PLAYERUNKNOWN'S BATTLEGROUNDS
rem ## start pubg ##
start steam://rungameid/622590
rem ## wait for process ##
:loop
timeout /T 2 /NOBREAK > nul
for /F %%a in ('tasklist /FI "IMAGENAME eq TslGame.exe" ^| find /C "TslGame.exe"') do set var=%%a
if "%var%"=="0" goto loop
rem ## set priority high ##
C:\Windows\System32\wbem\WMIC.exe process where name="TslGame.exe" CALL setpriority 128 > nul
exit
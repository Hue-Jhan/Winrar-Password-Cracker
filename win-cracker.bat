@echo off
title Win-Cracker
color 3
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip not installed.
	pause
	exit
)

echo.
set /p archive="Enter Archive path: "
if not exist "%archive%" (
	echo Archive not found.
	pause
	exit
)

set /p wordlist="Enter Wordlist path: "
if not exist "%wordlist%" (
	echo Wordlist not found.
	pause
	exit
)
echo Cracking the archive...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo epic fail
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
	echo Password Found: %pass%
	pause
	exit
)

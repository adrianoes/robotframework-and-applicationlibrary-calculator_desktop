@echo off
REM Start WinAppDriver in the background
start "" "C:\Program Files\Windows Application Driver\WinAppDriver.exe"

REM Wait 5 seconds to ensure WinAppDriver is ready
timeout /t 5 /nobreak >nul

REM Create the results folder if it does not exist, or clean it if it does
if not exist results (
    mkdir results
) else (
    echo Cleaning the results folder...
    rmdir /s /q results
    mkdir results
)

REM Run Robot Framework tests and save reports in the results folder
robot -d ./results tests

REM Wait 3 seconds and automatically close WinAppDriver
timeout /t 3 /nobreak >nul
taskkill /IM WinAppDriver.exe /F

exit

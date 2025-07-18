@echo off
REM Absolute path to WinAppDriver.exe
set WINAPPDRIVER_PATH="C:\Program Files\Windows Application Driver\WinAppDriver.exe"

REM Absolute path to the Robot Framework project folder (where the 'tests' folder is located)
set ROBOT_PROJECT_PATH="C:\robotframework-and-applicationlibrary-calculator_desktop"

REM Absolute path to the results folder
set RESULTS_PATH=%ROBOT_PROJECT_PATH%\results

REM Start WinAppDriver in the background
start "" %WINAPPDRIVER_PATH%

REM Wait 5 seconds to ensure WinAppDriver is ready
timeout /t 5 /nobreak >nul

REM Create the results folder if it does not exist, or clean it if it does
if not exist %RESULTS_PATH% (
    mkdir %RESULTS_PATH%
) else (
    echo Cleaning the results folder...
    rmdir /s /q %RESULTS_PATH%
    mkdir %RESULTS_PATH%
)

REM Run Robot Framework tests and save reports in the results folder
robot -d %RESULTS_PATH% tests

REM Wait 3 seconds and automatically close WinAppDriver
timeout /t 3 /nobreak >nul
taskkill /IM WinAppDriver.exe /F

exit

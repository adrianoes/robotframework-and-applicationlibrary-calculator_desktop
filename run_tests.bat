@echo off
REM Caminho absoluto para o WinAppDriver.exe
set WINAPPDRIVER_PATH="C:\Program Files\Windows Application Driver\WinAppDriver.exe"

REM Caminho absoluto para a pasta do seu projeto Robot Framework (onde está a pasta 'tests')
set ROBOT_PROJECT_PATH="C:\robotframework-and-applicationlibrary-calculator_desktop"

REM Caminho absoluto para a pasta reports
set REPORTS_PATH=%ROBOT_PROJECT_PATH%\reports

REM Inicia o WinAppDriver em segundo plano
start "" %WINAPPDRIVER_PATH%

REM Aguarda 5 segundos para garantir que o WinAppDriver esteja pronto
timeout /t 5 /nobreak >nul

REM Cria a pasta reports se não existir
if not exist %REPORTS_PATH% (
    mkdir %REPORTS_PATH%
) else (
    REM Limpa o conteúdo da pasta reports
    echo Limpando a pasta reports...
    rmdir /s /q %REPORTS_PATH%
    mkdir %REPORTS_PATH%
)

REM Executa os testes Robot Framework com caminho absoluto e salva os reports na pasta reports
robot -d ./results tests

REM Aguarda 3 segundos e fecha automaticamente o WinAppDriver
timeout /t 3 /nobreak >nul
taskkill /IM WinAppDriver.exe /F

exit

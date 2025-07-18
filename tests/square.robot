*** Settings ***
Resource          ../resources/base.robot
Library           ApplicationLibrary.DesktopLibrary.DesktopLibrary

Suite Setup       Start WinAppDriver
Suite Teardown    Stop WinAppDriver
Test Setup        Start App
Test Teardown     Quit Calculator Application

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Windows
${DEVICE_NAME}          Windows
${APP_ID}               Microsoft.WindowsCalculator_8wekyb3d8bbwe!App

*** Keywords ***
Start App
    Driver Setup
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_ID}

Quit Calculator Application
    Quit Application

*** Test Cases ***
Square Random Number
    [Documentation]    Squares a random number between 0 and 9 using the calculator and validates the result.
    Square Number

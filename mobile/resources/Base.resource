*** Settings ***
Documentation    Main file of mobile test automation project

Library    AppiumLibrary

Resource    ./actions/account.resource
Resource    ./actions/login.resource
Resource    ./actions/menu.resource
Resource    ./actions/mybody.resource
Resource    ./actions/popup.resource

*** Keywords ***
Start session
    
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    autoGrantPermissions=true

    Wait Until Page Contains    IP da API    30

Finish session

    Capture Page Screenshot
    Close Application
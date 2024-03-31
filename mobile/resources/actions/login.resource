*** Settings ***
Documentation    Login screen actions

Library    AppiumLibrary

*** Keywords ***
Sign in with cpf
    [Arguments]    ${cpf}

    ${ip}=     Get Ip

    Input Text       //android.widget.EditText[@resource-id="ipAddress"]    
    ...    ${ip}

    Input Text       //android.widget.EditText[@resource-id="cpf"]          
    ...    ${cpf}
    
    Click Element    //android.view.ViewGroup[@resource-id="btnLogin"]
*** Settings ***
Documentation    My body screen actions

Library    AppiumLibrary

*** Keywords ***
Send weight and height
    [Arguments]    ${weight}    ${height}

    Input Text    //android.widget.EditText[@resource-id="weight"]    ${weight}
    Input Text    //android.widget.EditText[@resource-id="height"]    ${height}
    
    Click Element    //android.widget.TextView[@text="Enviar minhas medidas"]
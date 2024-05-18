*** Settings ***
Documentation    Menu component actions

Library    AppiumLibrary

*** Keywords ***
Go to My body
    Click Element    xpath=//android.widget.TextView[@text="Meu corpo"]
    Wait Until Page Contains    Registre ou atualize suas medidas    10

Go to My account
    Click Element    xpath=//android.widget.TextView[@text="Minha conta"]
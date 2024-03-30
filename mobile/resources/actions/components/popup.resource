*** Settings ***
Documentation    Alert component actions

Library    Browser
Library    AppiumLibrary

*** Keywords ***
Popup should have text
    [Arguments]    ${text}

    ${element}    Set Variable    xpath=//android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible    ${element}    10
    Element Text Should Be           ${element}    ${text}

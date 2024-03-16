*** Settings ***
Documentation    Accounts page elements and actions

Library    Browser

*** Keywords ***
User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    visible    5  
    Get text                   ${element}    equal      ${email}
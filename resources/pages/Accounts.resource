*** Settings ***
Documentation    Accounts page elements and actions

Library    Browser

*** Keywords ***
User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    visible    5  
    Get text                   ${element}    equal      ${email}

Go to memberships page
    Click    a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas    visible    5  
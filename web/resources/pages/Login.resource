*** Settings ***
Documentation    Login page elements and actions

Library    Browser

*** Keywords ***
Go to login page
    Go To    http://localhost:3000/login

Sumbit login form
    [Arguments]    ${email}    ${password}
    Fill Text      css=#email         ${email}
    Fill Text      css=#password      ${password}
    
    Click          css=button >> text=Entrar
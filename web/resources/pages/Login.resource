*** Settings ***
Documentation    Login page elements and actions

Variables  ../Env.py

Library    Browser

*** Keywords ***
Go to login page
    Go To    ${BASE_URL}/login

Sumbit login form
    [Arguments]    ${email}    ${password}
    Fill Text      css=#email         ${email}
    Fill Text      css=#password      ${password}
    
    Click          css=button >> text=Entrar
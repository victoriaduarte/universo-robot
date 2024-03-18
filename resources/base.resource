*** Settings ***
Documentation    Main file of the project

Library    Browser
Library    DatabaseLibrary
Library    JSONLibrary

Library    libs/Account.py
Library    libs/Database.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource
Resource    pages/Memberships.resource

Resource    pages/components/Toast.resource
Resource    pages/components/BoxNotice.resource

*** Keywords ***
Start session
    New Browser    browser=chromium
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
 
Get JSON fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8

    RETURN    ${data}[${scenario}]
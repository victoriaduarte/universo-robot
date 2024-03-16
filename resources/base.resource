*** Settings ***
Documentation    Main file of the project

Library    Browser
Library    DatabaseLibrary

Library    libs/Account.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource

*** Keywords ***
Start session
    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
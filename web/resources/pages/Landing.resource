*** Settings ***
Documentation    Landing page elements and actions

Library    Browser

*** Keywords ***
Sumbit signup form
    [Arguments]    ${account}
    
    Fill Text      css=#name         ${account}[name]
    Fill Text      css=#email        ${account}[email]
    Fill Text      css=#cpf          ${account}[cpf]
    
    Click          css=button >> text=Cadastrar    
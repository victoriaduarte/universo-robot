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

Notice should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=#signup .notice

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  
 
    Get Text       
    ...    ${element}  
    ...    equal    
    ...    ${expected_text}
*** Settings ***
Documentation    Test cases for User Login

Library    Browser

Resource    ../resources/base.resource

*** Test Cases ***
Start the user registration

    ${account}     Get Fake Account

    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=.headline h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text      css=#name         ${account}[name]
    Fill Text      css=#email        ${account}[email]
    Fill Text      css=#documento    ${account}[document]
    
    Click          css=button >> text=Cadastrar    

    # Assertion
    Get Url    equal     http://localhost:3000/welcome

    ${element}    Set Variable    css=h2 >> text="Falta pouco para fazer parte da família Smartbit!"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text                   
    ...    ${element}    
    ...    equal      
    ...    Falta pouco para fazer parte da família Smartbit!
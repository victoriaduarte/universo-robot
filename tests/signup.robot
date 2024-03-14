*** Settings ***
Documentation    Test cases for User Login

Library    Browser

Resource    ../resources/base.resource

Test Teardown    Take Screenshot

*** Test Cases ***
Start the user registration

    ${account}     Get Fake Account

    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text      css=#name         ${account}[name]
    Fill Text      css=#email        ${account}[email]
    Fill Text      css=#document    ${account}[document]
    
    Click          css=button >> text=Cadastrar    

    # Assertion
    ${element}    Set Variable    css=h2 >> text="Falta pouco para fazer parte da família Smartbit!"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text                   
    ...    ${element}    
    ...    equal      
    ...    Falta pouco para fazer parte da família Smartbit!

    Get Url    equal     http://localhost:3000/welcome

Name field should be required
    [Tags]    required
    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text      css=#email       victoria@email.com
    Fill Text      css=#document    39831866029
    
    Click          css=button >> text=Cadastrar    

    # Assertion
    ${element}    Set Variable    css=#signup .notice >> text="Por favor informe o seu nome completo"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text       
    ...    css=#signup .notice    
    ...    equal    
    ...    Por favor informe o seu nome completo

Email field should be required
    [Tags]    required
    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text      css=#name        Victória Duarte
    Fill Text      css=#document    39831866029
    
    Click          css=button >> text=Cadastrar    

    # Assertion
    ${element}    Set Variable    css=#signup .notice >> text="Por favor, informe o seu melhor e-mail"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text       
    ...    css=#signup .notice    
    ...    equal    
    ...    Por favor, informe o seu melhor e-mail
    
Document field should be required
    [Tags]    required
    New Browser    browser=chromium
    New Page       http://localhost:3000/

    Get Text       
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text      css=#name        Victória Duarte
    Fill Text      css=#email       victoria@email.com
    
    Click          css=button >> text=Cadastrar    

    # Assertion
    ${element}    Set Variable    css=#signup .notice >> text="Por favor, informe o seu CPF"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text       
    ...    css=#signup .notice    
    ...    equal    
    ...    Por favor, informe o seu CPF

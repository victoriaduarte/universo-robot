*** Settings ***
Documentation    Test cases for weight and height measures registration feature

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Register my measures
    ${data}     Get JSON fixture    update
    Insert membership    ${data}  

    Sign in with cpf     ${data}[account][cpf]
    User is logged in

    Go to My body
    Send weight and height    ${data}[account][weight]    ${data}[account][height]

    Popup should have text    Seu cadastro foi atualizado com sucesso
    
    Set user token
    ${account}    Get account by name    ${data}[account][name]
    
    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]

Should not register empty measures
    ${data}     Get JSON fixture    empty
    Insert membership    ${data}  

    Sign in with cpf     ${data}[account][cpf]
    User is logged in

    Go to My body
    Send weight and height    ${data}[account][weight]    ${data}[account][height]

    Popup should have text    Informe seu peso (kg)

Should not register invalid measures
    ${data}     Get JSON fixture    invalid
    Insert membership    ${data}  

    Sign in with cpf     ${data}[account][cpf]
    User is logged in

    Go to My body
    Send weight and height    ${data}[account][weight]    ${data}[account][height]

    Popup should have text    Não foi possível enviar suas informações
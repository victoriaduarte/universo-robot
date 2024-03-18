*** Settings ***
Documentation    Test cases for memberships

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Enroll an user

    ${account}    Create Dictionary
    ...    name=Uchiha Itachi
    ...    email=uchiha@itachi.com
    ...    cpf=23573428037

    ${plan}    Set Variable    Plano Black
    
    ${credit_card}    Create Dictionary
    ...    number=4242424242424242
    ...    holder=${account}[name]
    ...    month=12
    ...    year=2030
    ...    cvv=123

    Delete Account By Email    ${account}[email]
    Insert Account             ${account} 

    Go to login page
    Sumbit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to memberships page
    Go to memberships form

    Select account    ${account}[name]    ${account}[cpf]
    Select plan       ${plan}
    Fill credit card information    ${credit_card}     

    Click    button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.

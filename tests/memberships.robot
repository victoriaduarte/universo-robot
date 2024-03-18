*** Settings ***
Documentation    Test cases for memberships

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Enroll an user

    ${data}    Get JSON fixture    memberships    create

    Log    ${data}
    Log    ${data}[account]

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account] 

    Go to login page
    Sumbit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to memberships page
    Go to memberships form

    Select account    ${data}[account][name]    ${data}[account][cpf]
    Select plan       ${data}[plan]
    Fill credit card information    ${data}[credit_card]    

    Click    button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.
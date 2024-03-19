*** Settings ***
Documentation    Test cases for memberships

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Enroll an user

    ${data}    Get JSON fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account] 

    Sign in as admin
    Go to memberships page
    Create new membership    ${data}

    Toast should be    Matrícula cadastrada com sucesso.
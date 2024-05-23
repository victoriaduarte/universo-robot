*** Settings ***
Documentation    Test cases for memberships

Resource    ../resources/Base.resource

Library    String

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

Should not create duplicate membership
    [Tags]    dup
    ${data}    Get JSON fixture    memberships    duplicate

    Insert membership    ${data}  

    Sign in as admin
    Go to memberships page
    Create new membership    ${data}

    Toast should be    O usuário já possui matrícula.

Search membership by name
    [Tags]    search

    ${data}    Get JSON fixture    memberships    search

    Insert membership    ${data}  

    Sign in as admin
    Go to memberships page
    Search by name    ${data}[account][name]
    Filter by name    ${data}[account][name]

Search not found
    [Tags]    search

    ${String}    Generate Random String    length=10    chars=[LETTERS]

    Sign in as admin
    Go to memberships page
    Search by name    ${String}
    No records found

Delete membership by name
    [Tags]    delete

    ${data}    Get JSON fixture    memberships    delete

    Insert membership    ${data}  

    Sign in as admin
    Go to memberships page

    Delete by name    ${data}[account][name]
    Confirm delete
    
    Membership should not be visible    ${data}[account][name]
    Toast should be    Matrícula removida com sucesso.
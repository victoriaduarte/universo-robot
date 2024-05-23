*** Settings ***
Documentation    Test cases for clients

Resource    ../resources/Base.resource

Library    String

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Search client by name
    [Tags]    search

    ${data}    Get JSON fixture    clients    search

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    Sign in as admin

    Search client by name    ${data}[account][name]
    Filter client by name    ${data}[account][name]

Search not found
    [Tags]    search

    ${String}    Generate Random String    length=10    chars=[LETTERS]

    Sign in as admin

    Search client by name    ${String}
    No client records found

Delete client by name
    [Tags]    delete

    ${data}    Get JSON fixture    clients    delete

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    Sign in as admin

    Search client by name    ${data}[account][name]
    Delete client by name    ${data}[account][name]
    Confirm delete
    
    Client should not be visible    ${data}[account][name]
    Toast should be    Exclusão realizada com sucesso.

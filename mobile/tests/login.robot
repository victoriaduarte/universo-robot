*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Login with cpf and ip
    
    Sign in with cpf    00000014141
    User is logged in
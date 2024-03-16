*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource
Resource    ../resources/pages/components/Toast.resource

Test Setup       Start session
Test Teardown    Take Screenshot


*** Test Cases ***
Login as gym admin
    Go to login page
    Sumbit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Login as gym admin with invalid password
    [Tags]    invalid
    Go to login page
    Sumbit login form    sac@smartbit.com    pwd123a
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Login as gym admin with unregistered email
    [Tags]    invalid
    Go to login page
    Sumbit login form    404@smartbit.com    pwd123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

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

Login with invalid credentials
    [Tags]        invalid
    [Template]    Invalid login
    # email              password     output_message
    ${EMPTY}             ${EMPTY}     Os campos email e senha são obrigatórios.
    ${EMPTY}             pwd123       Os campos email e senha são obrigatórios.
    sac@smartbit.com     ${EMPTY}     Os campos email e senha são obrigatórios.
    test*gmail.com       pwd123       Oops! O email informado é inválido
    yahoo.com@&*         pwd123       Oops! O email informado é inválido
    www.test.com         pwd123       Oops! O email informado é inválido
    sac&gmail.com        pwd123       Oops! O email informado é inválido
    dsadasdsadaa         pwd123       Oops! O email informado é inválido
    LKJL8K4JLJL6         pwd123       Oops! O email informado é inválido
    $%&*$%&*$%&*         pwd123       Oops! O email informado é inválido

*** Keywords ***
Invalid login
    [Arguments]    ${email}    ${password}    ${output_message}
    
    Go to login page
    Sumbit login form    ${email}    ${password}
    Notice should be     ${output_message}
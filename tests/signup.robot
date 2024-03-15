*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Start the user registration

    ${account}     Get Fake Account

    Sumbit signup form    ${account}

    Verify welcome message    Falta pouco para fazer parte da família Smartbit!

    Get Url    equal     http://localhost:3000/welcome

Name field should be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=victoria@email.com
    ...    cpf=39831866029

    Sumbit signup form    ${account}

    Notice should be    Por favor informe o seu nome completo

Email field should be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=${EMPTY}
    ...    cpf=39831866029

    Sumbit signup form    ${account}

    Notice should be    Por favor, informe o seu melhor e-mail
    
Document field should be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=victoria@email.com
    ...    cpf=${EMPTY}

    Sumbit signup form    ${account}

    Notice should be    Por favor, informe o seu CPF

Invalid email
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=victoria*email.com
    ...    cpf=39831866029

    Sumbit signup form    ${account}

    Notice should be    Oops! O email informado é inválido
    
Invalid CPF
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=victoria@email.com
    ...    cpf=3983186602a

    Sumbit signup form    ${account}

    Notice should be    Oops! O CPF informado é inválido
*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

Test Setup    Run Keywords
...    Start session
...    AND    Connect To Database    psycopg2	oesjjtik	oesjjtik	y36aoG9PAdC7zngIzNCWtztI_o1iscI9	kesavan.db.elephantsql.com	5432	
Test Teardown    Run Keywords
...    Take Screenshot
...    Disconnect From All Databases

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

# Invalid email
#     [Tags]    invalid

#     ${account}    Create Dictionary
#     ...    name=Victória Duarte
#     ...    email=victoria*email.com
#     ...    cpf=39831866029

#     Sumbit signup form    ${account}

#     Notice should be    Oops! O email informado é inválido
    
# Invalid CPF
#     [Tags]    invalid

#     ${account}    Create Dictionary
#     ...    name=Victória Duarte
#     ...    email=victoria@email.com
#     ...    cpf=3983186602a

#     Sumbit signup form    ${account}

#     Notice should be    Oops! O CPF informado é inválido

Duplicate email
    [Tags]    duplicate

    ${duplicate_email}    Set Variable    duplicate@email.com

    Execute SQL String     DELETE FROM accounts WHERE email = '${duplicate_email}';

    Execute SQL String     INSERT INTO accounts (email, name, cpf) VALUES ('${duplicate_email}','Joao da Silva','45461090915');

    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=${duplicate_email}
    ...    cpf=39831866029
    
    Sumbit signup form    ${account}

    Alert should be    O e-mail fornecido já foi cadastrado!

Duplicate cpf
    [Tags]    duplicate

    ${duplicate_cpf}    Set Variable    45461090915

    Execute SQL String     DELETE FROM accounts WHERE cpf = '${duplicate_cpf}';

    Execute SQL String     INSERT INTO accounts (email, name, cpf) VALUES ('duplicate@cpf.com','Joao da Silva','${duplicate_cpf}');
    
    ${account}    Create Dictionary
    ...    name=Victória Duarte
    ...    email=victoria@email.com
    ...    cpf=${duplicate_cpf}
    
    Sumbit signup form    ${account}

    Alert should be    O CPF fornecido já foi cadastrado!

Signup attempt
    [Template]    Attempt signup
    # Empty
    ${EMPTY}           victoria@email.com    39831866029     Por favor informe o seu nome completo
    Victória Duarte    ${EMPTY}              39831866029     Por favor, informe o seu melhor e-mail
    Victória Duarte    victoria@email.com    ${EMPTY}        Por favor, informe o seu CPF
    # Invalid Email
    Victória Duarte    victoria*email.com    39831866029     Oops! O email informado é inválido
    Victória Duarte    victoria&email.com    39831866029     Oops! O email informado é inválido
    Victória Duarte    www.test.com          39831866029     Oops! O email informado é inválido
    Victória Duarte    ASDFGHJKL             39831866029     Oops! O email informado é inválido
    Victória Duarte    123456789             39831866029     Oops! O email informado é inválido
    Victória Duarte    %^&*                  39831866029     Oops! O email informado é inválido
    # Invalid CPF
    Victória Duarte    victoria@email.com    3983186602a     Oops! O CPF informado é inválido
    Victória Duarte    victoria@email.com    39831866111     Oops! O CPF informado é inválido
    Victória Duarte    victoria@email.com    3983186602      Oops! O CPF informado é inválido
    Victória Duarte    victoria@email.com    1               Oops! O CPF informado é inválido
    Victória Duarte    victoria@email.com    ASDFGHJKL       Oops! O CPF informado é inválido
    Victória Duarte    victoria@email.com    %^&*            Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    
    Sumbit signup form    ${account}
    Notice should be      ${output_message}
    Take Screenshot
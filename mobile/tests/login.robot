*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Login with cpf and ip
    
    Sign in with cpf    00000014141
    User is logged in

Login with unregistered cpf

    Sign in with cpf    48487877001
    Popup should have text     Acesso não autorizado! Entre em contato com a central de atendimento

Login with invalid cpf

    Sign in with cpf    00000014144
    Popup should have text     CPF inválido, tente novamente
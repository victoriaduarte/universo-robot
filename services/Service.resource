*** Settings ***
Documentation    todo

Library    RequestsLibrary

*** Keywords ***
Set user token
    ${payload}     Create Dictionary
    ...    email=sac@smartbit.com
    ...    password=pwd123

    ${response}    POST    
    ...    url=http://localhost:3333/sessions    
    ...    json=${payload}    
    ...    expected_status=200
    
    ${token}    Set Variable    Bearer ${response.json()}[token]
    
    Set Suite Variable    ${token}

Get account by name
    [Arguments]    ${name}

    ${headers}    Create Dictionary    
    ...    Authorization=${token}

    ${params}     Create Dictionary
    ...    name=${name}

    ${response}    GET    
    ...    url=http://localhost:3333/accounts    
    ...    headers=${headers}    
    ...    params=${params}    
    ...    expected_status=200    
    
    RETURN    ${response.json()}[data][0]
    
    
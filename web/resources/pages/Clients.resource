*** Settings ***
Documentation    Clients page elements and actions

Library    Browser

*** Keywords ***
Search client by name
    [Arguments]    ${name}
    Fill Text    css=input[placeholder="Buscar por nome"]    ${name}

    Wait For Elements State    css= strong >> text=Total: 1
    ...    visible    5   

Filter client by name
    [Arguments]    ${name}

    Wait For Elements State    css= table tbody tr >> text=${name}
    ...    visible    5   

Delete client by name
    [Arguments]    ${name}

    Click    xpath= //td[text()="${name}"]/..//button

Client should not be visible
    [Arguments]    ${name}

    Wait For Elements State    css= table tbody tr >> text=${name}
    ...    detached    5  

No client records found
    Wait For Elements State    css= div >> text="Nenhum registro encontrado."
    ...    visible    5   
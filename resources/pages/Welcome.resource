*** Settings ***
Documentation    Welcome page elements and actions

Library    Browser

*** Keywords ***
Verify welcome message
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=h2 >> text="${expected_text}"

    Wait For Elements State    
    ...    ${element}    
    ...    visible    5  

    Get Text                   
    ...    ${element}    
    ...    equal      
    ...    ${expected_text}
*** Settings ***
Documentation    Box Notice component elements and actions

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${expected_text}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State    ${element}    visible    5  
    Get Text                   ${element}    equal      ${expected_text}
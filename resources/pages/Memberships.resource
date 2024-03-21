*** Settings ***
Documentation    Memberships page elements and actions

Library    Browser

*** Keywords ***
Create new membership
    [Arguments]    ${data}

    Go to memberships form
    Select account                  ${data}[account][name]    ${data}[account][cpf]
    Select plan                     ${data}[plan][name]
    Fill credit card information    ${data}[credit_card]    

    Click    button[type=submit] >> text=Cadastrar

Go to memberships form
    Click    a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova matrícula    visible    5  

Select account
    [Arguments]    ${name}    ${cpf}    
    Fill Text     css=input[aria-label=select_account]    ${name}
    Click         css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}
    Fill Text     css=input[aria-label="select_plan"]    ${plan}
    Click         css=div[class$=option] >> text=${plan}

Fill credit card information
    [Arguments]    ${card}
    Fill Text     css=input[name=card_number]    ${card}[number]
    Fill Text     css=input[name=card_holder]    ${card}[holder]
    Fill Text     css=input[name=card_month]     ${card}[month] 
    Fill Text     css=input[name=card_year]      ${card}[year]  
    Fill Text     css=input[name=card_cvv]       ${card}[cvv]   

Search by name
    [Arguments]    ${name}
    Fill Text    css=input[placeholder="Busque por nome"]    ${name}

    Wait For Elements State    css= strong >> text=Total: 1
    ...    visible    5   

Filter by name
    [Arguments]    ${name}

    Wait For Elements State    css= table tbody tr >> text=${name}
    ...    visible    5   
*** Settings ***
Documentation    Test cases for User Login

Resource    ../resources/Base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Login with cpf and ip
    
    ${ip}=     Get Ip
    Input Text       //android.widget.EditText[@resource-id="ipAddress"]    ${ip}
    Input Text       //android.widget.EditText[@resource-id="cpf"]          00000014141
    
    Click Element    //android.view.ViewGroup[@resource-id="btnLogin"]
    
    Wait Until Element Is Visible    //android.widget.TextView[@resource-id="myAccountTitle"]    10
    Element Text Should Be           //android.widget.TextView[@resource-id="myAccountTitle"]    Sua transformação começa aqui!
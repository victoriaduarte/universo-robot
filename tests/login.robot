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

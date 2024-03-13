*** Settings ***
Documentation    Test to verify Smartbit's slogan

Library    Browser

*** Test Cases ***
Should display the slogan on the landing page
    New Browser    browser=chromium
    New Page       http://localhost:3000/
    Get Text       .headline h2    equal    Sua Jornada Fitness Começa aqui!
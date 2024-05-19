*** Settings ***
Documentation    Test to verify Smartbit's slogan

Variables  ../resources/Env.py

Library    Browser

*** Test Cases ***
Should display the slogan on the landing page
    New Browser    browser=chromium
    New Page       ${BASE_URL}
    Get Text       .headline h2    equal    Sua Jornada Fitness Começa aqui!
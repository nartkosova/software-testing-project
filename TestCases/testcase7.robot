*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_7 - Verify the product has a price
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
   
    Sleep    0.5s
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
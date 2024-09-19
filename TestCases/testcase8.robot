*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_1 - Verify all product categories have landing pages
    [Documentation]    This test verifies that each product category in the nav bar has a valid landing page.
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
   
    Sleep    0.5s
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
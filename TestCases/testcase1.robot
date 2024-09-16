*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_1 - Verify Tietokoneet has a landing page
    [Documentation]    This test verifies that each product category in the nav bar has a valid landing page.
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    0.5s

    Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a   
    Sleep    0.5s
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/div/ul/li[1]/a
    Page Should Contain    Tietokoneet
    Sleep    3s
    Capture Page Screenshot   

    Sleep    1s

    Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/a
    Sleep    0.5s
    Click Link    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/div/ul/li[1]/a  
    Page Should Contain    Komponentit
    Sleep    3s
    Capture Page Screenshot   

    Sleep    2s
    Close Browser

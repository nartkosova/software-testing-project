*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_3 - Find 'Lisää koriin' button
    [Documentation]    This test navigates to a product page and finds 'Lisää koriin' button.
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a 
    Sleep    0.5s
    Click Element     xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/div/ul/li[1]/a  

    Wait Until Page Contains Element    xpath=//addto-cart-wrapper//a    timeout=4s
    Scroll Element Into View    xpath=//addto-cart-wrapper//a 
    Element Should Be Visible    xpath=//addto-cart-wrapper//a

    Sleep    2s
    Capture Page Screenshot   


    Close Browser

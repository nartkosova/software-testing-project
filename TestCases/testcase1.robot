*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://jimms.fi
@{CATEGORIES}    Tietokoneet    Komponentit    Oheislaitteet    Pelaaminen    Sim Racing    Verkkotuotteet    Tarvikkeet    Erikoistuotteet    Ohjelmistot    Palvelut    Kampanjat
@{MAIN_XPATHS}    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[3]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[4]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[5]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[6]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[7]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[8]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[9]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[10]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[11]/a
@{SUB_XPATHS}    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[2]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[3]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[4]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[5]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[6]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[7]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[8]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[9]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[10]/div/ul/li[1]/a    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[11]/div/ul/li[1]/a

*** Test Cases ***
TC_UI_1 - Verify all product categories have landing pages
    [Documentation]    This test verifies that each product category in the nav bar has a valid landing page.
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
   
    Sleep    0.5s
    Maximize Browser Window
    Sleep    2s

    FOR    ${index}    IN RANGE    0    11
        ${main_xpath}    Set Variable    ${MAIN_XPATHS}[${index}]
        ${sub_xpath}    Set Variable    ${SUB_XPATHS}[${index}]
        ${name}    Set Variable    ${CATEGORIES}[${index}]
        
        Wait Until Element Is Visible    ${main_xpath}    timeout=10s
        Wait Until Element Is Enabled    ${main_xpath}    timeout=10s
        Sleep    1s

        Click Element    ${main_xpath}
        Sleep    0.5s
        Click Element    ${sub_xpath}
        
        Sleep    2s
        
        Page Should Contain    ${name}

        Capture Page Screenshot    
        
        Go Back
        Sleep    1s
    END

    Close Browser

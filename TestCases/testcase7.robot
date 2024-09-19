*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    XML

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_7 - Verify the product has a price
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
   
    Sleep    0.5s
    Maximize Browser Window
    Sleep    2s
 
    Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a 
    Sleep    0.5s
    Click Element     xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/div/ul/li[1]/a  
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[4]/div/div[1]/product-box/div[2]/div[1]/a/div/img
    Sleep    1s
    Page Should Contain Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[4]/div[1]/div[1]/span/span/span
    Sleep    2s
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[4]/div[1]/div[1]/span/span/span
    close browser

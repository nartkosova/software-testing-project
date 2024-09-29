*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary


*** Test Cases ***
TC_UI_6 - Check for product price placement on 2 different places
    Open Browser    https://www.jimms.fi/    Firefox
    Sleep    1s
    Click Element    xpath=//a[@href='/fi/Product/Komponentit']
    Wait Until Location Contains   /fi/Product/Komponentit

    ${frontpage_price}    Get Text  xpath=//span[@class='price__amount'][1]
    Log    ${frontpage_price}

    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[4]/div/div[1]/product-box/div[2]/div[2]/h5/a
    Wait Until Location Contains   /fi/Product/Show/155730/0r20b00166/raijintek-metis-evo-als-mini-itx-kotelo-musta-tarjous-norm-139-90
    
    ${productpage_price}    Get Text  xpath=/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[3]/div[1]/div[1]/span/span/span
    Log    ${productpage_price}

    Should Be Equal    ${frontpage_price}    ${productpage_price}
    Sleep    1s
    Close Browser


   
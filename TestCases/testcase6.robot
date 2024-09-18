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

    #Since "€" is a unicode character and therefore the strings cannot be compared later, so we have to get rid of it
    ${frontpage_price_split}    Split String  ${frontpage_price}    €
    Click Element    xpath=//img[@data-src='//ic.jimms.fi/product/5/7/471652-ig400gg.jpg']
    Wait Until Location Contains   /fi/Product/Show/194645/observatory-mx-gw/kolink-observatory-mx-glass-white-ikkunallinen-miditornikotelo-valkoinen-tarjous-norm-64-90
    
    #I realised, that I can copy the xpath directly from the inspect menu and don't have to type it manually
    ${productpage_price}    Get Text  xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[2]/div[1]/div[1]/span/span/span
    Log    ${productpage_price}

    ${productpage_price_split}    Split String  ${productpage_price}    €
    IF    ${frontpage_price_split}[0] == ${productpage_price_split}[0]
        Log    "Success"
        Log    ${frontpage_price_split}[0]
        Log    ${productpage_price_split}[0]
         Sleep    2s
        Close Browser
    #If the test runs correctly, the Else code won't show logged time in log - so it wasn't executed.    
    ELSE
        Log    "Fail"
        Log    ${frontpage_price_split}[0]
        Log    ${productpage_price_split}[0]
         Sleep    2s
        Close Browser
    END
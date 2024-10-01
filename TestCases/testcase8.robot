*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://jimms.fi

*** Test Cases ***
TC_UI_8 - Verify the registration form is working
    Open Browser    ${URL}    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
   
    Sleep    0.5s
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a

    Click Button    xpath://*[@id="private-tab-input"]
    Sleep    1s
    Input Text    name=EmailAddress    donald@gmail.com
 
    # Click Element    xpath:/html/body/main/div/div[2]/div[2]/div/div/div/form/div[2]/input
    # Sleep    1s
    # Input Password    name=Password    12345678
    # Click Element    name:ConfirmPasswordPassword
    # Input Password    name=ConfirmPassword    12345678
    Input Text    name=FirstName    Donald
    Input Text    name=LastName    Duck
    Input Text    name=Address    Visamantie 21
    Input Text    name=PostalCode    10000
    Input Text    name=City    Helsinki
    Input Text    name=Phone    0406465551
    Click Button    //*[@id="pf-GDPR"]
    Sleep    1s
    Capture Element Screenshot    xpath:/html/body/main/div/div[2]/div[2]/div/div
    Close Browser
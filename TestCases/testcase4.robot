*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary


*** Variables ***
${path}    xpath=//a[@href="/fi/ShoppingCart"]

*** Test Cases ***
TC_UI_4 - Shopping Cart Icon Locator
    Open Browser    https://www.jimms.fi/    Firefox
    Click Element    ${path}
    Wait Until Element Is Visible    ${path}
    Sleep    0.2s
    Capture Element Screenshot    ${path}  

    Sleep    2s
    Close Browser
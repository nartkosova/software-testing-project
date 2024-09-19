*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary


*** Variables ***
${switch_button}=    xpath:/html/body/div[1]/div/div/span
${switch_light}=    xpath:/html/body/div[1]/div/div/ul/li[1]/button
${switch_dark}=    xpath:/html/body/div[1]/div/div/ul/li[2]/button
${switch_automatic}=   xpath:/html/body/div[1]/div/div/ul/li[3]/button
    
*** Test Cases ***
TC_UI_7 - Color mode switching
    Open Browser    https://www.jimms.fi/    Firefox
    Click Element    ${switch_button}
    Wait Until Element Is Visible    ${switch_light}
    Click Element    ${switch_light}
    Sleep    1s

    Click Element    ${switch_button}
    Wait Until Element Is Visible    ${switch_dark}
    Click Element    ${switch_dark}
    Sleep    1s

    Click Element    ${switch_button}
    Wait Until Element Is Visible    ${switch_automatic}
    Click Element    ${switch_automatic}
    Sleep    1s

    Close Browser
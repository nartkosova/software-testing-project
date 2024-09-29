*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary


*** Variables ***
${newsletter_button}   xpath:/html/body/footer/div[1]/div[1]/div[2]/div/div[2]/div/a
${newsletter_confirm}    xpath:/html/body/main/div/div/form/div[3]/input

*** Test Cases ***
TC_UI_9 - Newsletter functionality
    Open Browser    https://www.jimms.fi/    Chrome
    Maximize Browser Window
    Sleep    1s

    Scroll Element Into View    ${newsletter_button}
    Wait Until Element Is Visible    ${newsletter_button}
    Click Element    ${newsletter_button}

    Wait Until Element Is Visible    xpath://*[@id="email"]
    Input Text    xpath://*[@id="email"]    test123@test.com
    Sleep    2s

    Click Element    ${newsletter_confirm}
    #This confirms that Newsletter subscription was received
    Page Should Contain    Uutiskirjeen tilaus vastaanotettu.
    Capture Page Screenshot
    Sleep    2s
    Close Browser
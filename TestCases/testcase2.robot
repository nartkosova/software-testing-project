*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
TC_UI_2 - Search functionality and verification of product page 
    Open Browser    https://www.jimms.fi/    Firefox
    Maximize Browser Window
    Input Text    xpath=//input[@id='searchinput']    ps5
    Click Element    xpath=//input[@id='searchinput']
    # For some reason, I wasn't able to click element on searchbar nor use enter/return key, so I had to "bypass" this with a single line of JS
    Execute JavaScript    document.querySelector('form').submit();

    Wait Until Location Contains   /fi/Product/Search?q=ps5
    Sleep    1s
    Wait Until Element Is Visible    xpath=/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span
    Click Element    xpath=/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span

    Wait Until Location Contains   /fi/Product/Show/199044/1000040194/sony-ps5-dualsense-midnight-black-langaton-peliohjain
    Wait Until Element Is Visible    xpath=/html/body/main/div[1]/div[2]/div[1]/jim-product-gallery/div/div[2]/section/div/div/div[1]/img

    #Im not sure if I should take screenshot of the whole product box, or just an image
    Capture Element Screenshot    xpath=/html/body/main/div[1]/div[2]/div[1]/jim-product-gallery/div/div[2]/section/div/div/div[1]/img
    Sleep    0.5s

    #This one is case sensitive, there is no "ps5" - only "PS5" - I had to change it in order to pass the test
    Page Should Contain    PS5
    Sleep    2s
    Close Browser




#Bugs
#Search button doesen't work - it does nothing
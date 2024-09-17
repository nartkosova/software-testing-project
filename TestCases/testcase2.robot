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
    Wait Until Element Is Visible    xpath=//span[@data-bind='text: Name' and contains(text(), 'EK-QuantumX CoolingStation Monoblock for PS5, vesiblokki PS5-konsolille')] 
    Click Element    xpath=//span[@data-bind='text: Name' and contains(text(), 'EK-QuantumX CoolingStation Monoblock for PS5, vesiblokki PS5-konsolille')]

    Wait Until Location Contains   /fi/Product/Show/196297/3831109907993/ek-waterblocks-ek-quantumx-coolingstation-monoblock-for-ps5-vesiblokki-ps5-konsolille
    Wait Until Element Is Visible    xpath=//img[@src='//ic.jimms.fi/product/0/2/462807-ig800gg.jpg']

    #Im not sure if I should take screenshot of the whole product box, or just an image
    Capture Element Screenshot    xpath=//img[@src='//ic.jimms.fi/product/0/2/462807-ig800gg.jpg']
    Sleep    0.5s

    #This one is case sensitive, there is no "ps5" - only "PS5" - I had to change it in order to pass the test
    Page Should Contain    PS5
    Sleep    2s
    Close Browser




#Bugs
#Search button doesen't work - it does nothing
# Not really a bug - but similar products are not really similar, they are just random cooling backplates from the same company - not ps5 related
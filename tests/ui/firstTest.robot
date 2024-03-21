*** Settings ***
Library   SeleniumLibrary
#Library    Browser

*** Variables ***

*** Test Cases ***
Verify the title of home page for Automation Exercise
    [Tags]  demo1
    Open Browser    https://automationexercise.com/    Chrome
    Click Link    Signup / Login
    Input Text    xpath://input[@data-qa='login-email']    MohamedTestMail1@gmail.com
    Input Text    xpath://input[@placeholder='Password']    admin123
    Click Button     xpath://button[normalize-space()='Login']
    ${Get_title}=  Get Title
    Should Be Equal As Strings   ${Get_title}    Automation Exercise
    Close Browser

*** Keywords ***
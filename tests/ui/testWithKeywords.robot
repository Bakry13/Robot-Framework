*** Settings ***
Library    SeleniumLibrary
Library    Process
#Library    Browser

*** Variables ***
${LoginPageURL}    https://automationexercise.com/
${Browser}    Chrome
${HeadlessBrowser}  headlesschrome
${LoginInLinkText}    Signup / Login
${EmailLocator}    xpath://input[@data-qa='login-email']
${PasswordLocator}    xpath://input[@placeholder='Password']
${LoginButtonLocator}    xpath://button[normalize-space()='Login']
${homePageLogoLocator}    xpath://img[@alt='Website for automation practice']
${screenshotsPath}    screenshots

*** Test Cases ***
Verify the title of home page for Automation Exercise after login
    [Tags]  demo2
    Open Automation Exercise Home Page
    Click Login LinkText
    Adjust Window Size
    Type In Email    MohamedTestMail1@gmail.com
    Type In Password    admin123
    Click Login
    Maximize Browser Window
    Capture Screenshot For Home Page Logo
    Capture Screenshot For Home Page
    Page Title Should Equal   Automation Exercise
    [Teardown]    Close Browser

*** Keywords ***
Open Automation Exercise Home Page
    Open Browser    ${LoginPageURL}    ${Browser}

Click Login LinkText
    Click Link     ${LoginInLinkText}

Adjust Window Size
    Set Window Size    1080    1920

Type In Email
    [Arguments]    ${email}
    Input Text    ${EmailLocator}    ${email}

Type In Password
    [Arguments]    ${password}
    Input Text    ${PasswordLocator}    ${password}

Click Login
    Click Button     ${LoginButtonLocator}

Capture Screenshot For Home Page Logo
    Capture Element Screenshot    ${homePageLogoLocator}

Capture Screenshot For Home Page
    Capture Page Screenshot

Page Title Should Equal
    [Arguments]    ${homePageTitle}
    Title Should Be    ${homePageTitle}
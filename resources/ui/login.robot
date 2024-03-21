*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${LoginPageURL}    https://automationexercise.com/
${Browser}    Chrome
${HeadlessBrowser}  headlesschrome
${LoginLinkText}    Signup / Login
${EmailLocator}    xpath://input[@data-qa='login-email']
${PasswordLocator}    xpath://input[@placeholder='Password']
${LoginButtonLocator}    xpath://button[normalize-space()='Login']
${homePageLogoLocator}    xpath://img[@alt='Website for automation practice']
${screenshotsPath}    screenshots

*** Keywords ***
Open Automation Exercise Home Page
    Open Browser    ${LoginPageURL}    ${Browser}

Click Login LinkText
    Click Link     ${LoginLinkText}

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
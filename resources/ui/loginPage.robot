*** Settings ***
Resource        ../../utils/commonKeywords.robot

*** Variables ***
${LoginPageURL}                 https://automationexercise.com/
${Browser}                      Chrome
${HeadlessBrowser}              headlesschrome
${EmailLocator}                 xpath=//input[@data-qa='login-email']
${PasswordLocator}              xpath=//input[@placeholder='Password']
${LoginButtonLocator}           xpath=//button[normalize-space()='Login']
${homePageLogoLocator}          xpath=//img[@alt='Website for automation practice']
${invalidLoginErrorLocator}     css=body > section:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > form:nth-child(2) > p:nth-child(4)
${screenshotsPath}              screenshots
${homePageTitle}                Automation Exercise
&{invalidLoginErrorText}        en=Your email or password is incorrect!       ar=invalid login

*** Keywords ***
Open Automation Exercise Home Page
    Open Browser    ${LoginPageURL}    ${Browser}

Adjust Window Size
    Set Viewport Size    1080    1920

Type In Email
    [Arguments]    ${email}
    Fill Text    ${EmailLocator}    ${email}

Type In Password
    [Arguments]    ${password}
    Fill Text    ${PasswordLocator}    ${password}

Click Login
    Click    ${LoginButtonLocator}

Login To Automation Practice
    [Arguments]     ${email}        ${password}
    Type In Email    ${email}
    Type In Password    ${password}
    Click Login

Capture Screenshot For Home Page
    Take Screenshot

Validate that home page has the correct title
    Get Title       Equal      ${homePageTitle}

Verify that Invalid Login Error has the correct text
    Validate Element text     ${invalidLoginErrorLocator}      ${invalidLoginErrorText}
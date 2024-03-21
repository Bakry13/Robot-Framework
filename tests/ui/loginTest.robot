*** Settings ***
Resource            ../../resources/ui/loginPage.robot
Resource            ../../resources/ui/homePage.robot
Suite Setup         Log To Console   start our test suite
Suite Teardown      Log To Console   end our test suite
Test Setup          Log To Console   start our test case
Test Teardown       Test Case TearDown

*** Test Cases ***
Demo Test Case
    Log To Console  TestDemo

Verify contact us text
    [Tags]  textTest
    Launch Browser
    Verify that contact us has the correct text

Verify the title of home page for Automation Exercise after login
    [Tags]  demo2
    Launch Browser
    Click Login LinkText
    Adjust Window Size
    ${EmailValue}        Read From JSON File    $..email
    ${PasswordValue}        Read From JSON File    $..password
    Log To Console    Email value from json is: ${EmailValue[0]}
    Login To Automation Practice    ${EmailValue[0]}    ${PasswordValue[0]}
    Capture Screenshot For Home Page
    Validate that home page has the correct title

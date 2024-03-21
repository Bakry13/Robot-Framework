*** Settings ***
Resource    ../../resources/ui/login.robot
Suite Setup     Log To Console   start our test suite
Test Setup      Log To Console   start our test case
Test Teardown   Log To Console   end our test case
Suite Teardown  Log To Console   end our test suite

*** Test Cases ***
Demo Test Case
    Log To Console  TestDemo

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
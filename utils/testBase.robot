*** Settings ***
Library             Browser
Library             JSONLibrary
Library             RequestsLibrary
Library             Collections
Variables           ../variables/${TestEnvironment}/URLs.py
Variables           ../variables/paths.py

*** Variables ***
#Environment
${BrowserType}              Firefox
${TestEnvironment}          test
${Headless}                 false
${Language}                 en

#*** Test Cases ***
#Test my code
#    Launch Browser

*** Keywords ***
Launch Browser
    Log To Console      ${BaseURL}
    Open Browser        ${BaseURL}      ${BrowserType}      ${Headless}

Verify Element text
    [Arguments]     ${Locator}      ${ExpectedText}
    Get Text   ${Locator}     Equal       ${ExpectedText}
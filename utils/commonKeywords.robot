*** Settings ***
Resource           ../utils/testBase.robot

*** Variables ***
#${JsonFilePath}         ${CURDIR}/../testData/test/users.json

*** Keywords ***
Test Case TearDown
    Log To Console   end our test case
    [Teardown]    Close Browser

Validate Element text
    [Arguments]     ${Locator}      ${ExpectedText}
    IF    "${Language}" == "en"
        Get Text     ${Locator}    Equal    ${ExpectedText}[en]
    ELSE
        Get Text     ${Locator}    Equal    ${ExpectedText}[ar]
    END

Read From JSON File
    [Arguments]     ${Key}
    ${DataObject}         Load Json From File    ${users_test}
    @{value}        Get Value From Json    ${DataObject}    ${Key}
    RETURN        @{value}

Read From JSON Response
    [Arguments]     ${response}     ${jsonPath}
    ${responseBody} =      Set Variable    ${response.json()}
    @{value}    Get Value From Json   ${responseBody}      ${jsonPath}
    RETURN        @{value}

Validate Response Length
    [Arguments]     ${response}     ${expectedLength}
    ${responseBodyLength} =     Evaluate  len(${response.content})
    ${responseBodyLength-str} =     Convert To String     ${responseBodyLength}
    Should Be Equal   ${responseBodyLength-str}       ${expectedLength}

Validate Response Status Code
    [Arguments]     ${response}     ${expectedStatusCode}
    ${statusCode} =   Convert To String     ${response.status_code}
    Should Be Equal   ${statusCode}       ${expectedStatusCode}
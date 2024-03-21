*** Settings ***
Resource            ../../resources/api/usersEndpoints.robot

*** Test Cases ***
#========================status code 200==========================
Check get users response success status code
    ${response}       Get Users Request
    Validate Response Status Code       ${response}       200
#========================list assertion 200==========================
Check get users response list length
    ${response}       Get Users Request
    Validate Response Length   ${response}       100
#========================json path 200==========================
Check a specific value in get users response
    ${response}       Get Users Request
    ${responseBody} =      Set Variable    ${response.json()}
    @{firstUserTitle}   Read From JSON Response     ${response}     $.[0].title
    Should Be Equal   ${firstUserTitle[0]}       sunt aut facere repellat provident occaecati excepturi optio reprehenderit
#========================query params 200==========================
Check specific user using query params in get request
    ${response}     Get Specific User
    @{title}   Read From JSON Response     ${response}     $.[0].title
    Should Be Equal   ${title[0]}      qui est esse
#========================post with body and header 201==========================
Check the response status code and body for a post request
    ${response}       Post User
    Validate Response Status Code       ${response}        201
    @{id}        Read From JSON Response    ${response}    id
    ${id-str}        Convert To String    ${id[0]}
    Should Be Equal   ${id-str}      101
#=================================================================================
*** Keywords ***
*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary

*** Variables ***
${baseURL}      https://jsonplaceholder.typicode.com
${requestBody}              {"title": "foo", "body": "bar", "userId": 102}
${requestHeader}            {'Content-Type':    'application/json'}
&{requestParams}            id=2

*** Test Cases ***
#========================status code 200==========================
Check get users response success status code
    Create Session    usersSession    ${baseURL}
    ${response}       GET On Session    usersSession    /posts
    ${statusCode} =   Convert To String     ${response.status_code}
    Should Be Equal   ${statusCode}       200
#========================list assertion 200==========================
Check get users response list length
    Create Session    usersSession    ${baseURL}
    ${response}       GET On Session    usersSession    /posts
    ${responseBodyLength} =     Evaluate  len(${response.content})
    ${responseBodyLength-str} =     Convert To String     ${responseBodyLength}
    Should Be Equal   ${responseBodyLength-str}       100
#========================json path 200==========================
Check a specific value in get users response
    Create Session    usersSession    ${baseURL}
    ${response}       GET On Session    usersSession    /posts
    ${responseBody} =      Set Variable    ${response.json()}
    @{firstUserTitle}    Get Value From Json   ${responseBody}      $.[0].title
    Should Be Equal   ${firstUserTitle[0]}       sunt aut facere repellat provident occaecati excepturi optio reprehenderit
#========================query params 200==========================
Check specific user using query params in get request
    Create Session    usersSession    ${baseURL}
    ${response}       GET On Session    usersSession    /posts      params=${requestParams}
    ${responseBody} =      Set Variable    ${response.json()}
    @{title}        Get Value From Json    ${responseBody}    $.[0].title
    Log To Console    ${responseBody}
    Should Be Equal   ${title[0]}      qui est esse
#========================post with body and header 201==========================
Check the response status code and body for a post request
    Create Session    usersSession    ${baseURL}     headers=${requestHeader}
    ${response}       POST On Session    usersSession    /posts     data=${requestBody}
    ${statusCode} =   Convert To String     ${response.status_code}
    Should Be Equal   ${statusCode}       201
    ${responseBody} =      Set Variable    ${response.json()}
    @{value}        Get Value From Json    ${responseBody}    id
    ${value-str}        Convert To String    ${value[0]}
    Should Be Equal   ${Value-str}      101

*** Keywords ***
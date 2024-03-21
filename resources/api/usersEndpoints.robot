*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Resource        ../../utils/commonKeywords.robot

*** Variables ***
${baseURL}                  https://jsonplaceholder.typicode.com
${requestBody}              {"title": "foo", "body": "bar", "userId": 102}
${requestHeader}            {'Content-Type':    'application/json'}
&{requestParams}            id=2

*** Keywords ***
Get Users Request
    Create Session    usersSession    ${APIBaseURL}
    ${response}       GET On Session    usersSession    /posts
    RETURN      ${response}

Get Specific User
    Create Session    usersSession    ${baseURL}
    ${response}       GET On Session    usersSession    /posts      params=${requestParams}
    RETURN      ${response}

Post User
    Create Session    usersSession    ${baseURL}     headers=${requestHeader}
    ${response}       POST On Session    usersSession    /posts     data=${requestBody}
    RETURN      ${response}
*** Settings ***
Library             DatabaseLibrary
Variables           ../variables/credentials.py
Test Teardown       Disconnect From Database

*** Variables ***
${DBUser}           root
${DBPass}
${DBName}           mysql
${DBHost}           localhost
${DBPort}           3306    #default port number for mysql server

*** Test Cases ***
Test dataBase connection
    ${result}       Run Query     SELECT Host from user;
    Log To Console    ${result}

*** Keywords ***
Run Query
    [Arguments]     ${queryStatement}
    Connect To Database    pymysql      ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
    @{result} =     Description    ${queryStatement}
    RETURN      ${result}
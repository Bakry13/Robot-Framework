*** Settings ***
#Library             DataDriver      ../../testData/users-excel.xlsx #Does not work
Library             ../../libraries/readers/csvReader.py
Library             ../../libraries/readers/excelReader.py
Resource            ../../resources/ui/loginPage.robot
Resource            ../../resources/ui/homePage.robot
Suite Setup         Log To Console   start our test suite
Suite Teardown      Log To Console   end our test suite
Test Setup          Log To Console   start our test case
Test Teardown       Log To Console   end our test case
Test Template       Read From Different File Types

*** Variables ***
${CSVFileName}              ${testData}${TestEnvironment}/users-csv.csv
${ExcelFileName}            ${testData}${TestEnvironment}/users-excel.xlsx

*** Test Cases ***
Log Different Values of Test Data From Different Files      0       0
Log Different Values of Test Data From Different Files      1       1
Log Different Values of Test Data From Different Files      2       2

*** Keywords ***
Read From Different File Types
    [Arguments]                 ${emailIndex}             ${passwordIndex}
    ${EmailValue}               Read From JSON File    $..email
    ${PasswordValue}            Read From JSON File    $..password
    Log To Console              Email value from json is: ${EmailValue[${emailIndex}]}
    ${readedData}               Read CSV File               ${CSVFileName}    1       ${emailIndex}
    Log To Console              Email value from csv is: ${readedData}
    ${readedData}               Read Excel File               ${ExcelFileName}    1       ${emailIndex}
    Log To Console              Email value from excel is: ${readedData}
#    Read from yaml file using cmd in runtime
    Log To Console              Email value from yaml is: ${email}

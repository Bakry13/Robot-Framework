*** Settings ***
Resource        ../../utils/commonKeywords.robot

*** Variables ***
#Locators
${ContactUs}                xpath=//a[normalize-space()='Contact us']
${LoginLinkText}            xpath=//a[normalize-space()='Signup / Login']
#Texts
#Dictionary (json format) and will be accessed like this ${ContactUsText}[en]
&{ContactUsText}            en=${SPACE}Contact us       ar=تواصل معنا
#List and will be accessed like this ${testText}[0]
@{testText}                 hello       hello2

*** Keywords ***
Click Login LinkText
    Click     ${LoginLinkText}

Verify that contact us has the correct text
    Validate Element text     ${ContactUs}      ${ContactUsText}
#Test openning google play app
*** Settings ***
Library             AppiumLibrary
Library             JSONLibrary
Library             RequestsLibrary
Library             Collections
Variables           ../variables/${TestEnvironment}/URLs.py
Variables           ../variables/paths.py

*** Variables ***
#Environment
${TestEnvironment}          test
${Language}                 en

#Appium Capabilities
${AppiumURL}                http://127.0.0.1:4723
${platformName}             Android
${automationName}           UIautomator2
${appPackage}               com.android.vending
${appActivity}              com.android.vending.AssetBrowserActivity
*** Test Cases ***
Test my code
    Launch App

*** Keywords ***
Launch App
    Open Application    ${AppiumURL}    platformName=${platformName}     automationName=${automationName}    appPackage=${appPackage}    appActivity=${appActivity}
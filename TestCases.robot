*** Settings ***
Library     AppiumLibrary
#Library    SeleniumLibrary


*** Variables ***
${ANDROID_PLATFORM_NAME}            Android
${ANDROID_AUTOMATION_NAME}          UIAutomator2
${ANDROID_AUTOMATION_VERSION}       %{ANDROID_AUTOMATION_VERSION=10}
${ANDROID_APP}                      ${CURDIR}/test_project/vointy.apk


*** Test Cases ***
Open Vointy-App
    Open Test Application

Validate Language options which is initial
    Language options

Change Language to Finnish
    Change Language

Start to Login
    submit Login


*** Keywords ***
Open Test Application
    Open Application    http://localhost:4723/wd/hub
    ...    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}
    ...    platformVersion=${ANDROID_AUTOMATION_VERSION}    app=${ANDROID_APP}

Language options
    AppiumLibrary.Wait Until Page Contains Element    //android.widget.ImageView[@content-desc="English"]
    ${name}    AppiumLibrary.Get Element Attribute    //android.widget.ImageView[@index=4]    name
    Log    ${name}

Change Language
    AppiumLibrary.Click Element    //android.widget.ImageView[@index=4]
    Sleep    2s
    AppiumLibrary.Click Element    //android.view.View[@content-desc="Suomi"]
    AppiumLibrary.Wait Until Page Contains Element    //android.widget.ImageView[@content-desc="Suomi"]

Submit Login
    AppiumLibrary.Click Element    //android.view.View[@content-desc="Kirjaudu sisään"]
    AppiumLibrary.Wait Until Page Contains Element    //

Fill in Credentials

Search Query Should Be Matching
    [Arguments]    ${text}
    Wait Until Page Contains Element    android:id/search_src_text
    Element Text should Be    android:id/search_src_text    ${test}



 









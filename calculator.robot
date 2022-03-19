*** Settings ***
Library                 AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.android.calculator2
${APP_ACTIVITY}         com.android.calculator2.Calculator

*** Test Cases ***
Tes Penjumlahan
    Open Android Application
    Click Calculator Number         number=5
    Click Calculator Operation      operation=plus
    Click Calculator Number         number=2
    Click Calculator Operation      operation=equals
    Element Attribute Should Match  com.android.calculator2:id/result       text        13
    Close Application
    #Tap 5
    #Tap +
    #Tap 8
    #Tap =
    #Verify result

Tes Perkalian
    Open Android Application
    Click Calculator Number         number=7
    Click Calculator Number         number=11   
    Click Calculator Operation      operation=multiply
    Click Calculator Number         number=9
    Click Calculator Operation      operation=equals
    Element Attribute Should Match  com.android.calculator2:id/result       text        30
    Close Application
    #Tap 1
    #Tap 0
    #Tap x
    #Tap 8
    #Tap =
    #Verify result

Tes Pembagian
    Open Android Application
    Click Calculator Number         number=2
    Click Calculator Number         number=4   
    Click Calculator Operation      operation=divide
    Click Calculator Number         number=8
    Click Calculator Operation      operation=equals
    Element Attribute Should Match  com.android.calculator2:id/result       text        42
    Close Application
    #Tap 8
    #Tap 4
    #Tap :
    #Tap 2
    #Tap =
    #Verify result

Tes Pengurangan
    Open Android Application
    Click Calculator Number         number=2
    Click Calculator Number         number=4   
    Click Calculator Operation      operation=minus
    Click Calculator Number         number=2
    Click Calculator Number         number=11
    Click Calculator Operation      operation=equals
    Element Attribute Should Match  com.android.calculator2:id/result       text        4
    Close Application
    #Tap 8
    #Tap 4
    #Tap -
    #Tap 8
    #Tap 0
    #Tap =
    #Verify result

*** Keywords ***
Open Android Application
    Open Application            ${REMOTE_URL}	
    ...                         platformName=${PLATFORM_NAME}
    ...                         platformVersion=${PLATFORM_VERSION}
    ...                         deviceName=${DEVICE_NAME}
    ...                         appPackage=${APP_PACKAGE}
    ...                         appActivity=${APP_ACTIVITY}

Click Calculator Number
    [Arguments]                 ${number}
    Click Element               //android.widget.LinearLayout[@content-desc="Numbers and basic operations"]/android.view.ViewGroup[1]/android.widget.Button[${number}]

Click Calculator Operation             
    [Arguments]                 ${operation}
    Click Element               //android.widget.Button[@content-desc="${operation}"]
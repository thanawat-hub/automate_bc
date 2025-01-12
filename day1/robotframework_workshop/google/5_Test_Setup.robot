*** Settings ***
Library    SeleniumLibrary

Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google

*** Variables ***
${URL}    https://google.com
${BROWSER}    chrome
${BYNAME}    q

*** Test Cases ***
ทดสอบใส่คำค้นหา Danmachi ควรเจอ anime
    ค้นหาและตรวจสอบ    Danmachi    anime

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    ${URL}    ${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}
    ใส่คำค้นหา    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลการค้นหา}
    ปิดเว็บเบราว์เซอร์

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    name=q    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}

ปิดเว็บเบราว์เซอร์
    Close Browser

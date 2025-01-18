*** Comments ***


*** Settings ***
Library             SeleniumLibrary

Test Setup          เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown       Close Browser


*** Variables ***
${URL}          https://google.com
${BROWSER}      chrome
${BYNAME}       q


*** Test Cases ***
ทดสอบใส่คำค้นหาต่างๆ ใน _${BROWSER}_ ควรเจอ expceted result ที่ตั้งไว้
    [Template]    ค้นหาและตรวจสอบ
    Danmachi    anime
    AI    OpenAI
    GPT    OpenAI


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    ${URL}    ${BROWSER}
# มองว่าเป็น group ใหญ่ที่รวม คำสั่งย่อยๆ และ arguments ต่างๆ ผ่านไปด้วย

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}
    ใส่คำค้นหา    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลการค้นหา}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    name=q    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลการค้นหา}
    Wait Until Page Contains    ${ผลการค้นหา}

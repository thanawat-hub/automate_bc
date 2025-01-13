*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}          https://www.allonline.7eleven.co.th/
${BROWSER}      chrome
${BYNAME}       q
# หาได้จาก ไปดู element componant จากหน้าบ้าน


*** Test Cases ***
โจทย์ Search สินค้า จาก all online
## ชื่อหัวข้อ test case

    เปิดเว็บเบราว์เซอร์เข้า_all_online
    ใส่คำค้นหา    ไฟน์ไลน์
    กดปุ่ม_Enter
    ตรวจสอบผลการค้นหา    88
    ปิดเว็บเบราว์เซอร์

*** Keywords ***
เปิดเว็บเบราว์เซอร์เข้า_all_online
    Open Browser    url=${URL}    browser=${BROWSER}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=${BYNAME}    ${คำค้น}

กดปุ่ม_Enter
    Press Keys    name=${BYNAME}    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลที่ต้องการ}
    Wait Until Page Contains    ${ผลที่ต้องการ}

ปิดเว็บเบราว์เซอร์
    Close Browser

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทดสอบใส่คำค้นหา Robot Framework
    เปิดเว็บเบราว์เซอร์เข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา expected_result
    ปิดเว็บเบราว์เซอร์

*** Variables ***
${URL}    https://google.com
${BROWSER}    headlesschrome
${KEYWORD_SEARCH}    PIM
${EXPECTED_RESULT}    สถาบันการจัดการปัญญาภิวัฒน์
${BYNAME}    q

*** Keywords ***
เปิดเว็บเบราว์เซอร์เข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}
ใส่คำค้นหา
    Input Text    name=${BYNAME}    ${KEYWORD_SEARCH}
กดปุ่ม Enter
    Press Keys      name=${BYNAME}    RETURN
ตรวจสอบผลการค้นหา expected_result
    Wait Until Page Contains    ${EXPECTED_RESULT}
ปิดเว็บเบราว์เซอร์
    Close Browser


## etc:
#ถ้ามันยังเปิด Browser ให้เห็นอยู่ ให้อัพเกรด Selenium เป็นเวอร์ชั่น 3.8.0 หรือใหม่กว่า และ SeleniumLibrary เป็นเวอร์ชั่น 3.1.0 ก่อนนะ
#ref: https://medium.com/odds-team/headless-robot-framework-%E0%B8%A1%E0%B8%B2%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%81%E0%B8%B1%E0%B8%9A-seleniumlibrary-%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7-7dc413f98b6d

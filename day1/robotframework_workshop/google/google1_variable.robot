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
${BROWSER}    chrome
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
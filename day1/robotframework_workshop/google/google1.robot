*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทดสอบใส่คำค้นหา Robot Framework
    เปิดเว็บเบราว์เซอร์เข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา expected_result
    ปิดเว็บเบราว์เซอร์

*** Keywords ***
เปิดเว็บเบราว์เซอร์เข้า Google
    Open Browser    url=https://google.com    browser=chrome
ใส่คำค้นหา
    Input Text    name=q    Robot Framework
กดปุ่ม Enter
    Press Keys      name=q    RETURN
ตรวจสอบผลการค้นหา expected_result
    Wait Until Page Contains    Robot Framework
ปิดเว็บเบราว์เซอร์
    Close Browser


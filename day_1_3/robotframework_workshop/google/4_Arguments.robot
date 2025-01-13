*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://google.com
${BROWSER}    chrome
${BYNAME}    q

*** Test Cases ***
ทดสอบใส่คำค้นหา Danmachi
    เปิดเว็บเบราว์เซอร์เข้า Google
    ใส่คำค้นหา    Danmachi
    ### มองตรงนี้เป็น arguments (ด้านหลัง 4 white space จาก ชื่อ function) ส่งเข้าไปใน fn ใส่คำค้นหา และอย่า command ที่บรรทัดเดียวกันกับ code
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    anime
    ปิดเว็บเบราว์เซอร์

ทดสอบใส่คำค้นหา avp
    เปิดเว็บเบราว์เซอร์เข้า Google
    ใส่คำค้นหา    avp
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    alien
    ปิดเว็บเบราว์เซอร์

*** Keywords ***
เปิดเว็บเบราว์เซอร์เข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}
ใส่คำค้นหา
    [Arguments]    ${คำค้น}
     # ถ้าคิดชื่อไม่ออกใส่เป็นภาษาไทยไปก่อนก็ได้ ซึ่งคำค้นจะไปดึงมาจาก test case ## ไม่ควรใส่ comment ในบรรทัดเดียวกับ command ##
    Input Text    name=${BYNAME}    ${คำค้น}
กดปุ่ม Enter
    Press Keys      name=${BYNAME}    RETURN
ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลที่ต้องการ}
    Wait Until Page Contains    ${ผลที่ต้องการ}
ปิดเว็บเบราว์เซอร์
    Close Browser

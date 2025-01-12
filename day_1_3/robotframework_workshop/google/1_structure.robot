*** Comments ***
## จะ comment ที่ด้านล่างของบรรทัดนั้นเสมอนะจั๊ฟ

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทดสอบใส่คำค้นหา Robot Framework
## ชื่อหัวข้อ test case

    เปิดเว็บเบราว์เซอร์เข้า Google
    ใส่คำค้นหา
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา expected_result
    ปิดเว็บเบราว์เซอร์
    ## มองว่าเป็น workflow ภาษาคน (ถ้ามองในคอมคือชื่อ function)

*** Keywords ***
เปิดเว็บเบราว์เซอร์เข้า Google
    ## function ชื่อนี้ `เปิดเว็บเบราว์เซอร์เข้า Google` จะทำการ action Open Browser <- ไปดู docs ว่าใช้ยังไง
    [Documentation]    การทำ action นี้ บ่งบอกถึง business logic อะไรหรือเปล่า ซึ่งตรงนี้ จะบ่งบอกถึง rule จากรูป pyramid
    Open Browser    url=https://google.com    browser=chrome
ใส่คำค้นหา
    Input Text    name=q    Robot Framework
กดปุ่ม Enter
    Press Keys      name=q    RETURN
ตรวจสอบผลการค้นหา expected_result
    Wait Until Page Contains    Robot Framework
ปิดเว็บเบราว์เซอร์
    Close Browser

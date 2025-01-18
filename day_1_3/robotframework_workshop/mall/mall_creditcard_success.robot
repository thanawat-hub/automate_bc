*** Comments ***
# step
## ใส่ key word ที่ test cases เช่น [ทดสอบ, สินค้า, credit_card, สำเร็จ(คือตัวนี้ไว้บอก expected result)]
## และก็เอาเงื่อนไขต่างๆ มาจาก requirement
### เทคนิคการเขียน test cases ถ้ามี action ต้องมี validation
# > ถ้าลูกค้าเปลี่ยน flow ให้เริ่มทำไฟล์ใหม่เลย อย่าไปแก้ตามของเดิม ให้ทำใจ เพราะจะไวกว่า (อย่าลืมบวกเวลา maintenance) < #

*** Settings ***
Library    SeleniumLibrary
## ถ้าไม่ load ตรงนี้ มันก็หา keyword ไม่เจอ

*** Variables ***
${DEV_URL}    http://165.22.255.65/product/list
${SIT_URL}    http://159.223.89.151/product/list
${UAT_URL}    http://159.223.71.75/product/list
# ทำไว้สำหรับ pass argument ตอนรันบน cmd

${BROWSER}    chrome
${KEYWORD_SEARCH}    Bicycle

*** Test Cases ***
ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ
    เปิดลิ้งเบราว์เซอร์
    ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
#    เลือกสิ้นค้าที่ต้องการ
#	ตรวจสอบราคาสินค้า
#	คำนวณจำนวนแต้มจากราคาสิ้นค้า
#    ตรวจสอบราคาและแต้มว่าถูกต้องไหม  <price> <point>
#	expected_result
#    ?ปิดเว็บเบราว์เซอร์

*** Keywords ***
เปิดลิ้งเบราว์เซอร์
    Open Browser    url=${DEV_URL}    browser=${BROWSER}
ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
    Input Text      id:search-product-input    ${KEYWORD_SEARCH}
    Click Element   id:search-product-btn
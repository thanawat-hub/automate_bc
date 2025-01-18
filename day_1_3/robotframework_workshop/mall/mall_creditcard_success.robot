*** Comments ***
# step
## ใส่ key word ที่ test cases เช่น [ทดสอบ, สินค้า, credit_card, สำเร็จ(คือตัวนี้ไว้บอก expected result)]
## และก็เอาเงื่อนไขต่างๆ มาจาก requirement
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
${EXPECTED_SEARCH}    Bicycle

*** Test Cases ***
### *** เทคนิคการเขียน test cases ถ้ามี action ต้องมี validation ***
ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ
    เปิดลิ้งเบราว์เซอร์
    ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
        ตรวจสอบผลลัพธ์หลัง search
    # เลือกสิ้นค้าที่ต้องการ
	#     ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ
    # เพิ่ม-ลดสินค้าตามต้องการ
    #     ตรวจสอบจำนวนสิ้นค้าว่าตรงกับที่เลือกไหม
    #     ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ
    # แอดลงตระกร้าสินค้า
    # จ่ายเงินผ่าน credit_card ตามราคาที่แสดง
    # ยืนยัน OTP
    # ปิดเว็บเบราว์เซอร์

*** Keywords ***
เปิดลิ้งเบราว์เซอร์
    Open Browser    url=${DEV_URL}    browser=${BROWSER}
ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
    Input Text      id:search-product-input    ${KEYWORD_SEARCH}
    Click Element   id:search-product-btn
ตรวจสอบผลลัพธ์หลัง search
## แล้วถ้า สินค้าไม่ได้ขึ้นช่องแรก ตามที่เขียนไว้ก็จะแตก
    ## อาจเกิดได้จาก dev เขียนโค้ด เช่น random position show, database ไม่มี stock แล้วไม่โชว์ และอื่นๆ (ซึ่งเป็นข้อจำกัด ของ UI test)

    # มันมีของที่ search แต่มันไม่โชว์ ก็แก้ด้วย
    Wait Until Element Is Visible    id:product-card-name-1
    
    # ตรวจสอบชื่อว่าใช้ bicycle ไหม ## อยากรู้ต้องใช้ชื่อตรงๆ เลยไหม? ได้ และตัว expected มัน defualt เป็น str เลยตาม docs ไม่ต้องไปใส่ "" ครบให้มัน
    Element Should Contain           id:product-card-name-1       expected=Bicycle

    # ตรวจสอบราคา
    Element Should Contain           id:product-card-price-1      expected=฿4,314.60

# next
    # # ตรวจสอบ feautre ว่าทำงานถูกไหม 100 บาท = 1 แต้ม ขอให้ละเอียดถึง grammar เพราะส่งผลต่อหน้าตา 
    # Element Should Contain           id:product-detail-point       expected='43'
    
    

*** Comments ***
# step
## ใส่ key word ที่ test cases เช่น [ทดสอบ, สินค้า, credit_card, สำเร็จ(คือตัวนี้ไว้บอก expected result)]
## และก็เอาเงื่อนไขต่างๆ มาจาก requirement
# > ถ้าลูกค้าเปลี่ยน flow ให้เริ่มทำไฟล์ใหม่เลย อย่าไปแก้ตามของเดิม ให้ทำใจ เพราะจะไวกว่า (อย่าลืมบวกเวลา maintenance) < #

*** Settings ***
Library    SeleniumLibrary
## ถ้าไม่ load ตรงนี้ มันก็หา keyword ไม่เจอ

*** Variables ***
# ${DEV_URL}    http://165.22.255.65/product/list
# ${SIT_URL}    http://159.223.89.151/product/list
# ${UAT_URL}    http://159.223.71.75/product/list
# # ทำไว้สำหรับ pass argument ตอนรันบน cmd

${BROWSER}    chrome
# ${KEYWORD_SEARCH}    Bicycle
# ${EXPECTED_SEARCH}    Bicycle


${CHECKOUT_URL}    http://159.223.89.151/checkout

*** Test Cases ***
### *** เทคนิคการเขียน test cases ถ้ามี action ต้องมี validation ***
# ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ
    # เปิดลิ้งเบราว์เซอร์
    # ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
    #     ตรวจสอบผลลัพธ์หลัง search
    # เลือกสิ้นค้าที่ต้องการ
	#     ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ
    # #  เพิ่ม-ลดสินค้าตามต้องการ #-> มันจะต้องแยก test case เพราะมันจะซับซ้อน => ตรงนี้ขอแค่ flow ปกติก่อนแบบให้ครบ end-to-end
    # # กดaddลงตะกร้าสินค้า
    #     ตรวจสอบจำนวนสิ้นค้าในตระกร้าว่าตรงกับที่เลือกไหม
    #     ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ

    # จ่ายเงินผ่าน credit_card ตามราคาที่แสดง
    # ยืนยัน OTP
    # ปิดเว็บเบราว์เซอร์


ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ by pass
    Open Checkout
    ตรวจสอบราคาสินค้าคุยบัญชีแล้วเอาทางขวา
    กรอกข้อมูลการส่งสินค้า

*** Keywords ***
# เปิดลิ้งเบราว์เซอร์
#     Open Browser    url=${DEV_URL}    browser=${BROWSER}
# ใส่คำค้นหาสินค้าด้วยคำค้นหาและคลิก search
#     Input Text      id:search-product-input    ${KEYWORD_SEARCH}
#     Click Element   id:search-product-btn
# ตรวจสอบผลลัพธ์หลัง search
# ## แล้วถ้า สินค้าไม่ได้ขึ้นช่องแรก ตามที่เขียนไว้ก็จะแตก
#     ## อาจเกิดได้จาก dev เขียนโค้ด เช่น random position show, database ไม่มี stock แล้วไม่โชว์ และอื่นๆ (ซึ่งเป็นข้อจำกัด ของ UI test)

#     # มันมีของที่ search แต่มันไม่โชว์ ก็แก้ด้วย
#     Wait Until Element Is Visible    id:product-card-name-1
    
#     # ตรวจสอบชื่อว่าใช้ bicycle ไหม ## อยากรู้ต้องใช้ชื่อตรงๆ เลยไหม? ได้ และตัว expected มัน defualt เป็น str เลยตาม docs ไม่ต้องไปใส่ "" ครบให้มัน
#     Element Should Contain           id:product-card-name-1       expected=Bicycle

#     # ตรวจสอบราคา
#     Element Should Contain           id:product-card-price-1      expected=฿4,314.60

# # next
#     # # ตรวจสอบ feautre ว่าทำงานถูกไหม 100 บาท = 1 แต้ม ขอให้ละเอียดถึง grammar เพราะส่งผลต่อหน้าตา 
#     # Element Should Contain           id:product-detail-point       expected='43'
    
# เลือกสิ้นค้าที่ต้องการ 
#     # คลิกที่รูปสินค้า
#     Click Element                    id:product-card-1

# ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ
#     Wait Until Element Is Visible    id:product-detail-price-thb
#     Element Text Should Be           id:product-detail-price-thb     expected=฿4,314.60

#     Element Should Contain          id:product-detail-point          expected=43 Points

# # กดaddลงตะกร้าสินค้า
# # # ควรมี login เป็นตัวคุม เพราะถ้าแต่ละคนมารันตรงนี้ก็แอดของเพิ่มไปเรื่อยๆ
# #     ## หรือไป clear ของก่อนแล้วทำให้มันเท่ากันกับเลขที่เราตั้ง
    
# #     ## กด add ของเข้า cart
# #     Click Button                     id:product-detail-add-to-cart-btn

# ตรวจสอบจำนวนสิ้นค้าในตระกร้าว่าตรงกับที่เลือกไหม
#     ## เช็คที่ cart ว่ามีกี่ catagory = 1 
#     Element Text Should Be             id:header-menu-cart-badge       expected=1

# ตรวจสอบราคาสินค้าและจำนวนแต้มที่จะได้รับ
#     # 11ชิ้น
#     Element Text Should Be             id:product-1-quantity-input     expected=11
#     # ราคารวม 4,314.60*11
#     Element Text Should Be             id:product-1-price     expected=47,460.60
#     # point รวม
#     Element Text Should Be             id:product-1-point     expected=474 Points
#     # click checkout
#     Click Button                     id:shopping-cart-checkout-btn


### by pass การจะทำแบบนี้ ไม่ควร เพราะ ต้องเช็คว่า browser มันจำค่าต่างๆ ไหม ถ้าไม่จำ มันจะทำแบบนี้ไม่ได้
Open Checkout
    Open Browser    url=${CHECKOUT_URL}    browser=${BROWSER}

ตรวจสอบราคาสินค้าคุยบัญชีแล้วเอาทางขวา
    Wait Until Element Is Visible    id:product-1-price  
    # ราคาซ้าย
    Element Text Should Be              id:product-1-price                     expected=฿474,606.00
    # ราคาขวา
    Element Text Should Be              id:order-summary-subtotal-price        expected=฿474,605.69
    # ตรวจสอบราคา point
    Element Text Should Be              idorder-summary-receive-point-price    expected=4,746
    ## เหลือตรวจสอบค่า shipping free ตามที่เรียกอีก แต่ไปกรอกข้อมูลก่อนว่าจะเอายังไง

กรอกข้อมูลการส่งสินค้า
    Input Text                          id:shipping-form-first-name-input      text=Thanawat
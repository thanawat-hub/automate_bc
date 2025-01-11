from selenium import webdriver

# from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


import time
import re

# ref full windows:
# https://stackoverflow.com/questions/12698843/how-do-i-pass-options-to-the-selenium-chrome-driver-using-python
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--start-maximized")
driver = webdriver.Chrome(chrome_options) # เอา path ออก ถ้า set ใน env system แล้ว #ก็ไม่ต้องมี parameter นี้ => executable_path=r"..\..\..\chromedriver-win64\chromedriver.exe"
driver.get("https://www.allonline.7eleven.co.th/?gad_source=1&gclid=CjwKCAiAp4O8BhAkEiwAqv2UqGhxOp7oe0NqDIWK9LLGZPwjdX5vBmg0orxiOKyvUK7edYlTdVgfJBoCUHkQAvD_BwE")

wait = WebDriverWait(driver, 3)
search_bar = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="search_id_form"]/div/div[1]/input')))

search_query = "ไฟล์ไลน์" # เขาเรียกว่า test data
search_bar.send_keys(search_query)
search_bar.submit()

print(f"Searching for: {search_query}")

### สังเกตว่า ตอน copy XPATH มามันจะไม่มี H1 => "//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/h1/text()"
# check = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="page"]/div[2]/div[2]/div/div/div[2]/0div/div/div/h1/text()')))
# print("text()",check) # ไม่มีเพราะ text() ต้องแก้เป็นh1

# รอให้ h1 ปรากฏ
# check_H1 = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/h1')))
# print("H1",check_H1)
#
# # ดึงข้อความใน h1
# text_content = check_H1.text
# print("ใช้ regex จาก text 'ผลการค้นหาสำหรับ »ไฟล์ไลน์« (88 สินค้า)' ")
# # regex ดึงข้อความใน >> << และ ()
# match = re.search(r'»(.*?)«.*\((.*?)\)', text_content)
#
# # แยกข้อความออกเป็นสองตัวแปร
# inside_arrows = match.group(1) if match else None
# inside_parentheses = match.group(2) if match else None
#
# cross_check = 'ไฟล์ไลน์'
# try:
#     assert inside_arrows == cross_check
#     print('inside_arrows pass')
#
# except AssertionError:
#     print("Test find {0} Failed".format(cross_check))
#
# print("สินค้าทั้งหมด คือออ => :", inside_parentheses)
#
# ex_result_2 = "88 สินค้า"
# try:
#     print(inside_parentheses)
#     assert inside_parentheses == ex_result_2
#     print("inside_parentheses pass")
# except AssertionError:
#     print("Test {0} Failed".format(ex_result_2))


## --


check_H1 = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[4]/div/a[2]/div')))
print("H1",check_H1)

print("H1 .text",check_H1.text)


time.sleep(5) # ไม่ควรใช้
driver.quit() # และถ้ามีอะไร error จะหลุดออกก่อนเลย
# ตรวจ cross check ว่า search ถูกไหม = ต้องหาตำแหน่ง
# แล้วทำ next action เช่น หาสินค้าคงเหลือ
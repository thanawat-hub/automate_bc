from selenium import webdriver
import time

driver = webdriver.Chrome() # เอา path ออก ถ้า set ใน env system แล้ว #ก็ไม่ต้องมี parameter นี้ => executable_path=r"..\..\..\chromedriver-win64\chromedriver.exe"
driver.get("https://www.google.com")

search_bar = driver.find_element("name", "q")

search_bar.send_keys("Hello")
search_bar.submit()

time.sleep(5)
driver.quit()
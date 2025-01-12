from selenium import webdriver

from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import time

driver = webdriver.Chrome() # เอา path ออก ถ้า set ใน env system แล้ว #ก็ไม่ต้องมี parameter นี้ => executable_path=r"..\..\..\chromedriver-win64\chromedriver.exe"
driver.get("https://www.google.com/")

# search_bar = driver.find_element("name", "q")
# search_bar = driver.find_element("xpath", '//*[@id="APjFqb"]')
# print("Search bar is ready.")

# search_bar.send_keys("Hello")
# search_bar.submit() # == enter

# =======================
# print(dir(driver))
# =======================
# time.sleep(3) # ไม่ควรใช้ในระบบ นอกจากจะ debug หรือเว็บช้าจริงๆ
# =======================

# ใช้ Explicit Wait เพื่อรอให้ Search Bar ปรากฏ
wait = WebDriverWait(driver, 3)
# search_bar = wait.until(EC.presence_of_element_located((By.NAME, "q"))) # By.ID ก็ได้ google is "APjFqb"
# search_bar = wait.until(EC.presence_of_element_located((By.ID, "APjFqb")))
search_bar = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="APjFqb"]')))
# print("Search bar is ready.")

# กรอกข้อความใน Search Bar
search_query = "XPath Example"
search_bar.send_keys(search_query)
time.sleep(10) # ไม่ควรใช้
print(f"Searching for: {search_query}")
driver.quit() # และถ้ามีอะไร error จะหลุดออกก่อนเลย
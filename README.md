# automate boot camp by go soft
## Day 1
note: Im using conda env (conda activate automate_test_bc)
```
conda create -n <name_env> python=3.12 -y
conda activate <name_env>
pip install -r requirement.txt
```

run robot framework, run with arguments ใช้แค่นี้ได้เลย แค่ไปแก้ใน .robot
```commandline
robot <file_name>.robot
```

ไว้สำหรับ รันที่ ลง pip install -U robotframework-tidy เพื่อจัด format
```. 
robotidy .
```
mean (current) all file in this path 

หรือถ้าอยากดูเป็น file ก
```
robotidy {file}
```

---
## Day 2

run with parameter headless 
```commandline
robot -v BROWSER:headlesschrome google1_variable.robot
```
อธิบายเพิ่มเติม คือเติมคำใส่ {} ว่าง
robot -v {variable}:{value} {file}.robot


- หรือใช้คำสั่งย่อ โดยที่ คำสั่งในนี้ <> มันจะเป็นเหมือนเรียกเหมือน test case ใน robot framework ถ้าเราเตรียม command ไว้ในนั้น ก็จะเรียกทีเดียว และรัน command ทั้งหมดในนั้น (จริงๆ มันคือ taget command)
- บน windows ติดตั้ง make
```
make <run_robot>
```

---
## Day 3

original repo:
```commandline
https://github.com/boyone/automated-testing-2025/tree/main
```

--------
how to debug
ให้ดูที่ fail
อันนี้คือลืม load SeleniumLibrary ที่ * Settings *
```
error:
ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ              | FAIL |
No keyword with name 'Open Browser' found.
```
อันนี้คือลืม ใส่ function ใน test case
```
*** Test Cases ***
ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ
    #ใส่คำค้นหาสินค้าด้วยคำค้นหา <- ไม่มีตรงนี้
    
error:
ทดสอบซื้อสินค้าโดยจ่ายผ่าน credit_card และชำระเงินสำเร็จ              | FAIL |
Test cannot be empty.
```

ตัวทำ report ให้สวยขึ้นเป็น dashboard
ลงด้วย
```
pip install robotframework-metrics==3.7.0
```
รันด้วย 
```
robotmetrics
```
If output.xml is in the current directory จะได้ไฟล์ metrics.html
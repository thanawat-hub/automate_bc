# automate boot camp by go soft
## Day 1
note my env conda 
```
conda activate automate_test_bc
```

run robot framework, run with arguments ใช้แค่นี้ได้เลย แค่ไปแก้ใน .robot
```commandline
robot google1.robot
```

ไว้สำหรับ รันที่ ลง pip install -U robotframework-tidy เพื่อจัด format
```. mean (current) all file in this path 
robotidy .
```

```หรือถ้าอยากดูเป็น file ก็ใช้ 
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


หรือใช้คำสั่งย่อ
```
make run_robot
```

---
## Day 3


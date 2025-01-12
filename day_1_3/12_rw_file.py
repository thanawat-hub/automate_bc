# ตัวอย่างที่ 12: การทดสอบฟังก์ชันการจัดการไฟล์(File Operations)
def read_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()


def write_file(file_path, content):
    with open(file_path, 'w') as file:
        file.write(content)


print("\nFile Operations Tests:")
test_file = "test_file.txt"
try:
    write_file(test_file, "Hello, Automated Testing!")
    content = read_file(test_file)
    assert content == "Hello, Automated Testing!"
    print("Test 1 Passed: File read and write successful")
except AssertionError:
    print("Test 1 Failed")
finally:
    import os

    if os.path.exists(test_file):
        os.remove(test_file)

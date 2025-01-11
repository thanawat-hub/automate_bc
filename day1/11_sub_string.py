# ตัวอย่างที่ 11: การทดสอบฟังก์ชันค้นหาข้อความ (Substring Search)
def contains_substring(string, substring):
    return substring in string


print("\nSubstring Search Tests:")
try:
    assert contains_substring("Hello, world!", "world") == True
    print("Test 1 Passed: 'world' found in 'Hello, world!'")
except AssertionError:
    print("Test 1 Failed")
try:
    assert contains_substring("Hello, world!", "Python") == False
    print("Test 2 Passed: 'Python' not found in 'Hello, world!'")
except AssertionError:
    print("Test 2 Failed")

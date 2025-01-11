def remove_from_list(lst, item):
    if item in lst:
        lst.remove(item)
    return lst


print("\nList Operations Tests:")
my_list = [1, 2, 3]
# my_list = [1, 2, 3, 4]#pass
# ทดสอบฟังก์ชัน remove_from_list
try:
    assert remove_from_list(my_list, 2) == [1, 3, 4]
    print("Test 2 Passed: Removed 2 from [1, 3, 4]")
except AssertionError:
    print("Test 2 Failed")

 # Ctrl + Alt + L => จัด indentation in pycharm
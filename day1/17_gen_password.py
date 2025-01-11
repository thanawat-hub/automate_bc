import random
import string
import time


def generate_password(length):
    if length < 6:
        raise ValueError("Password must be at least 6 characters")

    # Generate password components
    upper_case = random.choice(string.ascii_uppercase)
    special_char = random.choice(string.punctuation)
    digit = random.choice(string.digits)

    # Generate the remaining characters
    remaining_length = length - 3
    remaining_chars = random.choices(string.ascii_letters + string.digits + string.punctuation, k=remaining_length)

    # Combine everything
    password = upper_case + special_char + digit + ''.join(remaining_chars)

    # Shuffle the password to ensure randomness
    password = ''.join(random.sample(password, len(password)))

    return password


# Timer to measure performance
start_time = time.time()

# Run tests
print("\nPassword Generation Tests:")
try:
    # password = generate_password(8)
    password = 'Selenium@123'
    assert len(password) >= 8
    assert any(c.isupper() for c in password)  # Check for uppercase letter
    assert any(c in string.punctuation for c in password)  # Check for special character
    assert any(c.isdigit() for c in password)  # Check for digit
    print(f"Test 1 Passed: Password '{password}' generated with length 8")
except AssertionError:
    print("Test 1 Failed")

try:
    generate_password(4)
except ValueError as e:
    assert str(e) == "Password must be at least 6 characters"
    print("Test 2 Passed: Error for short password length")

# Test 3: At least one uppercase letter
try:
    password = generate_password(12)
    assert any(c.isupper() for c in password)  # Check for at least one uppercase letter
    print(f"Test 3 Passed: Password '{password}' contains at least one uppercase letter")
except AssertionError:
    print("Test 3 Failed")

# Test 4: At least one special character
try:
    password = generate_password(12)
    assert any(c in string.punctuation for c in password)  # Check for at least one special character
    print(f"Test 4 Passed: Password '{password}' contains at least one special character")
except AssertionError:
    print("Test 4 Failed")

# Test 5: At least one digit
try:
    password = generate_password(12)
    assert any(c.isdigit() for c in password)  # Check for at least one digit
    print(f"Test 5 Passed: Password '{password}' contains at least one digit")
except AssertionError:
    print("Test 5 Failed")

# Timer output
end_time = time.time()
print(f"\nTime taken to generate password: {end_time - start_time:.4f} seconds")

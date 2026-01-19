# Basic Syntax

Python's basic syntax is designed for readability and simplicity, making it a popular choice for beginners.

## Key Aspects

*   **Indentation:** Python uses indentation (typically four spaces) to define code blocks for functions, loops, conditional statements, and classes. Consistent indentation is mandatory.
*   **Comments:**
    *   Single-line comments begin with a hash symbol (`#`).
    *   Multi-line comments can be created using triple single quotes (`''' '''`) or triple double quotes (`""" """`).
*   **Variables:** Python is dynamically typed; you don't need to explicitly declare the type of a variable. Variables are created when you assign a value to them.
*   **Identifiers:** Names for variables, functions, classes, etc., must start with a letter (A-Z, a-z) or an underscore (`_`), followed by letters, numbers, or underscores. Python is case-sensitive.
*   **Keywords:** Python has reserved keywords (e.g., `if`, `else`, `for`, `def`) that cannot be used as identifiers.
*   **Statements:**
    *   **`print()` function:** Used to display output to the console.
    *   **Conditional Statements:** `if`, `elif` (else if), and `else` are used for control flow based on conditions.
    *   **Loops:** `for` and `while` loops are used for repeating blocks of code.
    *   **Functions:** Defined using the `def` keyword, functions are reusable blocks of code.

## Example

```python
# This is a single-line comment

'''
This is a multi-line comment
using single quotes
'''

"""
This is also a multi-line comment
using double quotes
"""

# Variable assignment
name = "Alice"
age = 30

# Print statement
print(f"Hello, {name}! You are {age} years old.")

# Conditional statement
if age >= 18:
    print("You are an adult.")
else:
    print("You are a minor.")

# For loop
for i in range(3):
    print(f"Loop iteration: {i}")

# Function definition
def greet(person_name):
    return f"Greetings, {person_name}!"

print(greet("Bob"))
```

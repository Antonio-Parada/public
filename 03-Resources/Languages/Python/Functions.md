# Functions

Functions are blocks of reusable code that perform a specific task. They help in organizing code, making it more modular, readable, and maintainable.

## Defining Functions

Functions are defined using the `def` keyword, followed by the function name, parentheses `()`, and a colon `:`. The code block for the function is indented.

```python
def greet(name):
    """This function greets the person passed in as a parameter.
    """
    print(f"Hello, {name}!")

greet("Alice") # Calling the function
```

## Function Arguments

Functions can accept arguments (parameters) to operate on. These can be:

*   **Positional Arguments**: Passed in order.
*   **Keyword Arguments**: Passed with `key=value` syntax, allowing for out-of-order passing.
*   **Default Arguments**: Arguments with a default value if not provided.
*   **Arbitrary Arguments (`*args` and `**kwargs`)**: For an unknown number of arguments.

```python
def describe_person(name, age, city="New York"):
    print(f"{name} is {age} years old and lives in {city}.")

# Positional arguments
describe_person("Bob", 30)

# Keyword arguments
describe_person(age=25, name="Charlie")

# Default argument
describe_person("David", 40)

# Arbitrary positional arguments (*args)
def sum_all(*numbers):
    return sum(numbers)

print(sum_all(1, 2, 3, 4))

# Arbitrary keyword arguments (**kwargs)
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="Eve", occupation="Engineer")
```

## Return Values

Functions can return values using the `return` statement. If no `return` statement is present, the function implicitly returns `None`.

```python
def add(a, b):
    return a + b

result = add(5, 3)
print(f"Sum: {result}")

def do_nothing():
    pass # This function implicitly returns None

print(do_nothing())
```

## Docstrings

Functions can have docstrings (documentation strings) to explain their purpose, arguments, and return values. These are enclosed in triple quotes and can be accessed using `function_name.__doc__` or `help(function_name)`.

```python
def multiply(x, y):
    """Multiplies two numbers and returns the result.

    Args:
        x (int): The first number.
        y (int): The second number.

    Returns:
        int: The product of x and y.
    """
    return x * y

print(multiply.__doc__)
help(multiply)
```
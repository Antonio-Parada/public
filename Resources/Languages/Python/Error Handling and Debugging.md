# Error Handling and Debugging

Robust error handling and effective debugging are crucial for developing reliable and maintainable Python applications. This note covers best practices and practical examples for both.

## Error Handling

Error handling in Python primarily involves `try`, `except`, `else`, and `finally` blocks, along with raising custom exceptions. The goal is to gracefully manage unexpected situations and prevent your program from crashing.

### 1. Keep `try` Blocks Focused

Limit the code within a `try` block to only the statements that might raise an exception. This makes it easier to pinpoint the exact source of an error and apply specific handling.

```python
def process_data_source(data_source_path):
    try:
        # Only the potentially error-prone file opening is in the try block
        with open(data_source_path, "r") as file:
            content = file.read()
        return content
    except FileNotFoundError:
        print(f"Error: The data source '{data_source_path}' was not found.")
        return None

# Example usage in a workflow:
# data = process_data_source("my_data.txt")
# if data:
#     # Proceed with data processing
#     print("Data loaded successfully.")
```

### 2. Catch Specific Exceptions

Avoid using a bare `except` clause, as it catches all exceptions, including system-level ones, which can mask the true cause of issues and make debugging difficult. Instead, catch specific exception types.

```python
def safe_division(numerator, denominator):
    try:
        result = numerator / denominator
    except ZeroDivisionError:
        print("Error: Cannot divide by zero!")
        return None
    except TypeError:
        print("Error: Invalid input types. Both must be numbers.")
        return None
    except Exception as e: # Fallback for unexpected errors
        print(f"An unexpected error occurred: {e}")
        return None
    else:
        print("Division successful.")
        return result

# Real-world scenario: User input validation
# try:
#     num1 = float(input("Enter numerator: "))
#     num2 = float(input("Enter denominator: "))
#     safe_division(num1, num2)
# except ValueError:
#     print("Invalid number entered.")
```

### 3. Use `else` and `finally` Clauses

*   The `else` block executes if the `try` block completes without any exceptions. It's useful for code that should only run if no errors occurred.
*   The `finally` block always executes, regardless of whether an exception occurred or not. It's ideal for cleanup operations like closing files or releasing resources.

```python
def resource_operation(file_path):
    file = None # Initialize file to None
    try:
        file = open(file_path, "w")
        file.write("Hello, world!")
    except IOError:
        print(f"Error: Could not write to file {file_path}")
    else:
        print(f"Successfully wrote to {file_path}")
    finally:
        if file and not file.closed:
            file.close()
            print("File closed in finally block.")

# Workflow integration: Ensure resources are always cleaned up
# resource_operation("output.txt")
# resource_operation("/nonexistent/path/output.txt")
```

### 4. Raise Custom Exceptions

Define custom exception classes by inheriting from Python's built-in `Exception` class. This makes your code more readable and allows for more specific error handling tailored to your application's needs.

```python
class InvalidConfigurationError(Exception):
    """Raised when application configuration is invalid."""
    pass

def load_configuration(config_data):
    if not isinstance(config_data, dict) or "api_key" not in config_data:
        raise InvalidConfigurationError("Missing or invalid API key in configuration.")
    print("Configuration loaded successfully.")
    return config_data

# Real-world scenario: API client initialization
# try:
#     config = {"user": "test"} # Missing api_key
#     load_configuration(config)
# except InvalidConfigurationError as e:
#     print(f"Configuration Error: {e}")
```

### 5. Log Exceptions

Use Python's `logging` module to record exceptions instead of just printing error messages. This provides a more robust way to track errors, especially in production environments, and can include valuable context like timestamps and stack traces.

```python
import logging

# Configure logging (e.g., to a file)
logging.basicConfig(level=logging.ERROR, filename='application.log',
                    format='%(asctime)s - %(levelname)s - %(message)s')

def process_transaction(amount, currency):
    try:
        if amount <= 0:
            raise ValueError("Transaction amount must be positive.")
        # Simulate some processing that might fail
        result = 100 / amount
        print(f"Transaction processed: {result}")
    except ValueError as e:
        logging.error(f"Validation Error in transaction: {e}")
    except ZeroDivisionError as e:
        logging.error("Attempted to divide by zero in transaction.", exc_info=True) # exc_info=True logs traceback
    except Exception as e:
        logging.exception("An unhandled error occurred during transaction processing.") # Logs error and traceback

# Workflow: Centralized error logging for monitoring
# process_transaction(0, "USD")
# process_transaction(10, "USD")
```

### 6. Use Exception Chaining

When re-raising an exception from an `except` block, use the `from` keyword to preserve the original traceback. This helps in debugging by showing the full chain of exceptions, which is invaluable for understanding complex error flows.

```python
def fetch_from_api(endpoint):
    try:
        # Simulate a low-level network error
        raise ConnectionError(f"Failed to connect to {endpoint}")
    except ConnectionError as e:
        # Re-raise a higher-level exception, preserving the original cause
        raise RuntimeError(f"Could not retrieve data from {endpoint}.") from e

# Workflow: Debugging complex system interactions
# try:
#     fetch_from_api("http://api.example.com/data")
# except RuntimeError as e:
#     print(f"Caught application error: {e}")
#     if e.__cause__:
#         print(f"Original cause: {e.__cause__}")
#         # Log e.__cause__ for deeper analysis
```

## Debugging

Debugging involves identifying and fixing issues in your code. Effective debugging strategies can significantly reduce development time.

### 1. Read Error Messages (Stack Traces) Carefully

When Python encounters an unhandled error, it provides a traceback (stack trace). This is your most important debugging tool. Read it carefully:
*   The **last line** usually indicates the error type and message.
*   Read from the **bottom up** to see the sequence of function calls that led to the error, including file names and line numbers.

```python
# Example of a traceback (simulated output):
# Traceback (most recent call last):
#   File "my_app.py", line 10, in <module>
#     main_function()
#   File "my_app.py", line 5, in main_function
#     result = calculate_value(0)
#   File "my_app.py", line 2, in calculate_value
#     return 10 / x
# ZeroDivisionError: division by zero

# Interpretation: The error is ZeroDivisionError, caused by division by zero.
# It happened in calculate_value on line 2, which was called by main_function on line 5,
# which was called from the main script on line 10.
```

### 2. Use `print()` Statements (Strategically)

Simple `print()` statements are effective for quickly inspecting variable values and tracing the flow of execution. For better clarity, add context to your print statements.

```python
def process_list_items(items):
    print(f"DEBUG: Input items: {items}")
    processed_items = []
    for item in items:
        print(f"DEBUG: Processing item: {item}")
        try:
            processed_items.append(item * 2)
        except TypeError:
            print(f"DEBUG: Skipping non-numeric item: {item}")
            processed_items.append(None)
    print(f"DEBUG: Processed items: {processed_items}")
    return processed_items

# Workflow: Quick inspection during development
# process_list_items([1, 2, "a", 4])
```

### 3. Leverage the `logging` Module

For more sophisticated debugging and monitoring, especially in larger applications, use the `logging` module. It allows you to categorize messages by severity (DEBUG, INFO, WARNING, ERROR, CRITICAL) and direct them to various outputs (console, file, network).

```python
import logging

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

def fetch_user_data(user_id):
    logging.debug(f"Attempting to fetch data for user ID: {user_id}")
    if user_id < 0:
        logging.warning("Negative user ID provided. This might indicate an issue.")
        return None
    try:
        # Simulate fetching data
        data = {"id": user_id, "name": f"User {user_id}"}
        logging.info(f"Successfully fetched data for user ID: {user_id}")
        return data
    except Exception as e:
        logging.error(f"Failed to fetch data for user ID {user_id}: {e}")
        return None

# Workflow: Granular control over debug messages in different environments
# fetch_user_data(123)
# fetch_user_data(-1)
```

### 4. Use a Debugger (PDB or IDE Debuggers)

*   **PDB (Python Debugger):** Python's built-in debugger (`pdb`) allows you to set breakpoints, step through code line by line, inspect variables, and modify them interactively. You can start it by adding `import pdb; pdb.set_trace()`.
    *   **Common PDB commands:** `n` (next line), `c` (continue), `q` (quit), `p <variable>` (print variable value), `b <line_number>` (set breakpoint).
*   **IDE Debuggers:** Integrated Development Environments (IDEs) like PyCharm, VS Code, or Thonny offer powerful built-in debuggers with graphical interfaces. They allow you to set breakpoints by clicking, step through code, watch variable values, and inspect the call stack.

```python
import pdb

def calculate_complex_expression(a, b, c):
    intermediate_sum = a + b
    # Set a breakpoint here to inspect intermediate_sum
    # pdb.set_trace()
    final_result = intermediate_sum * c
    return final_result

# Workflow: Deep dive into execution flow and variable states
# result = calculate_complex_expression(10, 5, 2)
# print(result)
```

### 5. Use `assert` Statements for Sanity Checks

`assert` statements allow you to enforce conditions that you assume to be true at a certain point in your code. If the condition is false, an `AssertionError` is raised, indicating a logical flaw. Use `assert` for debugging and development, but avoid using it for regular error handling in production code.

```python
def process_user_input(user_data):
    assert isinstance(user_data, dict), "Input must be a dictionary."
    assert "username" in user_data, "Username key is missing."
    assert len(user_data["username"]) > 0, "Username cannot be empty."

    # ... rest of the processing
    print(f"Processing data for user: {user_data['username']}")

# Workflow: Early detection of invalid assumptions during development/testing
# process_user_input({"username": ""}) # This will raise an AssertionError
```

### 6. Understand Variable Scope

Issues with variable scope (global vs. local) can lead to unexpected behavior. Be mindful of how variables are defined and accessed within functions and different parts of your code. Debuggers and print statements can help visualize scope.

### 7. Rubber Duck Debugging

Explain your code line by line, either to another person or an inanimate object (like a rubber duck). Verbally articulating your logic often helps you spot inconsistencies or mistakes you might have overlooked.

By combining these error handling and debugging techniques, you can write more robust Python code and efficiently identify and resolve issues in your projects.
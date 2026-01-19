# Control Flow

Control flow statements dictate the order in which a Python program's code executes.

## Key Control Flow Statements

*   **`if`, `elif`, `else` Statements**: Used for conditional execution.

    ```python
    # if-elif-else example
    x = 10
    if x > 10:
        print("x is greater than 10")
    elif x < 10:
        print("x is less than 10")
    else:
        print("x is 10")
    ```

*   **`for` Statements**: Used for iterating over sequences (e.g., lists, strings, tuples).

    ```python
    # for loop example
    fruits = ["apple", "banana", "cherry"]
    for fruit in fruits:
        print(fruit)

    # Using range()
    for i in range(3):
        print(f"Iteration {i}")
    ```

*   **`while` Statements**: Used for repeated execution as long as a condition is true.

    ```python
    # while loop example
    count = 0
    while count < 3:
        print(f"Count: {count}")
        count += 1
    ```

*   **`break` and `continue` Statements**: 
    *   `break`: Immediately exits the current loop.
    *   `continue`: Skips the rest of the current iteration and proceeds to the next.

    ```python
    # break and continue example
    for i in range(5):
        if i == 2:
            continue  # Skip 2
        if i == 4:
            break     # Exit loop at 4
        print(i)
    ```

*   **`else` Clauses on Loops**: An `else` clause can be paired with `for` or `while` loops and executes if the loop completes without encountering a `break` statement.

    ```python
    # for-else example
    for i in range(3):
        print(i)
    else:
        print("Loop finished without break")

    # while-else example
    count = 0
    while count < 2:
        print(count)
        count += 1
    else:
        print("While loop finished without break")
    ```

*   **`pass` Statements**: A null operation; it does nothing and can be used as a placeholder.

    ```python
    # pass example
    def my_function():
        pass # TODO: Implement this function later
    ```

*   **`match` Statements (Python 3.10+)**: For structural pattern matching.

    ```python
    # match example (Python 3.10+)
    status = "success"

    match status:
        case "success":
            print("Operation successful")
        case "error":
            print("Operation failed")
        case _:
            print("Unknown status")
    ```

*   **`try...except` Blocks**: For exception handling.

    ```python
    # try-except example
    try:
        result = 10 / 0
    except ZeroDivisionError:
        print("Cannot divide by zero!")
    ```
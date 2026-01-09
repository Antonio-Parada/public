# Data Types

Python categorizes data types into several principal built-in types, including numerics, sequences, mappings, classes, instances, and exceptions.

## Main Built-in Data Types

*   **Numeric Types**: Represent numbers.
    *   `int`: Integers (e.g., `10`, `-5`).
    *   `float`: Floating-point numbers (e.g., `3.14`, `-0.5`).
    *   `complex`: Complex numbers (e.g., `1 + 2j`).
    *   `bool`: Booleans (`True` or `False`), a subtype of integers.

    ```python
    # Numeric Examples
    integer_var = 10
    float_var = 3.14
    complex_var = 1 + 2j
    boolean_var = True
    print(f"Integer: {integer_var}, Type: {type(integer_var)}")
    print(f"Float: {float_var}, Type: {type(float_var)}")
    print(f"Complex: {complex_var}, Type: {type(complex_var)}")
    print(f"Boolean: {boolean_var}, Type: {type(boolean_var)}")
    ```

*   **Sequence Types**: Ordered collections of items.
    *   **Text Sequence Type**: `str` (strings) for Unicode characters.
    *   **Immutable Sequences**: `tuple` (ordered, unchangeable) and `range` (sequence of numbers).
    *   **Mutable Sequences**: `list` (ordered, changeable).

    ```python
    # Sequence Examples
    string_var = "Hello Python"
    list_var = [1, 2, 3]
    tuple_var = (4, 5, 6)
    range_var = range(3)
    print(f"String: {string_var}, Type: {type(string_var)}")
    print(f"List: {list_var}, Type: {type(list_var)}")
    print(f"Tuple: {tuple_var}, Type: {type(tuple_var)}")
    print(f"Range: {list(range_var)}, Type: {type(range_var)}")
    ```

*   **Binary Sequence Types**: Used to hold binary data.
    *   `bytes`
    *   `bytearray`
    *   `memoryview`

*   **Set Types**: Unordered collections of unique items.
    *   `set` (mutable)
    *   `frozenset` (immutable)

    ```python
    # Set Examples
    set_var = {1, 2, 3, 3}
    frozenset_var = frozenset([4, 5, 5])
    print(f"Set: {set_var}, Type: {type(set_var)}")
    print(f"Frozenset: {frozenset_var}, Type: {type(frozenset_var)}")
    ```

*   **Mapping Types**: `dict` (dictionaries) store data in key-value pairs.

    ```python
    # Dictionary Example
    dict_var = {"name": "Alice", "age": 30}
    print(f"Dictionary: {dict_var}, Type: {type(dict_var)}")
    ```

## Specialized Data Types

Python also offers specialized data types through modules, such as `datetime` for dates and times, and `collections` for container datatypes (e.g., `ChainMap`, `Counter`, `deque`, `defaultdict`, `namedtuple`, `OrderedDict`).
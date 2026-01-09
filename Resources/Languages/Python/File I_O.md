# File Input/Output (I/O)

Python provides built-in functions and methods for handling file input and output operations. The `open()` function is central to file operations, allowing you to open files in various modes (read, write, append, binary, etc.). It's highly recommended to use the `with` statement when working with files, as it ensures the file is automatically closed even if errors occur.

## 1. Writing to a File

To write content to a file, you typically open it in write mode (`"w"`) or append mode (`"a"`).

### Write Mode (`"w"`)

This mode creates a new file if it doesn't exist. If the file already exists, it truncates (empties) the file before writing.

```python
# Open a file in write mode ("w")
with open("example_write.txt", "w") as file:
    file.write("Hello, Python!\n")
    file.write("This is a new line.\n")
print("Content written to example_write.txt (overwriting any existing content).")
```

### Append Mode (`"a"`)

This mode also creates a new file if it doesn't exist. If the file exists, new content is added to the end of the file without overwriting existing data.

```python
# Open a file in append mode ("a")
with open("example_append.txt", "a") as file:
    file.write("This line is appended.\n")
    file.write("Another appended line.\n")
print("Content appended to example_append.txt.")
```

### Writing Multiple Lines (`writelines()`)

You can write a list of strings to a file using `writelines()`. Note that `writelines()` does not automatically add newline characters, so you need to include them in your strings.

```python
lines_to_write = [
    "First line from writelines.\n",
    "Second line from writelines.\n",
    "Third line from writelines.\n"
]
with open("example_writelines.txt", "a") as file:
    file.writelines(lines_to_to_write)
print("Multiple lines written using writelines().")
```

## 2. Reading from a File

To read content from a file, you typically open it in read mode (`"r"`).

### Read Entire File (`read()`)

This method reads the entire content of the file as a single string.

```python
# Create a file for reading example
with open("example_read.txt", "w") as f:
    f.write("Line 1\nLine 2\nLine 3")

# Open a file in read mode ("r")
with open("example_read.txt", "r") as file:
    content = file.read()
    print("\nContent of example_read.txt (read all at once):")
    print(content)
```

### Read Line by Line (`readline()`)

This method reads a single line from the file, including the newline character.

```python
with open("example_read.txt", "r") as file:
    print("\nContent of example_read.txt (read line by line):")
    line1 = file.readline()
    line2 = file.readline()
    print(f"Line 1: {line1.strip()}") # .strip() removes leading/trailing whitespace, including newline
    print(f"Line 2: {line2.strip()}")
```

### Read All Lines into a List (`readlines()`)

This method reads all lines of the file and returns them as a list of strings, where each string represents a line (including the newline character).

```python
with open("example_read.txt", "r") as file:
    lines = file.readlines()
    print("\nContent of example_read.txt (read all lines into a list):")
    for line in lines:
        print(line.strip())
```

### Iterating Through a File Object

A common and efficient way to read a file line by line is to iterate directly over the file object.

```python
with open("example_read.txt", "r") as file:
    print("\nContent of example_read.txt (iterating over file object):")
    for line in file:
        print(line.strip())
```

## 3. File Modes

The `open()` function takes a `mode` argument to specify how the file will be used. Some common modes include:

*   `"r"`: Read (default mode).
*   `"w"`: Write (creates a new file or truncates an existing one).
*   `"a"`: Append (creates a new file or appends to an existing one).
*   `"x"`: Exclusive creation (creates a new file, but raises an error if the file already exists).
*   `"b"`: Binary mode (e.g., `"rb"` for read binary, `"wb"` for write binary). Used for non-text files like images or executables.
*   `"t"`: Text mode (default).

You can combine modes, for example, `"r+"` for reading and writing, or `"w+"` for writing and reading (truncates first).

## 4. The `with` Statement (Recommended)

Using the `with` statement is the recommended way to handle file operations in Python. It ensures that the file is properly closed after its block is exited, even if an error occurs. This prevents resource leaks.

```python
# Without 'with' (requires explicit file.close())
file = open("my_file_without_with.txt", "w")
try:
    file.write("Hello from without 'with'!\n")
finally:
    file.close()

# With 'with' (recommended)
with open("my_file_with_with.txt", "a") as file:
    file.write("Hello from 'with' statement!\n")
# File is automatically closed here
```
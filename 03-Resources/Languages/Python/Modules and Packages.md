# Modules and Packages

In Python, modules and packages are fundamental concepts for organizing and structuring code, promoting reusability and maintainability.

## Modules

A **module** is a single file containing Python code (with a `.py` extension). It can include functions, classes, variables, and executable statements. Modules allow you to logically organize your code and avoid naming conflicts by providing a self-contained unit of code.

### Example: `my_module.py`

```python
# my_module.py
def greet(name):
    return f"Hello, {name}!"

my_variable = "This is a module variable"
```

### Importing a Module

```python
# main.py
import my_module

print(my_module.greet("Alice"))
print(my_module.my_variable)

from my_module import greet, my_variable
print(greet("Bob"))
print(my_variable)
```

## Packages

A **package** is a way to organize related modules into a directory hierarchy. It's essentially a folder that contains one or more Python module files and, crucially, a special file named `__init__.py`. This `__init__.py` file (which can be empty) signals to Python that the directory should be treated as a package. Packages allow for a hierarchical structuring of the module namespace using "dotted module names" (e.g., `package.module`).

### Example: Package Structure

```
my_package/
├── __init__.py
├── module_a.py
└── sub_package/
    ├── __init__.py
    └── module_b.py
```

### Example: `my_package/module_a.py`

```python
# my_package/module_a.py
def function_a():
    return "Function A from module_a"
```

### Example: `my_package/sub_package/module_b.py`

```python
# my_package/sub_package/module_b.py
def function_b():
    return "Function B from module_b"
```

### Importing from a Package

```python
# main.py
import my_package.module_a
print(my_package.module_a.function_a())

from my_package.sub_package import module_b
print(module_b.function_b())

from my_package.module_a import function_a
print(function_a())
```

## Key Aspects

*   **Organization and Reusability:** Modules break down large programs, and packages group related modules, making code easier to manage and reuse.
*   **Importing:** Use `import` statements (e.g., `import my_module`, `from my_package import my_module`).
*   **Module Search Path:** Python looks for modules and packages in directories listed in the `sys.path` variable.
*   **Standard Library:** Python comes with a rich standard library of modules and packages.
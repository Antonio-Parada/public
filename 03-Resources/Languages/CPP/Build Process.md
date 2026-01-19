# C++ Build Process

C++ is a compiled language, meaning source code must be translated into machine code by a compiler before it can be executed.

## Header and Source Files
*   **Header Files (`.h` or `.hpp`):** Contain declarations of functions, classes, and variables. They are included in source files using `#include`.
*   **Source Files (`.cpp`):** Contain the definitions (implementations) of the functions and classes declared in the header files.

## Compilation and Linking
The build process generally involves two main stages:

1.  **Compilation:** The compiler takes each `.cpp` source file and translates it into an object file (`.o` or `.obj`). The object file contains machine code but is not yet a complete executable.
2.  **Linking:** The linker takes all the object files, along with any required libraries, and combines them to produce a single executable file.

## Example using `g++`

```bash
# Compile main.cpp into an object file main.o
g++ -c main.cpp -o main.o

# Compile another_file.cpp into another_file.o
g++ -c another_file.cpp -o another_file.o

# Link the object files to create an executable named 'my_app'
g++ main.o another_file.o -o my_app

# Run the application
./my_app
```

This process is typically automated using build systems like `make`, `CMake`, or an IDE.

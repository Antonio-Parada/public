# C++ Functions

Functions in C++ are blocks of code that perform a specific task.

## Declaration and Definition
A function must be declared before it is used. The declaration (prototype) specifies the function's name, return type, and parameters. The definition contains the actual code.

```cpp
#include <iostream>

// Declaration (prototype)
int add(int a, int b);

int main() {
    int result = add(5, 3);
    std::cout << "Result: " << result << std::endl;
    return 0;
}

// Definition
int add(int a, int b) {
    return a + b;
}
```

## Parameters
C++ supports passing parameters by value, by reference (`&`), and by pointer (`*`).

## Function Overloading
Multiple functions can have the same name as long as their parameter lists are different. This is known as function overloading.

```cpp
int add(int a, int b) { return a + b; }
double add(double a, double b) { return a + b; }
```

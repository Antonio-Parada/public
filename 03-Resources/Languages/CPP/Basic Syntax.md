# C++ Basic Syntax

C++ is a statically-typed, compiled language. Its syntax is derived from C.

## Hello, World!
A basic C++ program includes the `<iostream>` header for input/output and a `main` function.

```cpp
#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
```

## Variables and Types
Variables must be declared with a specific type before they are used.

```cpp
int myInteger = 10;
double myDouble = 3.14;
char myChar = 'a';
bool myBool = true;
std::string myString = "Hello C++";
```

## Comments

```cpp
// This is a single-line comment.

/*
This is a multi-line comment.
*/
```

## Namespaces
The `std` namespace is where the standard library functions and objects are located. `using namespace std;` can be used to avoid prefixing with `std::`.

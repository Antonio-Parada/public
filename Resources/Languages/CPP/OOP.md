# C++ Object-Oriented Programming (OOP)

C++ is a multi-paradigm language that fully supports object-oriented programming.

## Classes and Objects
A class is a blueprint for creating objects. An object is an instance of a class.

```cpp
#include <iostream>

class Dog {
public:
    // Constructor
    Dog(std::string name) : dogName(name) {}

    // Method
    void bark() {
        std::cout << dogName << " says Woof!" << std::endl;
    }

private:
    std::string dogName;
};

int main() {
    Dog myDog("Buddy");
    myDog.bark();
    return 0;
}
```

## Core OOP Concepts

*   **Inheritance:** A class can inherit properties and methods from another class.
*   **Polymorphism:** Objects of different classes can be treated as objects of a common parent class. Often achieved using virtual functions.
*   **Encapsulation:** Bundling data and methods within a class, hiding internal details using access specifiers (`public`, `protected`, `private`).
*   **Abstraction:** Hiding complex implementation details and exposing only the necessary features.

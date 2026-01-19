# C++ Templates

Templates are a fundamental feature of C++ that allow functions and classes to operate with generic types. This enables writing flexible and reusable code that is not tied to a single data type, a practice known as generic programming.

## Function Templates
A function template is a blueprint for creating functions. The compiler generates the actual function based on the types used when the function is called.

```cpp
#include <iostream>

template <typename T>
T add(T a, T b) {
    return a + b;
}

int main() {
    // The compiler generates an int version of add()
    std::cout << "Int sum: " << add(5, 3) << std::endl;

    // The compiler generates a double version of add()
    std::cout << "Double sum: " << add(5.5, 3.3) << std::endl;
    return 0;
}
```

## Class Templates
Similar to function templates, class templates are blueprints for creating classes that can work with any data type.

The C++ Standard Template Library ([[STL/STL]]) is built entirely on templates, with containers like `std::vector<T>` and `std::map<K, V>` being class templates.

```cpp
#include <iostream>

template <class T>
class MyPair {
    T a, b;
public:
    MyPair(T first, T second) {
        a = first;
        b = second;
    }
    T getmax();
};

template <class T>
T MyPair<T>::getmax() {
    return (a > b ? a : b);
}

int main() {
    MyPair<int> myobject(100, 75);
    std::cout << "Max: " << myobject.getmax() << std::endl;
    return 0;
}
```

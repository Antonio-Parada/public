# C++ Data Structures

C++ provides a rich set of data structures in its Standard Template Library (STL).

## `std::vector`
A dynamic array that can grow and shrink in size.

```cpp
#include <vector>
#include <iostream>

int main() {
    std::vector<int> myVector = {1, 2, 3};
    myVector.push_back(4);
    for (int i : myVector) {
        std::cout << i << " ";
    }
    return 0;
}
```

## `std::map`
A collection of key-value pairs, sorted by key.

```cpp
#include <map>
#include <iostream>

int main() {
    std::map<std::string, int> myMap;
    myMap["one"] = 1;
    myMap["two"] = 2;
    std::cout << "Value for key 'one': " << myMap["one"] << std::endl;
    return 0;
}
```

## `struct`
A composite data type that groups variables under a single name.

```cpp
#include <iostream>
#include <string>

struct Person {
    std::string name;
    int age;
};

int main() {
    Person p1;
    p1.name = "Alice";
    p1.age = 30;
    std::cout << p1.name << " is " << p1.age << " years old." << std::endl;
    return 0;
}
```

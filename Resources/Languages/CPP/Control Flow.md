# C++ Control Flow

Control flow statements direct the order of execution in C++.

## `if-else` Statement

```cpp
int x = 10;
if (x > 15) {
    // ...
} else if (x == 10) {
    // ...
} else {
    // ...
}
```

## `for` Loop

```cpp
// Traditional for loop
for (int i = 0; i < 5; ++i) {
    // ...
}

// Range-based for loop (C++11 and later)
#include <vector>
std::vector<int> vec = {1, 2, 3};
for (int val : vec) {
    // ...
}
```

## `while` Loop

```cpp
int i = 0;
while (i < 5) {
    // ...
    i++;
}
```

## `switch` Statement

```cpp
int option = 2;
switch (option) {
    case 1:
        // ...
        break;
    case 2:
        // ...
        break;
    default:
        // ...
        break;
}
```

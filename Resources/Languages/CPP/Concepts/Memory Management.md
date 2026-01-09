# C++ Memory Management

C++ gives developers direct control over memory, which is both powerful and a source of complexity. Modern C++ emphasizes a technique called RAII (Resource Acquisition Is Initialization) to manage memory and other resources safely.

## The Stack and The Heap

*   **Stack:** Used for static memory allocation. Memory is managed automatically. Variables created on the stack are destroyed when they go out of scope. It's very fast.
    ```cpp
    void myFunction() {
        int x = 10; // Allocated on the stack
    } // x is automatically deallocated here
    ```
*   **Heap:** Used for dynamic memory allocation. Memory is allocated using `new` and must be manually deallocated using `delete`. It is more flexible but slower and requires careful management to prevent memory leaks.

## Manual Memory Management (The Old Way)

```cpp
// Allocate an integer on the heap
int* myInt = new int(20);

// ... use myInt ...

// Manually deallocate the memory
delete myInt;
```
Forgetting `delete` causes a memory leak.

## RAII and Smart Pointers (The Modern Way)
RAII is a core C++ principle stating that a resource's lifetime should be tied to the lifetime of an object. Smart pointers are classes that wrap raw pointers and implement RAII.

1.  **`std::unique_ptr`**: Represents exclusive ownership. The pointer is automatically deleted when the `unique_ptr` object goes out of scope. It cannot be copied.

    ```cpp
    #include <memory>

    void myFunction() {
        std::unique_ptr<int> myInt = std::make_unique<int>(30);
    } // Memory for myInt is automatically freed here
    ```

2.  **`std::shared_ptr`**: Represents shared ownership. It uses a reference count to track how many `shared_ptr`s point to the same object. The object is deleted only when the last `shared_ptr` is destroyed.

    ```cpp
    #include <memory>

    void myFunction() {
        std::shared_ptr<int> p1 = std::make_shared<int>(40);
        {
            std::shared_ptr<int> p2 = p1; // Both point to the same int, ref count is 2
        } // p2 is destroyed, ref count is 1
    } // p1 is destroyed, ref count is 0, memory is freed
    ```

# C# .NET Garbage Collector

The .NET Garbage Collector (GC) is an automatic memory manager that handles the allocation and release of memory for applications running on the .NET runtime. It frees developers from manually managing memory, which helps prevent common programming errors like memory leaks and invalid memory access.

## How it Works

1.  **Allocation:** When an object is created, the GC allocates memory for it from the managed heap.
2.  **Generations:** The GC uses a generational approach to optimize performance. Objects are categorized into generations (0, 1, 2) based on their lifetime. Most new objects are Generation 0. Short-lived objects are collected quickly, while longer-lived objects are promoted to higher generations.
3.  **Collection:** The GC periodically performs a collection process:
    *   It identifies objects that are no longer reachable (i.e., no longer referenced by any part of the running application).
    *   It compacts the heap by moving reachable objects together, freeing up space and reducing fragmentation.

## Benefits

*   **Automatic Memory Management:** Developers don't need to write code to free memory.
*   **Reduced Memory Leaks:** Unreachable objects are automatically reclaimed.
*   **Improved Application Stability:** Prevents common memory-related bugs.

## When GC Occurs

The GC automatically initiates a collection when:

*   The system is low on physical memory.
*   The managed heap's allocated memory exceeds an acceptable threshold.
*   The `GC.Collect()` method is explicitly called (rarely recommended in production code).

## Cross-References

*   [[CSharp/OOP]]

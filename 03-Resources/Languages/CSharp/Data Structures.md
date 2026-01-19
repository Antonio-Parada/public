# C# Data Structures

C# offers a wide variety of data structures through the .NET base class library.

## Arrays
Fixed-size collections of elements of the same type.

```csharp
string[] names = new string[3] { "Alice", "Bob", "Charlie" };
Console.WriteLine(names[0]); // Alice
```

## `List<T>`
A generic, dynamic array that can grow in size. It is the most commonly used collection.

```csharp
using System.Collections.Generic;

List<int> numbers = new List<int> { 1, 2, 3 };
numbers.Add(4);
```

## `Dictionary<TKey, TValue>`
A collection of key-value pairs, similar to a hash map.

```csharp
using System.Collections.Generic;

Dictionary<string, int> ages = new Dictionary<string, int>();
ages["Alice"] = 30;
ages["Bob"] = 35;
```

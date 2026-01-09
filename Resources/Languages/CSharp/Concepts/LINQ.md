# C# LINQ (Language-Integrated Query)

LINQ (Language-Integrated Query) is a powerful feature in C# that provides a uniform query syntax for querying data from various data sources (like collections, databases, XML documents, etc.). It allows you to write queries directly within your C# code, using a syntax similar to SQL.

## Key Concepts

*   **Query Syntax:** A SQL-like syntax for writing queries.
    ```csharp
    var result = from item in collection
                 where item.Property > value
                 orderby item.AnotherProperty
                 select item;
    ```
*   **Method Syntax (Extension Methods):** Uses extension methods on enumerable types, often chained together.
    ```csharp
    var result = collection.Where(item => item.Property > value)
                           .OrderBy(item => item.AnotherProperty);
    ```
*   **Deferred Execution:** LINQ queries are not executed until you iterate over the query variable (e.g., using `foreach`, `ToList()`, `ToArray()`). This allows for efficient processing and optimization.

## Common LINQ Operations

*   **Filtering:** `Where()`
*   **Ordering:** `OrderBy()`, `OrderByDescending()`
*   **Projection:** `Select()`
*   **Grouping:** `GroupBy()`
*   **Joining:** `Join()`

## Example

```csharp
using System;
using System.Collections.Generic;
using System.Linq;

public class Product
{
    public string Name { get; set; }
    public double Price { get; set; }
    public int CategoryId { get; set; }
}

public class LinqExample
{
    public static void Main()
    {
        List<Product> products = new List<Product>
        {
            new Product { Name = "Laptop", Price = 1200, CategoryId = 1 },
            new Product { Name = "Mouse", Price = 25, CategoryId = 2 },
            new Product { Name = "Keyboard", Price = 75, CategoryId = 2 },
            new Product { Name = "Monitor", Price = 300, CategoryId = 1 }
        };

        // Find products cheaper than $100
        var cheapProducts = from p in products
                            where p.Price < 100
                            orderby p.Name
                            select p;

        Console.WriteLine("Cheap Products:");
        foreach (var p in cheapProducts)
        {
            Console.WriteLine($"- {p.Name}: ${p.Price}");
        }
    }
}
```

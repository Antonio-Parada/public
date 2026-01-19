# C# Object-Oriented Programming (OOP)

C# is a pure object-oriented language. Everything in C# is an object, derived from the `System.Object` class.

## Classes and Objects

```csharp
public class Car
{
    // Fields
    public string model;

    // Constructor
    public Car(string modelName)
    {
        model = modelName;
    }

    // Method
    public void Honk()
    {
        Console.WriteLine("Beep!");
    }
}

// Create an object
Car myCar = new Car("Mustang");
```

## Core OOP Concepts

*   **Inheritance:** A class can inherit from a single base class.
    ```csharp
    class Vehicle { /* ... */ }
    class Car : Vehicle { /* ... */ }
    ```
*   **Polymorphism:** Achieved through `virtual` and `override` keywords for methods.
*   **Encapsulation:** Controlled using access modifiers (`public`, `private`, `protected`, `internal`).
*   **Abstraction:** Can be achieved with `abstract` classes and methods, or `interfaces`.

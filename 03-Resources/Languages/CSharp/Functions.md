# C# Methods (Functions)

In C#, functions are typically referred to as methods and are defined within classes or structs.

## Definition
A method is defined with an access modifier (e.g., `public`), a return type, a name, and a parameter list.

```csharp
public class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }
}
```

## Calling Methods
Methods are called on an instance of the class (an object).

```csharp
Calculator myCalculator = new Calculator();
int result = myCalculator.Add(5, 3);
// result is 8
```

## Parameters
C# supports passing parameters by value, by reference (`ref`), and for output (`out`).

## Method Overloading
Like C++, C# allows multiple methods to have the same name if they have different parameter lists.

```csharp
public class Greeter
{
    public void Greet(string name) { /* ... */ }
    public void Greet(string firstName, string lastName) { /* ... */ }
}
```

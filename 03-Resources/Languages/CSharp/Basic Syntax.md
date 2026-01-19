# C# Basic Syntax

C# is a statically-typed, object-oriented language developed by Microsoft. It runs on the .NET Framework.

## Hello, World!
A basic C# program uses a `class` and a `Main` method as the entry point.

```csharp
using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
        }
    }
}
```

## Variables and Types
Variables must be declared with a specific type.

```csharp
int myInteger = 10;
double myDouble = 3.14;
char myChar = 'a';
bool myBool = true;
string myString = "Hello C#";
```

## Comments

```csharp
// This is a single-line comment.

/*
This is a multi-line comment.
*/
```

## `using` Directive
The `using` directive imports namespaces, making types within them accessible without full qualification.

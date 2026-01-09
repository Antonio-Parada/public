# C# Control Flow

Control flow statements in C# are similar to other C-style languages.

## `if-else` Statement

```csharp
int x = 10;
if (x > 15)
{
    // ...
}
else if (x == 10)
{
    // ...
}
else
{
    // ...
}
```

## `for` and `foreach` Loops

```csharp
// for loop
for (int i = 0; i < 5; i++)
{
    // ...
}

// foreach loop
int[] numbers = { 1, 2, 3 };
foreach (int num in numbers)
{
    // ...
}
```

## `while` Loop

```csharp
int i = 0;
while (i < 5)
{
    // ...
    i++;
}
```

## `switch` Statement

```csharp
int option = 2;
switch (option)
{
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

# Lua Control Flow

Control flow statements in Lua manage the execution order of code.

## Conditional Statements

`if`, `elseif`, `else` statements are used for conditional logic. The block is terminated by `end`.

```lua
local x = 10
if x > 20 then
    print("x is greater than 20")
elseif x < 10 then
    print("x is less than 10")
else
    print("x is between 10 and 20")
end
```

## Loops

### `while` loop
Repeats a block of code as long as a condition is true.

```lua
local i = 1
while i <= 3 do
    print(i)
    i = i + 1
end
```

### `repeat` loop
The `repeat...until` loop is similar to a do-while loop; the condition is checked at the end.

```lua
local i = 1
repeat
    print(i)
    i = i + 1
until i > 3
```

### `for` loop
Lua has two types of `for` loops.

**1. Numeric `for` loop:**
Iterates from a start value to an end value with a specified step.

```lua
-- start, end, step (step is optional, defaults to 1)
for i = 1, 3, 1 do
    print(i)
end
```

**2. Generic `for` loop:**
Iterates over the elements of a collection using an iterator function. The most common is `pairs` for tables.

```lua
local myTable = { a = 1, b = 2, c = 3 }
for key, value in pairs(myTable) do
    print(key, value)
end
```

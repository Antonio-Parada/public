# Lua Functions

Functions in Lua are first-class citizens, meaning they can be stored in variables, passed as arguments to other functions, and returned as results.

## Definition
Functions are defined with the `function` keyword and terminated with `end`.

```lua
function add(a, b)
    return a + b
end

local result = add(10, 5)
print(result) -- Output: 15
```

## First-Class Functions
Functions can be treated like any other value.

```lua
local my_function = function(text)
    print(text)
end

my_function("Hello from a variable!")
```

## Multiple Return Values
Lua functions can return multiple values.

```lua
function get_coordinates()
    return 10, 20 -- x, y
end

local x, y = get_coordinates()
print(x, y) -- Output: 10   20
```

## Variadic Functions
Functions can accept a variable number of arguments using `...`.

```lua
function sum(...)
    local total = 0
    for _, value in ipairs{...} do
        total = total + value
    end
    return total
end

print(sum(1, 2, 3, 4, 5)) -- Output: 15
```

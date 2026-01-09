# Lua Tables

Tables are the sole data structuring mechanism in Lua and are a fundamental concept. They are associative arrays, meaning they can be indexed with numbers (like arrays) as well as with other types like strings (like dictionaries or hash maps).

## Array-like Usage
When indexed with integers, tables behave like arrays. By convention, array indexing starts at 1.

```lua
local myArray = { "apple", "banana", "cherry" }
print(myArray[1]) -- Output: apple
```

## Dictionary-like Usage
When indexed with strings or other types, tables behave like dictionaries.

```lua
local myDict = {
    name = "John Doe",
    age = 30,
    isStudent = false
}

print(myDict.name)    -- Output: John Doe (syntactic sugar)
print(myDict["age"]) -- Output: 30
```

## Mixed Usage
Tables can hold values of any type and can mix array-style and dictionary-style keys.

```lua
local mixedTable = { "a", "b", name = "Test", [10] = "c" }
print(mixedTable[1])      -- Output: a
print(mixedTable.name)    -- Output: Test
print(mixedTable[10])     -- Output: c
```

## Tables as Objects
Tables are often used to create objects in Lua by storing methods (functions) within them.

```lua
local Person = {}
Person.name = "Anonymous"

function Person:new(name)
    local obj = { name = name }
    self.__index = self
    return setmetatable(obj, self)
end

function Person:greet()
    print("Hello, my name is " .. self.name)
end

local p1 = Person:new("Alice")
p1:greet() -- Output: Hello, my name is Alice
```

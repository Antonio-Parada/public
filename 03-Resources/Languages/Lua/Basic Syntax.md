# Lua Basic Syntax

Lua's syntax is simple and procedural. It's designed to be lightweight and easy to embed.

## Variables and Assignment
Variables are dynamically typed and global by default unless explicitly declared as `local`.

```lua
-- Global variable
x = 10

-- Local variable (preferred)
local y = "hello"
local z = true
```

## Data Types
Lua has eight basic data types:
*   **nil:** Represents the absence of a value.
*   **boolean:** `true` or `false`.
*   **number:** Represents real (double-precision floating-point) numbers.
*   **string:** A sequence of characters. Can be defined with single or double quotes.
*   **function:** Functions are first-class citizens.
*   **userdata:** Used to hold arbitrary C data.
*   **thread:** Represents independent threads of execution (coroutines).
*   **table:** The only compound data structure in Lua. See [[Tables]].

## Comments

```lua
-- This is a single-line comment

--[[
This is a multi-line comment.
It can span several lines.
]]
```

## Keywords
Lua has a small set of reserved keywords like `and`, `end`, `function`, `if`, `local`, `nil`, `not`, `or`, `then`, `while`, etc.

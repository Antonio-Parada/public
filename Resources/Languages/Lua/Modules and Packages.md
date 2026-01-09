# Lua Modules

In Lua, a module is typically a library that can be loaded into a program to provide specific functionality. Modules help in organizing code into reusable units.

A module is usually implemented as a table that is returned from a `.lua` file.

## Creating a Module

To create a module, you define a table, add functions and variables to it, and then return that table at the end of the file.

**Example: `my_module.lua`**
```lua
-- Create a table to hold the module's functions and variables
local M = {}

-- A private variable for the module
local private_var = "I am private"

-- A public variable
M.public_var = "I am public"

-- A public function
function M.greet(name)
    return "Hello, " .. name .. "! " .. private_var
end

-- Return the module table
return M
```

## Loading a Module

The `require()` function is used to load modules. `require` searches for the module in a predefined path, loads it only once, and caches the result.

**Example: `main.lua`**
```lua
-- Load the module (the .lua extension is not needed)
local my_module = require("my_module")

-- Use the module's functions and variables
print(my_module.public_var)
print(my_module.greet("Alice"))
```

## Key Behaviors of `require`

*   **Caching:** Once a module is loaded, subsequent `require` calls for the same module will return the cached table without re-executing the script.
*   **Path Searching:** `require` looks for the module file in a sequence of paths defined in the `package.path` variable.

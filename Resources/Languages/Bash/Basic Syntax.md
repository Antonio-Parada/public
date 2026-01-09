# Bash Basic Syntax

Understanding the basic syntax of Bash is crucial for writing effective shell scripts.

## Shebang (`#!`)
The first line of a Bash script should be `#!/bin/bash` (or `#!/usr/bin/env bash`). This ensures that the script is executed by the Bash interpreter.

## Comments
Comments start with a `#` symbol. They are ignored by the interpreter.

```bash
# This is a comment.
```

## Variables
Variables are used to store data. There are no data types in the traditional sense.

```bash
# Assignment (no spaces around the =)
my_variable="Hello, World!"

# Expansion (using $)
echo $my_variable
```

## Quoting
Quoting is critical in Bash to control word splitting and expansion.

*   **Double Quotes (`"`)**: Allows for variable and command substitution (`$`, `\`, `\"`). Prevents word splitting.
    ```bash
    echo "$my_variable" # Preserves spaces
    ```
*   **Single Quotes (`'`)**: Disables all substitution. The string is treated literally.
    ```bash
    echo '$my_variable' # Outputs the literal string $my_variable
    ```
*   **Backslash (`\`)**: Escapes the next character.

```
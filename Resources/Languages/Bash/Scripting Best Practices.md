# Bash Scripting Best Practices

Writing robust Bash scripts requires adopting several best practices to avoid common pitfalls.

## Use `set` for Safety
Start your scripts with the following lines to make them safer:

*   `set -e` (or `set -o errexit`): Exit immediately if a command exits with a non-zero status.
*   `set -u` (or `set -o nounset`): Treat unset variables as an error when substituting.
*   `set -o pipefail`: The return value of a pipeline is the status of the last command to exit with a non-zero status, or zero if no command exited with a non-zero status.

```bash
#!/bin/bash
set -euo pipefail
```

## Quote Your Variables
Always enclose variable expansions in double quotes (`"$my_var"`) to prevent word splitting and unexpected globbing issues, especially if the variable contains spaces or special characters.

## Use `[[ ... ]]` for Tests
Prefer the double-bracket `[[ ... ]]` syntax for conditional tests over the single-bracket `[ ... ]`. It is more powerful, safer, and prevents many common errors.

## Use `$(...)` for Command Substitution
Prefer `$(...)` for command substitution over backticks (`` `...` ``). It is more readable and can be nested easily.

## Check for Command Existence
Before using a command, ensure it's available in the system's `PATH`.

```bash
if ! command -v curl &> /dev/null; then
    echo "curl could not be found, please install it."
    exit 1
fi
```

## Use Local Variables in Functions
Declare variables inside functions with the `local` keyword to avoid polluting the global scope.

```bash
my_func() {
    local my_var="I am local to this function"
    echo "$my_var"
}
```

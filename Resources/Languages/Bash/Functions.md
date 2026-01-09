# Bash Functions

Functions in Bash are used to group reusable blocks of code.

## Defining Functions
There are two common ways to define a function.

```bash
# Method 1
function my_function {
    echo "Hello from my_function!"
}

# Method 2 (more common)
greet() {
    echo "Hello, $1!"
}
```

## Calling Functions
Call a function by simply using its name.

```bash
my_function
greet "Alice"
```

## Arguments
Functions access arguments using positional parameters: `$1` for the first argument, `$2` for the second, and so on. `$@` refers to all arguments.

```bash
print_args() {
    for arg in "$@"; do
        echo "Argument: $arg"
    done
}

print_args "one" "two three" "four"
```

## Return Values
Bash functions don't return values in the traditional sense. They return an exit status (an integer between 0 and 255), where 0 means success. To "return" a value, you typically use `echo` or assign to a global variable.

```bash
get_date() {
    # "Return" by echoing to standard output
    date
}

# Capture the "returned" value using command substitution
current_date=$(get_date)
echo "The date is: $current_date"
```

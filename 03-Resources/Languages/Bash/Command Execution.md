# Bash Command Execution

Bash scripts are sequences of commands.

## Basic Commands
Any command you can run in the terminal can be used in a script.

```bash
ls -l
date
```

## Command Substitution
Command substitution allows the output of a command to replace the command itself. It is done using `$(...)` (preferred) or backticks (`` `...` ``).

```bash
current_date=$(date)
echo "Today is: $current_date"
```

## Pipelines (`|`)
Pipelines are used to send the standard output of one command to the standard input of another.

```bash
# List all files, then count the lines
ls -l | wc -l
```

## Redirection
Redirection is used to change where standard input, standard output, and standard error go.

*   `>`: Redirect standard output (overwrite file).
*   `>>`: Redirect standard output (append to file).
*   `<`: Redirect standard input.
*   `2>`: Redirect standard error.

```bash
# Write "hello" to a file
echo "hello" > output.txt

# Append "world" to the file
echo "world" >> output.txt

# Redirect errors to a log file
ls /nonexistent_directory 2> error.log
```

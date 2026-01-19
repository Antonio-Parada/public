# Bash Conditional Logic

Conditional logic allows scripts to make decisions.

## `if` Statements
The `if` statement is the most common conditional construct. It must be terminated with `fi`.

```bash
count=10

if [ $count -eq 10 ]; then
    echo "Count is 10."
elif [ $count -gt 10 ]; then
    echo "Count is greater than 10."
else
    echo "Count is less than 10."
fi
```

## The `test` Command (`[` and `[[`)
*   `[` (test): The traditional, POSIX-compliant way. Requires variables to be quoted.
*   `[[` (extended test): A Bash-specific enhancement. It's safer and more powerful (e.g., supports `&&`, `||`, and pattern matching).

**Common Comparisons:**
*   `-eq`: equal (for integers)
*   `-ne`: not equal
*   `-gt`: greater than
*   `-lt`: less than
*   `=`: equal (for strings)
*   `!=`: not equal
*   `-z`: string is empty
*   `-n`: string is not empty
*   `-f`: file exists and is a regular file
*   `-d`: file exists and is a directory

## `case` Statements
`case` statements are useful for matching a variable against several patterns.

```bash
read -p "Enter yes or no: " answer

case $answer in
    [Yy]es)
        echo "You entered yes."
        ;;
    [Nn]o)
        echo "You entered no."
        ;;
    *)
        echo "Invalid response."
        ;;
esac
```

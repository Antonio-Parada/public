# Bash Loops

Loops are used to execute a block of code repeatedly.

## `for` loop
Iterates over a list of items.

```bash
# Looping over a list of strings
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

# C-style for loop
for (( i=0; i<5; i++ )); do
    echo "Number: $i"
done
```

## `while` loop
Executes as long as a condition is true.

```bash
counter=0
while [ $counter -lt 3 ]; do
    echo "Counter is $counter"
    let counter=counter+1
done
```

## `until` loop
Executes as long as a condition is false.

```bash
counter=0
until [ $counter -ge 3 ]; do
    echo "Counter is $counter"
    let counter=counter+1
done
```

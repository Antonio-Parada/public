# JavaScript Control Flow

JavaScript's control flow statements are similar to other C-style languages.

## `if-else` Statement

```javascript
let x = 10;
if (x > 15) {
    // ...
} else if (x === 10) {
    // ...
} else {
    // ...
}
```

## `for` and `for...of` Loops

```javascript
// for loop
for (let i = 0; i < 5; i++) {
    // ...
}

// for...of loop (for iterable objects like arrays)
const arr = ['a', 'b', 'c'];
for (const element of arr) {
    // ...
}
```

## `while` Loop

```javascript
let i = 0;
while (i < 5) {
    // ...
    i++;
}
```

## `switch` Statement

```javascript
let option = 'B';
switch (option) {
    case 'A':
        // ...
        break;
    case 'B':
        // ...
        break;
    default:
        // ...
        break;
}
```

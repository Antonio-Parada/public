# JavaScript Functions

Functions are fundamental building blocks in JavaScript.

## Function Declaration

```javascript
function greet(name) {
    return `Hello, ${name}!`;
}
```

## Function Expression

```javascript
const greet = function(name) {
    return `Hello, ${name}!`;
};
```

## Arrow Functions (ES6)
A more concise syntax for writing functions.

```javascript
const add = (a, b) => a + b;
```

## Parameters and Arguments
JavaScript functions can have default parameters and can handle a variable number of arguments using the rest parameter syntax (`...`).

```javascript
function logMessages(prefix, ...messages) {
    for (const message of messages) {
        console.log(prefix, message);
    }
}
```

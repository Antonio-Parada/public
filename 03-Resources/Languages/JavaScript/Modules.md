# JavaScript Modules

JavaScript has a standard module system (ES6 Modules) for organizing code into reusable files.

## `export`
The `export` statement is used to export functions, objects, or primitive values from a given file so they can be used by other programs.

**Named Exports:**
```javascript
// lib.js
export const PI = 3.14;
export function add(a, b) {
    return a + b;
}
```

**Default Export:**
```javascript
// my-class.js
export default class MyClass { /* ... */ }
```

## `import`
The `import` statement is used to import bindings that are exported by another module.

```javascript
// main.js

// Importing named exports
import { PI, add } from './lib.js';

// Importing a default export
import MyClass from './my-class.js';

console.log(PI);
const myInstance = new MyClass();
```

## In HTML
To use modules in a web browser, you must add `type="module"` to your `<script>` tag.

```html
<script type="module" src="main.js"></script>
```

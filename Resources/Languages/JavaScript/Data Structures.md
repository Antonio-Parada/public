# JavaScript Data Structures

JavaScript provides several built-in data structures.

## `Object`
The primary complex data structure, used for storing keyed collections.

```javascript
const person = {
    name: "Alice",
    age: 30
};
console.log(person.name); // Alice
```

## `Array`
A global object that is used in the construction of arrays; a high-level, list-like object.

```javascript
const fruits = ["Apple", "Banana"];
fruits.push("Cherry");
console.log(fruits[0]); // Apple
```

## `Map`
A collection of keyed data items, just like an `Object`. But the main difference is that `Map` allows keys of any type.

```javascript
const myMap = new Map();
myMap.set("keyString", "value");
myMap.set(1, "one");
```

## `Set`
A collection of unique values.

```javascript
const mySet = new Set([1, 1, 2, 3, 3]);
// mySet contains {1, 2, 3}
```

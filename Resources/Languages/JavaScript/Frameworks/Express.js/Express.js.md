# Express.js

Express.js is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications.

## Key Features

*   **Middleware:** Express is a routing and middleware web framework that has minimal functionality of its own: An Express application is essentially a series of middleware function calls.
*   **Routing:** Express provides a simple and powerful routing system to handle different HTTP requests.
*   **Templating:** Supports various templating engines to generate HTML.

## Basic Usage

```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
```

## Cross-References

*   [[Node.js]]
*   [[JavaScript]]

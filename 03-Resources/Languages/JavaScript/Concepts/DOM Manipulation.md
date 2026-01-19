# DOM Manipulation

The Document Object Model (DOM) is the data representation of the objects that comprise the structure and content of a document on the web. JavaScript's primary role in the browser is to interact with and manipulate the DOM.

## Key Concepts

1.  **Selecting Elements:** Finding and getting a reference to an HTML element.

    ```javascript
    // Select by ID
    const myElement = document.getElementById('my-id');

    // Select by class (returns a collection)
    const myElements = document.getElementsByClassName('my-class');

    // Modern method using CSS selectors
    const heading = document.querySelector('h1');
    const allParagraphs = document.querySelectorAll('p');
    ```

2.  **Modifying Elements:** Changing the content, style, or attributes of an element.

    ```javascript
    const heading = document.querySelector('h1');

    // Change text content
    heading.textContent = 'New Heading Text';

    // Change style
    heading.style.color = 'blue';

    // Change an attribute
    const image = document.querySelector('img');
    image.setAttribute('src', 'new_image.jpg');
    ```

3.  **Creating and Appending Elements:** Adding new elements to the page.

    ```javascript
    // Create a new paragraph element
    const newParagraph = document.createElement('p');
    newParagraph.textContent = 'This is a new paragraph.';

    // Append it to the body of the document
    document.body.appendChild(newParagraph);
    ```

4.  **Event Handling:** Responding to user interactions like clicks, key presses, and mouse movements.

    ```javascript
    const myButton = document.getElementById('my-button');

    myButton.addEventListener('click', function() {
        alert('Button was clicked!');
    });
    ```

# Object-Oriented Programming (OOP)

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code: data in the form of fields (often known as attributes or properties), and code in the form of procedures (often known as methods).

Python is an object-oriented language, and almost everything in Python is an object, with its properties and methods.

## Key Concepts

### 1. Classes and Objects

*   **Class**: A blueprint for creating objects. It defines a set of attributes and methods that the objects created from the class will have.
*   **Object (Instance)**: An individual instance of a class. When a class is defined, no memory is allocated until an object is created.

```python
# Class Definition
class Dog:
    # Class attribute
    species = "Canis familiaris"

    # Initializer / Constructor
    def __init__(self, name, age):
        self.name = name  # Instance attribute
        self.age = age    # Instance attribute

    # Instance method
    def bark(self):
        return f"{self.name} says Woof!"

# Creating objects (instances) of the Dog class
my_dog = Dog("Buddy", 3)
your_dog = Dog("Lucy", 5)

print(f"{my_dog.name} is {my_dog.age} years old.")
print(my_dog.bark())
print(f"Both are {Dog.species}.")
```

### 2. Inheritance

Inheritance allows a class (child/subclass) to inherit attributes and methods from another class (parent/superclass). This promotes code reusability.

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("Subclass must implement abstract method")

class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow!"

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

my_cat = Cat("Whiskers")
my_dog = Dog("Max")

print(my_cat.speak())
print(my_dog.speak())
```

### 3. Polymorphism

Polymorphism means "many forms". In OOP, it refers to the ability of different objects to respond to the same method call in their own way.

```python
class Bird:
    def intro(self):
        print("There are many types of birds.")

    def flight(self):
        print("Most birds can fly but some cannot.")

class Sparrow(Bird):
    def flight(self):
        print("Sparrows can fly.")

class Ostrich(Bird):
    def flight(self):
        print("Ostriches cannot fly.")

obj_bird = Bird()
obj_spr = Sparrow()
obj_ost = Ostrich()

obj_bird.intro()
obj_bird.flight()

obj_spr.intro()
obj_spr.flight()

obj_ost.intro()
obj_ost.flight()
```

### 4. Encapsulation

Encapsulation refers to the bundling of data (attributes) and methods that operate on the data within a single unit (class). It also restricts direct access to some of an object's components, which can prevent accidental modification of data.

Python doesn't have strict private access modifiers like some other languages, but conventions are used:
*   **Single underscore `_`**: Convention for internal use (weakly private).
*   **Double underscore `__`**: Name mangling occurs, making it harder to access directly (stronger privacy).

```python
class MyClass:
    def __init__(self):
        self.public_var = "I am public"
        self._protected_var = "I am protected (by convention)"
        self.__private_var = "I am private (name mangled)"

    def get_private(self):
        return self.__private_var

obj = MyClass()
print(obj.public_var)
print(obj._protected_var)
# print(obj.__private_var) # This would raise an AttributeError
print(obj.get_private())
print(obj._MyClass__private_var) # Accessing mangled name
```

### 5. Abstraction

Abstraction means hiding the complex implementation details and showing only the essential features of an object. In Python, abstract classes and methods can be created using the `abc` module.

```python
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)

# shape = Shape() # This would raise a TypeError
rect = Rectangle(10, 5)
print(f"Rectangle Area: {rect.area()}")
print(f"Rectangle Perimeter: {rect.perimeter()}")
```
# Programing in Haskell
*by Graham Huttons*

## Chapter 1 - Introduction

### 1.1. Functions
### 1.2. Functional Programming
### 1.3. Features of Haskell
### 1.4. Historical background
### 1.5. A taste of Haskell
### 1.6. Chapter remarks
### 1.7. Exercises

## Chapter 2 - First steps

### 2.1. The Hugs system

- In this book, we use Hugs system, an interactive system, for execute Haskell
    program.
- But using GHC (Glasgow Haskell Compiler) is interchangeable.

### 2.2. The stand prelude

- The `>` sign when we start up Hugs system means that the systems loaded a
library called Prelude.hs, a library defines many familiar functions.
- Exponentiation has higher priority than multiplication and division.
- Exponentiation associates to the right. e.g. 2 ^ 3 ^ 4 means 2 ^ (3 ^ 4).
- Prelude also has some functions that operates on lists:
  - head: non-empty list.
  - tail: non-empty list.
  - !!: select *n*th element of list.
  - take: select first n element of list.
  - drop: remove first n element of list.
  - length:
  - sum:
  - product:
  - ++: append two lists.
  - reverse:

### 2.3. Function application

- Haskell use spacing for function call and parameters. And \* sign for
  multiplication.
    f(a, b) + c d
    in Haskell:
    f a b + c * d

### 2.4. Haskell script

- Useful commands:
  - :load name
  - :reload
  - :edit name
  - :edit
  - :type expr
  - :?
  - :quit
- Naming requirements:
  - Function name and its arguments must begin with a lower-case letter.
  - Some keywords are reserved:
        case class data default deriving do else if import in
        infix infixl infixr instance let module newtype of then type where
  - Suffix *s* for list arguments.

- Layout rule
  - Each definition must begin at exactly the same column.
  - Use for grouping of definitions.

- Comments
  - *ordinary* and *nested*
  - *ordinary* Begin with -- symbol.
  - *nested* begin with {- end with -}.

### 2.5. Chapter remarks
### 2.6. Exercises

1.

    (2 ^ 3) * 4
    (2 * 3) + (4 * 5)
    2 + 3 * (4 ^ 5)

2.

3.

    n = a `div` length xs
      where
        a = 10
        xs = [1, 2, 3, 4, 5]

4.

    last xs = head (reverse xs)
    last xs = head (drop (length xs - 1) xs)

5.

    init xs = take (length xs - 1) xs
    init xs = reverse (tail (reverse xs))

## Chapter 3 - Typer and classes

### 3.1. Basic concepts

- Type: a collection of related values.
- Type inference: a process to calculate type of every expression.

### 3.2. Basic types
### 3.3. List types
### 3.4. Tuple types
### 3.5. Function types
### 3.6. Curried functions
### 3.7. Overloaded types
### 3.8. Overloaded types
### 3.9. Basic classes
### 3.10. Chapter remarks
### 3.11. Exercises

## Chapter 4 - Defining functions

### 4.1. New from old
### 4.2. Conditional expressions
### 4.3. Guarded equations
### 4.4. Pattern matching
### 4.5. Lambda expressions
### 4.6. Sections
### 4.7. Chapter remarks
### 4.8. Exercises

## Chapter 5 - List comprehensions
## Chapter 6 - Recursive functions
## Chapter 7 - Higher-order functions
## Chapter 8 - Functional parsers
## Chapter 9 - Interactive programs
## Chapter 10 - Declaring types and classes
## Chapter 11 - The countdown problem
## Chapter 12 - Lazy evaluation
## Chapter 13 - Reasoning about programs

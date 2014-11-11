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

- Bool
- Char
- String
- Int: fixed-precision integer, value ranges from -2^31 to 2^31 - 1. Has fixed
  amount of computer memory.
- Integer: arbitrary-precision integer. Compute slower via a medium.
- Float: single-precision floating point numbers. Has a fixed amount of memory.

_Floating point_ comes from the fact that the point is _float_ according how big
or small the number is. E.g. `sqrt 2 = 1.41421` which has 5 digits after the
point, whereas `sqrt 99999 = 316.226` has only 3 digits after the point.

### 3.3. List types

- A _list_ is a sequence of _elements_ of the same type.
- Length = 0 -> empty list
- Length = 1 -> singleton list
- Type of a list does not convey information about its length.
- No limitation for type of elements in a list. List of lists is also possible.
- No restriction for number of elements. Infinite length is also natural and
  practical.

### 3.4. Tuple types

- **Finite** sequence of _component_of possibly different types.
- Enclosed by round parentheses and separated by commas.
- The number of components in a tuple is called _arity_.
- According to its arity, tuples can be called empty, pairs, triples.
- There is no tuple with arity one, because of conflict with parentheses used
  with order explicit.
- The type of tuple does convey its arity.
- There is no restriction on the type of components of a tuple.
- Tuple must have finite arity -> can calculate its type.

### 3.5. Function types

- Function is **a mapping** from _arguments_ of one type to _results_ of another
  type.
- There is no restriction on type of arguments. Therefore single argument and
  result can also handle multiple arguments and results as we can package
multiple values using lists or tuples.

### 3.6. Curried functions

- Functions that take arguments one at a time are called _curried_.
- More flexible, can be applied to a part of a list.
- Convention 1: `->` is assumed to associate to the right.
- Convention 2: parentheses is assumed to associate to the left.

### 3.7. Polymorphic types

- Type variable enables function to apply with any type.
- Type variable must begin with lower case letter.

Example:

    fst :: (a, b) -> a
    head :: [a] -> a
    take :: Int -> [a] -> [a]
    zip :: [a] -> [b] -> [(a, b)]
    id :: a -> a

### 3.8. Overloaded types

- _Class constraint_ is denoted as _C a_, where _C_ is the name of a class and
  _a_ is a type variable.

- Parentheses around an operator converts it into a curried function.
- A type that contains one or more class constraints is called overloaded.

Example:
    (+) :: Num a => a -> a -> a
    With any instance a of class Numeric, function + has type of a -> a -> a.
    Num a => a -> a -> a is an overload type.
    (+) is an oveloaded function.

### 3.9. Basic classes

- _Class_ is a collection of types, that support certain overloaded operations
  called _methods_.
- This notion is far different what class is in OOP. So, instead of class is
  definition of related characteristics as nouns, in FP, class is a collection
of methods as verbs.

#### _Eq_ - equality types.

- Types whose values can be compared for equality and inequality.
- All basic types are instances of the Eq class, as are is list and tuple.

#### _Ord_ - ordered types.

- Values are linearly ordered.
- Six methods: (<), (<=), (>), (>=), min max.

#### _Show_ - show-able types.

- Types whose values can be converted in to string:
    show :: a -> String

#### _Read_ - readable types.

- Convert from string to its instances.
    read :: String -> a

#### _Num_ - numeric types.
#### _Integral_ - integral types.

    div :: a -> a -> a
    mod :: a -> a -> a

#### _Fractional_ - fractional types

    (/) :: a -> a -> a
    recip :: a -> a

### 3.10. Chapter remarks
### 3.11. Exercises

1.

    [’a’,’b’,’c’] :: [Char]
    (’a’, ’b’, ’c’) :: (Char, Char, Char)
    [ (False , ’O’), (True , ’1’) ] :: [(Bool, Char)]
    ([False,True],[’0’,’1’]) :: ([Bool], [Char])
    [ tail , init , reverse ] :: [[a] -> [a]]

2.

    second xs = head (tail xs) :: [a] -> a
    swap (x, y) = (y, x) :: (a, b) -> (b, a)
    pair x y = (x, y) :: x -> y -> (x, y)
    double x = x * 2 :: Num a => a -> a
    palindrome xs = reverse xs == xs :: [a] -> Bool
    twice f x = f (f x) :: (t -> t) -> t -> t

3.


4.
// TODO

## Chapter 4 - Defining functions

### 4.1. New from old

- New functions defined by combining old ones.

### 4.2. Conditional expressions

- `if then else`
- `else` is mandatory.

### 4.3. Guarded equations

- The symbol `|` is read as "such that".
- Guarded equations is clearly an excellent way to define conditional
  statements. Like a `switch` like statement for conditions.

### 4.4. Pattern matching

- Pattern matching is another attempt to make Haskell more clear and simple in
  term of function definition, which is, happens a lot.
- By defining one case after another, we can separate function definition in
  smaller case. And by using wild card pattern, this can reduce the amount of
patterns need to be defined.
- Wildcards can be used with lazy valuation. If the all the first argument is
  false cases, the wildcards would then not evaluate the second.
- One name is used for only one argument in a single equation. Can't repeat
  argument.

#### Tuple patterns

- Match arity.
- Then match components in order.

Example:
    fst :: (a, b) -> a
    fst (x, _) = x

#### List patterns

- _cons_ operator is used to construct list. Therefore, can be used to construct
  list patterns.
- List is not primitive type. Should be seen as a chain of _cons_ operators: [1,
  2, 3, 4] = 1 : 2 : 3 : []
- Match length.
- Then match elements in order.

Example:
    null :: [a] -> Bool
    null [] = True
    null (_ : _) = False

    head :: [a] -> a
    head (x : _) = x

    tail :: [a] -> [a]
    tail (_ : xs) = xs

#### Integer patterns

Example:
    pred :: Int -> Int
    pred 0 = 0
    pred (n + 1) = n

### 4.5. Lambda expressions

- Lambda expressions are nameless functions.

Example:
    > (\x -> x + x) 2
    4

- Use to formalize curried functions:
    add x y = x + y
    add x y = \x -> (\y -> x + y)

- Use to define a function that only use once.
    odds n = map (\x -> x * 2 + 1) [0..n-1]

### 4.6. Sections

- Enclosed operator in parentheses make them curried function.
- Can also include an argument.
- 2 ways above create _sections_

Applications of section:

- Construct some simples functions:
    (+) addition
    (1+) successor
    (1/) reciprocation
    (*2) double
    (/2) halve

- Necessary when finding the type of operators. Because operators itself is not
  a valid expression. Must be enclosed in parentheses.

- Necessary when passing operator as argument.
    and :: [Bool] -> Bool
    and = foldr (^) True

### 4.7. Chapter remarks
### 4.8. Exercises

1.

    halve xs = take middle xs : drop middle xs : []
                where middle = length xs `div` 2

2.

  1. A conditional expression

    safetail1 xs = if length xs == 0 then xs else tail xs

  2. Guarded equations

    safetail2 xs | length xs == 0 = xs
                 | otherwise = tail xs

  3. Pattern matching

    safetail3 [] = []
    safetail3 xs = tail xs

3.

  Redefine || (Or) operation using patterns matching.

  1.

    True || True = True
    True || False = True
    False || True = True
    False || False = False

  2.

    False || False = False
    _ || _ = True

  3.

    False || b = b
    True || _ = True

  4.

    b || c | b == b = b
           | otherwise = True

4.

    (&&) b c = if c == True then
                if b == True then True else False
              else False

5.

    (&&) a b = if a == True then b else False

6.

    mult = \x -> \y -> \z -> x * y * z

## Chapter 5 - List comprehensions
## Chapter 6 - Recursive functions
## Chapter 7 - Higher-order functions
## Chapter 8 - Functional parsers
## Chapter 9 - Interactive programs
## Chapter 10 - Declaring types and classes
## Chapter 11 - The countdown problem
## Chapter 12 - Lazy evaluation
## Chapter 13 - Reasoning about programs

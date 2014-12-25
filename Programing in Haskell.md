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

### 5.1. Generator

- _Comprehension_: construct new sets from existing sets.

For example:

The comprehension {x^2 | x <- {1..5}} produces the set {1, 4, 9, 16, 25}.

In Haskell:
    > [x ^ 2 | x <- [1..5]]
    [1, 4, 9, 16, 25]

- `|` is read as _such that_
- `<-` is read as _is drawn from_
- The expression `x <- [1..5]` is called a _generator_
- A list comprehension can have **more** than one generator, separated by
  commas.

Example:
    > [(x, y) | x <- [1..3], y <- [4, 5]]
    [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
    > [(x, y) | y <- [4..5], x <- [1..3]]
    [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]

- The generators is like the nested loops, which the later is more deeply
  nested.
- Later generators can also depend on values of valuables from earlier
  generators.

For example:
    >[(x, y) | x <- [1..3], y <- [1..x]]
    [(1,1),(2,1),(2,2),(3,1),(3,2),(3,3)]

- Use wildcard `_` to discard elements from list.

For example:
    >length xs = sum[1 | _ <- xs]

`_ <- xs` can be seen as the counter.

### 5.2. Guards

- List comprehensions can use logical expressions called _guards_ to filter the
  values produced by earlier generators. If the guard is True then the current
values are retained, else False then discarded.

For example:
    [x | x <- [1..10], even x]
    [2,4,6,8,10]

### 5.3. The _zip_ function

- _zip_: pairing successive elements from two existing list until either or both
  are exhausted.

For example:
    Prelude> zip ['a', 'b', 'c'] [1..3]
    [('a',1),('b',2),('c',3)]
    Prelude> zip ['a', 'b', 'c'] [1..4]
    [('a',1),('b',2),('c',3)]

_pairs_
    pairs :: [a] -> [(a, a)]
    pairs = zip xs (tail xs)

    Prelude> let pairs xs = zip xs (tail xs)
    Prelude> :t pairs
    pairs :: [b] -> [(b, b)]
    Prelude> pairs [1, 2, 3, 4]
    [(1,2),(2,3),(3,4)]

_sorted_
    sorted :: Ord a => [a] -> Bool
    sorted xs = and[x <= y | (x, y) <- pairs xs]

- To check an array _sorted_ or not, we compare each adjacent elements from
  list. As we can see from this example, we use generator to create a set of
values, then filter by guards, and collect by the expression on left of `|`.
This creates a set. In the _sorted_ example, we can operate on the result set
with operator `and` to get the final result.

_positions_
    Prelude> let positions x xs = [i | (x', i) <- zip xs [0..n], x'== x] where n = length xs - 1
    Prelude> :t positions
    positions :: Eq a => a -> [a] -> [Int]
    Prelude> positions True [True, False, False, True, True]
    [0,3,4]

### 5.4. String comprehensions

- String is a list of char. So all the functions on list can be with strings,
  include list comprehensions.

### 5.5. The Caesar cipher
### 5.6. Chapter remarks
### 5.7. Exercises

    {-|
      Exercise 5.6.1
      Using a list comprehension, give an expression that calculates the sum 1^2 +
      2^2 + . . . 100^2 of the first one hundred integer squares.
    -}
    ex1 = sum[x ^ 2 | x <- [1..100]]

    {-|
     - In a similar way to the function length, show how the library function
     - replicate :: Int → a → [ a ] that produces a list of identical elements can
     - be defined using a list comprehension. For example:
     - > replicate 3 True [True, True, True ]
     -}
    replicate' a b = [b | _ <- [1..a]]

    {-|
     - A triple (x, y, z) of positive integers is pythagorean if x2 + y2 = z2. Using
     - a list comprehension, define a function pyths :: Int → [ (Int , Int , Int ) ]
     - that returns the list of all pythagorean triples whose components are at most
     - a given limit. For example:
     - > pyths 10
     - [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)]
     -}

    pyths n = [(a, b, c) | a <- [1..n], b <- [1..n], c <- [1..n], a ^ 2 + b ^ 2 == c ^ 2]

    {-|
     - A positive integer is perfect if it equals the sum of its factors, excluding
     - the number itself. Using a list comprehension and the function factors,
     - define a function perfects :: Int → [ Int ] that returns the list of all
     - perfect numbers up to a given limit. For example:
     - > perfects 500
     - [6, 28, 496]
     -}

    factors a = [x | x <- [1..a], a `mod` x == 0]
    isPerfect a = sum (tail (reverse (factors a))) == a
    perfects n = [x | x <- [1..n], isPerfect x]

    {-|
     - Show how the single comprehension [(x,y) | x ← [1,2,3],y ← [4,5,6]] with two
     - generators can be re-expressed using two comprehen- sions with single
     - generators. Hint: make use of the library function concat and nest one
     - comprehension within the other.
     -}

    --ex51 = concat[(x, [y | y <- [4, 5, 6]]) | x <- [1, 2, 3]]

    {-|
     - 6. Redefine the function positions using the function find.
     -}

    find k t = [v | (k', v) <- t, k == k']
    generateTuple xs = zip xs [0..n]
                       where n = length xs - 1
    positions x xs = find x (generateTuple xs)

    {-|
     - 7. The scalar product of two lists of integers xs and ys of length n is given by
     - the sum of the products of corresponding integers:
     - 􏰀n−1
     - (xsi ∗ysi) i=0
     - In a similar manner to the function chisqr , show how a list comprehension
     - can be used to define a function scalarproduct :: [ Int ] → [ Int ] → Int
     - that returns the scalar product of two lists. For example:
     - > scalarproduct [1, 2, 3] [4, 5, 6]
     - 32
     -}

    scalarproduct xs ys = sum[x * y | (x, y) <- zip xs ys]

## Chapter 6 - Recursive functions

- Recursion is the basic mechanism for looping in Haskell.

### 6.1. Basic concepts

- Factorial can be written in recursive form as:
    factorial 0 = 1
    factorial (n + 1) = (n + 1) * factorial n

- The first line above is called _base case_.
- The last line is called _recursive case_.
- Some functions can be easily defined by using standard library functions, but
  in many case, defining in recursion is very simple and natural. Thus, many of
library functions in Haskell are defined in recursion. Moreover, it allows us to
use some powerful techniques of induction. (will see later)

### 6.2. Recursion on lists

- Insertion sort:
  - Empty list is already sorted.
  - Non empty list is sorted by inserting its head into the list that results
    from sorting its tail.

### 6.3. Multiple arguments

- _zip_
    zip :: [a] -> [b] -> [(a, b)]
    zip [] _ = []
    zip _ [] = []
    zip (x : xs) (y : ys) = (x, y) : zip xs ys

- Note that there are two base cases for each argument.

### 6.4. Multiple recursion

- Functions can be applied more than once in its definition.
- _quick sort_
    - Empty list is already sorted.
    - Non empty list can be sorted by placing its head between the two lists
      that results from quick sort those elements that _smaller_ and _larger_
than the head.

### 6.5. Mutual recursion

- This is really interesting. The definition of one can only be complete by one
  another and vice versa. It creates the _mutual_ recursion on these two.

For example:
`
even :: Int -> Bool
even 0 = True
even (n + 1) = odd n

odd :: Int -> Bool
odd 0 = False
odd (n + 1) = even n

`

### 6.6. Advice on recursion

#### product
#### drop
#### init

### 6.7. Chapter remarks
### 6.8. Exercises


    {-|
     - 1. Define the exponentiation operator ↑ for non-negative integers using the
     - same pattern of recursion as the multiplication operator ∗, and show how 2 ↑
     - 3 is evaluated using your definition.
     -}

    exp' :: Int -> Int -> Int
    exp' 0 a = 0
    exp' a 0 = 1
    exp' a n = a * (exp' a (n - 1))

    {-|
     - 2. Using the definitions given in this chapter, show how length [1,2,3], drop
     - 3 [1, 2, 3, 4, 5], and init [1, 2, 3] are evaluated.
     -}

    {-|
     - 3. Without looking at the definitions from the standard prelude, define the
     - following library functions using recursion.
     - – Decide if all logical values in a list are True: and :: [Bool]→Bool
     - – Concatenate a list of lists: concat :: [[a]]→[a]
     - – Produce a list with n identical elements: replicate :: Int→a→[a]
     - – Select the nth element of a list: (!!) :: [a]→Int→a
     - – Decide if a value is an element of a list: elem :: Eqa⇒a→[a]→Bool
     -}

    and' :: [Bool] -> Bool
    and' [] = True
    and' (x : xs)
      | x = and' xs
      | otherwise = False

    concat' :: [[a]] -> [a]
    concat' [] = []
    concat' (x : xs) = x ++ concat' xs

    replicate' :: Int -> a -> [a]
    replicate' 0 a = []
    replicate' n a = a : replicate (n - 1) a

    get' :: [a] -> Int -> a
    get' [] _ = error "Empty array"
    get' xs a
      | length xs < a = error "out of bound"
    get' (x : xs) 0 = x
    get' (x : xs) n = get' xs (n - 1)

    elem' :: Eq a => a -> [a] -> Bool
    elem' _ [] = False
    elem' a (x : xs)
      | x == a = True
      | otherwise = elem' a xs

    {-|
     - 4. Define a recursive function merge :: Ord a ⇒ [a] → [a] → [a] that merges
     - two sorted lists to give a single sorted list. For example:
     - > merge[2,5,6][1,3,4] [1,2,3,4,5,6]
     - Note: your definition should not use other functions on sorted lists such as
     - insert or isort, but should be defined using explicit recursion.
     -}

    merge :: Ord a => [a] -> [a] -> [a]

    merge [] xs = xs
    merge xs [] = xs
    merge (x : xs) (y : ys)
      | x <= y = merge xs (x : (y : ys))
      | otherwise = y : (merge (x : xs) ys)

    {-|
     - 5. Using merge, define a recursive function msort :: Ord a ⇒ [a ] → [a ] that
     - implements merge sort, in which the empty list and singleton lists are
     - already sorted, and any other list is sorted by merging together the two
     - lists that result from sorting the two halves of the list separately.
     - Hint: first define a function halve :: [a ] → [([a ], [a ])] that splits a
     - list into two halves whose lengths differ by at most one.
     -}

    halve :: [a] -> ([a], [a])
    halve xs = (take n xs, drop n xs)
               where n = length xs `div` 2

    first :: (a, b) -> a
    first (a, b) = a

    second (a, b) = b

    msort :: Ord a => [a] -> [a]

    msort [] = []
    msort [a] = [a]
    msort xs = merge (msort firstHalf) (msort secondHalf)
               where
                 firstHalf = first halves
                 secondHalf = second halves
                 halves = halve xs

    {-|
     - 6. Using the five-step process, define the library functions that calculate
     - the sum of a list of numbers, take a given number of elements from the start
     - of a list, and select the last element of a non-empty list.
     -}

    --what?


## Chapter 7 - Higher-order functions

### 7.1. Basic concepts

- Function that takes a function as an argument or returns a function as a
  result is called higher-order.

### 7.2. Processing lists

- _map_
  - _map_ is polymorphic, it can be applied to any type.
  - Can applied to itself to process nested list. For example:
      map (map (+1)) [[1, 2, 3], [4, 5]]
- _filter_
- _all_
- _any_
- _takeWhile_
- _dropWhile_

### 7.3. The _foldr_ function

- Pattern:
    f [] = v
    f (x : xs) = x (+) f xs
- Can think of foldr as:
  - Replace each _cons_ operator of a list by function _f_
  -  Replace empty list in the end by value _v_

### 7.4. The _foldl_ function
### 7.5. The composition operator

- Composition is associative.

### 7.6. String transmitter
#### Binary numbers
#### Base conversion
#### Transmission
### 7.7. Chapter remarks
### 7.8. Exercises

    {-|
     - 1. Show how the list comprehension [ f x | x ← xs , p x ] can be re-expressed
     - using the higher-order functions map and filter .
     -}

    ex11 f p x = map f (filter p x)
    ex12 f p = map f . filter p


    xs = [2, 1, 3, 5, 4]
    test11 = ex11 (+1) even xs == [3, 5]
    test12 = ex12 (+1) even xs == [3, 5]
    test1 = test11 && test12

    {-
     - 2. Without looking at the definitions from the standard prelude, define the
     - higher-order functions all, any, takeWhile, and dropWhile.
     -}

    all' :: (a -> Bool) -> [a] -> Bool
    --all' p xs =  and (map p xs)
    all' p xs =  and (map p xs)


    any' :: (a -> Bool) -> [a] -> Bool
    --any' p xs = or (map p xs)
    --any' p = not . null . dropWhile(not . p)
    --any' p xs = length (filter p xs) > 0
    --any' p xs = not (all (\ x -> not (p x)) xs)
    --any' p xs = foldr (\ x acc -> (p x) || acc) False xs
    any' p xs = foldr (||) False (map p xs)

    takeWhile' :: (a -> Bool) -> [a] -> [a]
    {-
    takeWhile' _ [] = []
    takeWhile' p (x : xs)
      | p x = x : takeWhile' p xs
      | otherwise = []
     -}
    takeWhile' p = foldr (\ x acc -> if p x then x : acc else []) []


    dropWhile' :: (a -> Bool) -> [a] -> [a]
    {-
    dropWhile' p = foldl add []
      where add [] x = if p x then [] else [x]
            add acc x = acc ++ [x]
     -}

    dropWhile' _ [] = []
    dropWhile' p (x : xs)
      | p x = dropWhile' p xs
      | otherwise = x: xs
    sample21 = [1, 3, 5, 2]
    sample22 = [2, 4, 6]
    sample23 = [3, 5]
    p = even

    test21 = all' p sample21 == False
    test22 = all' p sample22 == True
    test23 = all' p sample23 == False
    test2a = test21 && test22 && test23

    test24 = any' p sample21 == True
    test25 = any' p sample22 == True
    test26 = any' p sample23 == False
    test2b = test24 && test25 && test26

    test2 = test2a && test2b

    {-
     - 3. Redefine the functions map f and filter p using foldr .
     -}

    --map' f = foldr (\ x xs -> [f x] ++ xs) []
    map' f = foldl (\ xs x -> xs ++ [f x]) []

    filter' p = foldr (\ x xs -> if p x then x : xs else xs) []

    operator3 = (+1)
    test31 = map' operator3 xs == map operator3 xs

    {-
     - 4. Using foldl,define a function dec2int::[Int]→Int that converts a decimal
     - number into an integer. For example:
     - > dec2int [2,3,4,5]
     - 2345
     -}

    dec2int :: [Int] -> Int
    dec2int = foldl (\ x y -> y + x * 10) 0

    {-
     - 5. Explain why the following definition is invalid:
     - sumsqreven = compose [sum,map (↑2),filter even]
     -
     - Khong biet lam roi :(
     -}

    compose :: [a -> a] -> (a -> a)
    compose = foldr (.) id

    sumsqreven = compose [map (^2), filter even, filter (\ x -> x `mod` 3 == 0)]

    abc = sum . map (^2) . filter even
    ys = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    {-
     - 6. Without looking at the standard prelude, define the higher-order library
     - function curry that converts a function on pairs into a curried function,
     - and, conversely, the function uncurry that converts a curried function with
     - two arguments into a function on pairs.
     - Hint: first write down the types of the two functions.
     -}

    curry' :: ((a, b) -> c) -> a -> b -> c
    curry' f = \ x y -> f (x, y)

    uncurry' :: (a -> b -> c) -> ((a, b) -> c)
    uncurry' f = \ (a, b) -> f a b

    {-
     - 7. A higher-order function unfold that encapsulates a simple pattern of
     - recursion for producing a list can be defined as follows:
     -
     - unfold p h t x
     -    |p x = []
     -    |otherwise = h x :unfold p h t (t x)
     -
     - That is, the function unfold p h t produces the empty list if the predicate p
     - is true of the argument, and otherwise produces a non-empty list by applying
     - the function h to give the head, and the function t to generate another
     - argument that is recursively processed in the same way to produce the tail of
     - the list. For example, the function int2bin can be rewritten more compactly
     - using unfold as follows:
     -
     - int2bin = unfold (== 0) (‘mod‘2) (‘div‘2)
     -
     - Redefine the functions chop8 , map f and iterate f using unfold .
     -}

    unfold p h t x
      |p x = []
      |otherwise = h x :unfold p h t (t x)
    type Bits = Integer

    chop8 :: [Bits] -> [[Bits]]
    chop8 = unfold (== []) (take 8) (drop 8)

    bits = [1,0,0,0,0,1,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0]

    map'' :: (a -> b) -> [a] -> [b]
    map'' f = unfold null (f.head) tail

    operator7 = (+2)
    test7 = map operator7 xs == map'' operator7 xs

    iterate' :: (a -> a) -> a -> [a]
    iterate' f = unfold (const False) id f

    iterate71 = iterate (*2) 2
    iterate'711 = iterate' (*2) 2
    test71 = take 5 iterate71 == take 5 iterate'711

## Chapter 8 - Functional parsers

### 8.1. Parsers

- Is a program takes a string of characters, and produces some form of tree that
  makes the syntactic structure of the string explicit.
- That means parser take a string as its input. Then produce an output as a tree form which expose the syntax of the string in a clear representation.
- Parser is useful to reduce compute when it comes to the main program by pre-processing the input.

### 8.2. The parser type

- `type Parser = String -> Tree`
- Parser may not consume entire the input string, so `type Parser = String -> (Tree, String)`
- Parser may fail. We generalize our result type as a list of result. So empty list denotes failure, while singleton list denotes success: `type Parser -> [(Tree, String)]`
- Then we can embed the type of different input into the type of the parser: `type Parser a = String -> [(a, String)]`

### 8.3. Basic parsers

- _return_: always succeeds, leave the input unchanged.
    return :: a -> Parser a
    return v = \inp -> [(v, inp)]

- _failure_: always fails
    failure :: Parser a
    failure = \inp -> []

- _item_: fails if input is empty, succeeds with the first character as the result.
    item :: Parser Char
    item = \inp case inp of
                    [] -> []
                    (x : xs) -> [(x, xs)]

- _parse_: applies the parser to the input string.
    parse :: Parser a -> String -> [(a, String)]
    parse p inp = p inp

### 8.4. Sequencing

- >>=:
    (>>=) :: Parser a -> (a -> Parser b) -> Parser b
    p >>= f = \inp -> case parse p inp of
                          [] -> []
                          [(v, out)] -> parse (f v) out

- _do_ combines a chain of _generators_

### 8.5. Choice

- +++: _or else_, receive two parsers, applies the first, if this fails to apply the second instead.
    (+++) :: Parse a -> Parse a -> Parse a
    p +++ q = \ inp -> case parse p inp of
                           [] -> parse q inp
                           [(v, out)] -> [(v, out)]

### 8.6. Derived primitives

- Note: without an introduction to Monad, the cod in book just won't work, use this instead. (Copied from http://stackoverflow.com/a/6666706/1924463)

    import Data.Char
    type Parser a = String -> [(a, String)]

    parse :: Parser a -> String -> [(a, String)]
    parse p inp = p inp

    return' :: a -> Parser a
    return' v = \ inp -> [(v, inp)]

    failure :: Parser a
    failure = \ inp -> []

    item :: Parser Char
    item = \ inp -> case inp of
                     [] -> []
                     (x : xs ) -> [(x , xs)]

    (>>>=) :: Parser a -> (a -> Parser b) -> Parser b
    p >>>= f = \inp -> case parse p inp of
                        [] -> []
                        [(v, out)] -> parse (f v) out

    (+++) :: Parser a -> Parser a -> Parser a
    p +++ q = \inp -> case parse p inp of
                        [] -> parse q inp
                        [(v, out)] -> [(v, out)]

    sat :: (Char -> Bool) -> Parser Char
    sat p = item >>>= (\ x -> if p x then return' x else failure)

    _digit :: Parser Char
    _digit = sat isDigit

    many :: Parser a -> Parser[a]
    many p = many1 p +++ return []
    many1 :: Parser a -> Parser [a]
    many1 p = p >>>= (\ v -> (many p) >>>= (\ vs -> return' (v : vs)))

### 8.7. Handling spacing
### 8.8. Arithmetic expressions
### 8.9. Chapter remarks
### 8.10. Exercises

## Chapter 9 - Interactive programs
## Chapter 10 - Declaring types and classes
## Chapter 11 - The countdown problem
## Chapter 12 - Lazy evaluation
## Chapter 13 - Reasoning about programs

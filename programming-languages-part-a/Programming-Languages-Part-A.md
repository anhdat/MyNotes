#Programming Languages - Part A
From: https://www.coursera.org/learn/programming-languages/home/welcome
Professor: Dan Grossman from University of Washington

##Overview 

What:

- Introduction to basic concept of programming languages
- Emphasis on functional programming

- How any languages "fit together"
- -> make learners effective in programming / learning new languages

- many languages -> thinking deeply about how to use language, and write elegant programs
- functional programming -> robust, composeble programs


Goals:

- Accurately understands FP and OOP
- Skill to learn new languages
- Master language concepts `like, the main points of language?`
- Evaluate power and elegance of a language
- Reasonable efficient in ML, Racket and Ruby

I will have fun learning to think in a new way


### Approximate List of Specific Course Topics

Mark every line by hand

Part A:

- Syntax vs. semantics vs. idioms vs. libraries vs. tools
- ML basics (bindings, conditionals, records, functions)
- Recursive functions and recursive types
- Benefits of no mutation
- Algebraic datatypes, pattern matching
- Tail recursion
- Higher-order functions; closures
- Lexical scope
- Currying
- Syntactic sugar
- Equivalence and effects
- Parametric polymorphism and container types
- Type inference
- Abstract types and modules

Part B:

- Racket basics
- Dynamic vs. static typing
- Laziness, streams, and memoization
- Implementing languages, especially higher-order functions
- Macros
- Eval

Part C:

- Ruby basics
- Object-oriented programming is dynamic dispatch
- Pure object-orientation
- Implementing dynamic dispatch
- Multiple inheritance, interfaces, and mixins
- OOP vs. functional decomposition and extensibility
- Subtyping for records, functions, and objects
- Class-based subtyping
- Subtyping
- Subtyping vs. parametric polymorphism; bounded polymorphism

## Week 1

To-Do list:

- [x] Watch video on: motivation, assume background, logistics
- [x] Read course policies
- [x] Install software
- [x] Play with Homework 0
- [x] Proceed to Section 1


## Week 2

### ML Expression and Variable Binding

- ML program = sequence of *bindings*

```
binding
   |
   v
type check <- static environment: types of preceding bindings ~ *context*
   |
   v
evaluate <- dynamic environment: values of preceding bindings ~ *environment*
```

- Always ask:
    - Syntax: how it be written
    - Type-check rules: how to determine the type from current static environment
    - Evaluation rules: how to determine the value from current dynamic environment

- e.g.:
    - Integer contants: sequence of digit. always has type of `int`. is a value (Evaluated to itself)
    - Boolean contants: either `true` or `false`. always has type of `bool`. is a value.
    - Variables: sequence of letters/underscores... type: look up variable in context.
    value: look up value of variable in environment.
    - Addition: `e1 + e2`. type `int` if both `e1` and `e2` are int. sum of `v1` (value of `e1`) and v2.
    - Conditionals: `if e1 then e2 else e3`. type: bool if e1: bool and e2 same type with e3.
    - Less-than comparison: `e1 > e2`. type: bool if e1 and e2 both are `int`

### Using `use`

`use "foo.sml";`

### Variables are immutable

- bindings are immutable
- no assigment statement
- instead, it creates a *different environment* which *shadows* the earlier one

### Function bindings

Example:

```sml

fun pow (x:int, y:int) = (* correct only for y >= 0 *)
    if y=0
    then 1
    else x * pow(x,y-1)
```

Should do the very same like other bindings:

Syntax:

`fun func_name (x1: t1, ..., xn: tn) = e`

Type checking:

- Type check body: in static environment, map x1 -> t1 ... xn -> tn and x0 to x1 * ... * xn -> t


### Pairs and other tuples
### List

Why pure functional languages like ML and Haskell can have tail recursion while C, Python don't?
ML may be language has the worst error messages ever.

### Let Expressions

This creates local scope for variables and functions

### Options

Cool, this is the same in Swift.

### Some other expresstions and operator
### Lack of mutation and Benefits Thereof
### The Pieces of Programming Languages

Professor Grossman seems to have a big hate to Java. Always 'some language', 'real pain'.

Pieces:

- Syntax
- Semantics
- Idioms
- Libraries
- Tools

Must to remember this course will only focus on Semantics and Idioms. The others can be learnt
through working with the language (Syntax) and should be language agnostic (Libraries, Tools)

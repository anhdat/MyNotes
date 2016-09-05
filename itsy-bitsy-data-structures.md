From: https://github.com/thejameskyle/itsy-bitsy-data-structures

Data structure:

Why:

- Manage complexity -> simpler flow: Simplify complicated logic
- higly-performant, memory effcient 

What:

- Methods to store and organize data -> serve different needs

Algorithm:

- fancy name for -> step-by-step sets of operations

Big-O notation

What:

- roughly measure performance -> compare -> discuss
- two things to measure: time and space complexity

Commons:

Name | Notation | How you feel
---------------
Constant | O(1) | awesome
Logarithmic | O(log N) | Great
Linear | O(N) | okay
Linearithmic | O(N log N) | ugh..
Polynominal | O(n ^ 2) | shitty
Exponential | O(2 ^ n) | horrible
Factorial | O(n!) | WTF


```
         ┌─────────┐    ┌─────────┐                                         
         │ O (n!)  │    │O (n ^ 2)│                                         
▲        └─────────┘    └─────────┘      ┌────────────┐                     
│             *             **           │O (n log n) │                     
│             *             *            └────────────┘         ┌─────────┐ 
│             *             *                 **                │  O (n)  │ 
│             *            **                **                 └─────────┘ 
│             *            *                **                      *       
│             *            *                *                     ***       
│            *            **               **                  ***          
│            *            *               **                 **             
│            *            *              **               ***               
│            *           **              *              ***                 
│            *           *             **             **                    
│            *          **            **            **                      
│           *          **            **          ***                        
│           *          *           **          **                           
│           *         *           *         * *                             
│          *         **         **       * *                    ┌─────────┐ 
│          *        *         **       *                        │  O (1)  │ 
│          *        *        *      **                          └─────────┘ 
│         **       *        *     *         ******** ************           
│  ** ** **** * ********* *** **************                                
│**      *       **      *   *                                              
│       *      **      ****                                                 
│      *     ***    ****                                                    
│     *    *** * * *                                             ┌─────────┐
│   *   *****                                                    │O (log n)│
│  ** *****                                  ********************└─────────┘
│ ****** * ** ************ *** **     ********                              
└───*────────────────────────────*****─────────────────────────▶            

```

4 primary types of actions:

- Accessing
- Searching
- Inserting
- Deleting

Data structures may be at good ad one action but bad at another


                   Accessing | Searching | Inserting | Deleting
--------------------
Array              | O(1) | O(N) | O(N) | O(N)
Linked list        | O(N) | O(N) | O(1) | O(1)
Binary Search Tree | O(log N) | O(log N) | O(log N) | O(log N)

0-index reading like array: because first chunk of memory, we read from 0 to 1

## List

What:

- Ordered
- Sequence of values
- One value may appear multiple times

Adding and removing item with list

- Push: add to the end -> O(1)
- Pop: remove at the end -> O(1)
- Unshift: add value to the start -> O(N)
- Shift: remove value from the start -> O(N)

## Hash table

What:

- Unordered
- 'keys' and 'values'
- Compute address in memory using the key
- Key must be 'hashable' 

Hashing:

- key -serialize-> unique number
- keys are limited
- values are unlimited -> chance of collisions


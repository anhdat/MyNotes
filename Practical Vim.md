Practical Vim.md

Changed.
Changed again.

## Foreword
No one does it alone. The author has a great support from friends, colleagues
and two wonderful women.

Practical Vim is presented under "tips" format. "Tips" help you solve things,
but not make you feel like Vim master. Should see this book's approach as
problem/solution.

## Read Me
"...in the hands of an expert, Vim shreds text at the speed of thought..."
Vim is available everywhere, from a remote server over SSH or local instance of
GVim.
Powerful tool.
**How This Book is Structured**
Is a recipe book. NOT to read from start to finish.
Some tips are self contained, many are cross-referenced.
Novice might prefer read the early tips of each chapter.
Advanced reader might choose to focus on the later tips or move around the book
as needed.
**A Note on the Examples**
In Vim, there's always more than one way to complete any given task.
So try to find a resemblance of the solution in this book to our real life
problems.
**Learn to Touch Type, Then Learn Vim**
If not the benefits of learning Vim wouldn't come fast.
Vim is developed from classic Unix editors like *vi* and *ed*, these predate
the mouse and point-and-click interface.

## Read the Forgotten Manual
**Get to know Vim's Built-in Documentation**
**Playing melodies**
Using keyboard with Vim is much like playing on the piano keyboard.
We can play one note.
A sequence. Or a Chord.
**Use Vim's Factory Settings**
$ vim -u NONE -N
"- NONE" means not to source vimrc
"- N" means set nocompatible
Specify vimrc file:
$ vim -u code/essential.vim
**On the Role of Vim Script**
It's huge, so the book doesn't want to cover it all.
**On Vim Versions**
7.3
GUI or TUI doesn't matter anyway.

## 1. The Vim Way

### Tip 1. Meet the Dot Command
The dot command let us repeat the last change.
**The change** 
is the command x, dd, > for example
or everytime we dip into Insert mode until we return to Normal mode.
**-> The Dot command is a mini macro**

### Tip 2. Don't Repeat yourself
Combine a$ to A
C = c$ '' Replace to the end of line
s = cl '' Replace left character
S = ^C '' Replace line
I = ^i '' Insert at the begining of line
A = $a '' Insert at the end of line
o = A<CR> '' Insert a blank line after
O = ko '' Insert a blank line before

### Tip 3. Take One Step Back, Then Three Forward
Try to find solution to utilize ; and . by using search and "change" notion.
'f+' search for next appearance of '+'
';' repeat that search

### Tip 4. Act, Repeat, Reverse
When we guide our solution to be repeatable in both motion and change, we should
have a way to reverse when mistyping or error happens.

Act | Repeat |Reverse

{edit}              .       u
f{char}/t{char}     ;       ,
F{char}/T{char}     ;       ,
/pattern<CR>        n       N
?pattern<CR>        n       N
:s/target/replacement &     u
qx{change}q         @x      u

### Tip 5. Find and Replace by Hand
we can use :substitute or by finding by hand using '/' command and ' * ' then
repeat it to move to place we want, then repeat the last change.

### Tip 6. Meet the Dot formula
After all above examples, we can see the strategy we're trying to get is:
**The Ideal: One Keystroke to Move, One Keystroke to Execute** 

# Part I - Modes
## 2. Normal Mode

### Tip 7. Pause with Your Brush Off the Page.
Ah, Normal mode makes sense now. This is the second time that I was converted by
being introduced to a different perspective.
The first time is when they say "Using Vim in Normal mode likes someone's
holding a <C> key for you".
Then this time, they say "Using Vim is just like a painter with his painting.
Only half of the working time, he use the brush to 'change' the canvas. The
other half he has to study the object, adjust the lightning, and mixes paint to
the new hue".
Yah. It explains a lot.

### Tip 8. Chunk Your Undos.
Utilize 'u' command to undo to work well with your flow of thought.
If you've paused for long enough to ask the question, "Should I leave the Insert
mode?" then do it. 
For more hardcore, the author even tend to use <Esc>o than press <CR> when in
insert mode.

### Tip 9. Compose Repeatable Changes
Make your changes combine to one action of change, then you can utilize the Dot
command, far more than that, it has a better notion when try to repeat later or
combine to a more complex sequence of actions.
Practical action: delete a word 'daw'

### Tip 10. Use Counts to Do Simple Arithmetic
cW to change the whole word, means till the space parts us.
<C-a> jump to the next or the current number, increase that number by 'count'.
<C-x> same as <C-a> but decrease.

### Tip 11. Don't Count If You Can Repeat
The title is clear enough.

### Tip 12. Combine and Conquer
**Operator + Motion = Action**
:h operator

Trigger     Effect
c           Change
d           Delete
y           Yank into register
g~          Swap case
gu          Lower case
gU          Uppercase
\>           Shift right
<           Shift left
=           Autoindent
!           Filter {motion} lines through an external program \\TODO: Khong hieu

 

## 3. Insert Mode

### Tip 13. Make Corrections Instantly from Insert Mode
### Tip 14. Get Back to Normal Mode
### Tip 15. Paste from a Register Without Leaving Insert Mode
### Tip 17. Insert Unusual Characters by Character Code.
### Tip 18. Insert Unusual Character by Digraph
### Tip 19. Overwrite Existing Text with Replace Mode

## 4. Visual Mode
## 5. Command-Line Mode

# Part II - Files
## 6. Manage Multiple Files
## 7. Open Files and Save Them to Disk

# Part III - Getting Around Faster
## 8. Navigate Inside Files with Motions
## 9. Navigate Between Files with Jumps

# Part IV - Registers
## 10. Copy and Paste
## 11. Macros

# Part V - Patterns
## 12. Matching Patterns and Literals
## 13. Search
## 14. Substitution
## 15. Global Commands

# Part VI - Tools
## 16. Index and Navigate Source Code with ctags
## 17. Compile Code and Navigate Errors with the Quickfix List
## 18. Search Project-Wide with grep, vimgrep, and Others
## 19. Dial X for Autocompletion
## 20. Find and Fix Typos with Vim's Spell Checker
## 21. Now What?

# A1. Customize Vim to Suit Your Preferences

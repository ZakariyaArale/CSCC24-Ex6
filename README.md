# Untyped Lambda Calculus

## Introduction
In CSCC24, one of the main concepts that we’ve learned and used throughout the various programming languages (Racket, Java, Haskell, etc.) was lambda expression, functions (without a name) that specify the operation given a set of input values. They are treated as first class values meaning they can be passed as arguments, be returned as a result, and stored in data structures.

For instance if we consider the expression 
```bash
\x y -> x + y
```
This is an function that take two values and return the sum. This is also a lambda expression, the expression doesn’t have a concrete name (like add_two_num) while specifying the arithmetic operation being applied to two inputted values.

Additionally we can pass is as argument of functions such as in foldr,
```bash
sumList = foldr \x y -> x + y 0 
```
returned as a a result
```bash
Sum_two = \x y -> x  + y
```
And stored in data structure 

data Expression  = Func (a -> a -> a) (please refer to **Sum.hs** for code)

However a function 

def sum_two(x, y):
    return x + y

Isn't a lambda expression as we are providing a name to the sum_two function via def.

While lambda expressions were an enjoyable topic to learn about, allowing us to express complex algorithms in just a few lines of code (such as in Lab 3, where we computed the transpose of a matrix in a single line, or used function composition to optimize stack space in CPS lecuture), if you’re like me, you may have noticed that we never developed a fully formal understanding of what really is Lambda Calculus. If I were to ask a C24 student what lambda calculus is, they might say something like “it’s a terminology that describes lambda expressions.” While lambda expressions are an important part of lambda calculus, as we will see in this lecture, this explanation only gives a “loose” view of the subject.

Similar to how we learn a new programming language in this course, we will first become familiar with the definition of lambda calculus and its syntax, relating it to concepts we have already covered. We will then expand our understanding by exploring how computation and operations we often take for granted in this course can be represented from a lambda calculus perspective (ie. arithmetic operators, boolean expression). Finally, we will conclude with a breif discussion the importance of lambda calculus in the field of computer science and why it's more than a convenient way of finding the transpose of a matrix.

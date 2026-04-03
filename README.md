# Untyped Lambda Calculus

## Introduction
In CSCC24, one of the main concepts that we’ve learned and used throughout the various programming languages (Racket, Java, Haskell, etc.) was lambda expression, functions (without a name) that specify the operation given a set of input values. They are treated as first class values meaning they can be passed as arguments, be returned as a result, and stored in data structures.

For instance if we consider the expression 

\x y -> x + y 

This is an function that take two values and return the sum.

This is also a lambda expression. The expression doesn’t have a concrete name (like add_two_num), and it specifies that it is adding two values.

Additionally we can pass is as argument of functions such as in foldr

sumList = foldr \x y -> x + y 0 

Returned as a a result

Sum_two = \x y -> x  + y 

And stored in data structure 

data Expression  = Func (a -> a -> a)

However a function 

def sum_two(x, y):
    return x + y

Isn't a lambda expression as we are providing a name to the sum_two function via def.


While lambda expressions were an enjoyable topic to learn about allowing us to express complex algorithms in just a few lines of code (such as in Lab 3, where we computed the transpose of a matrix in a single line, or used function composition to optimize stack space in CPS), if you’re like me, you may have noticed that we never developed a fully formal understanding of what really is Lambda Calculus. If I were to ask a C24 student what lambda calculus is, they might say something like “it’s a terminology that describes lambda expressions.” While lambda expressions are an important part of lambda calculus, as we will see in this lecture, this explanation only gives a “loose” view of the subject.
Similar to how we learn a new programming language in this course, we will first become familiar with the definition of lambda calculus and its syntax, relating it to concepts we have already covered. We will then expand our understanding by exploring how computation and operations we often take for granted in this course can be represented from a lambda calculus perspective (ie. booleans, and conditional statements). Finally, we will conclude by discussing the importance of lambda calculus in the field of computer science and why it's more than a convenient way of finding the transpose of a matrix.

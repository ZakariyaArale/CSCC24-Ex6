# Untyped Lambda Calculus

## Introduction
In CSCC24, one of the main concepts that we’ve learned and used throughout the various programming languages (Racket, Java, Haskell, etc.) was **lambda expression**, functions (without a name) that specify the operation given a set of input values. They are treated as first class values meaning they can be passed as arguments, be returned as a result, and stored in data structures.

For instance if we consider the expression 
```bash
\x y -> x + y
```
This is an function that take two values and return the sum. This is also a lambda expression, the expression doesn’t have a concrete name (like add_two_num) while specifying the arithmetic operation being applied to two inputted values.

Additionally we can pass is as an argument for functions such as in foldr,
```bash
sumList :: Num a => [a] -> a
sumList = foldr \x y -> x + y 0 
```
returned as a result,
```bash
sum_two_helper :: Num a => b -> a -> a -> a
sum_two_helper = \b x y -> x + y

sum_two :: Num a => a -> a -> a
sum_two = sum_two_helper "I love C24"
```
(sum_two is the result of passing "I love C24" to our helper function, the result being \x y -> x + y, the sum expression we previously talked about).
and stored in data structures,
```bash
data Expression a = Func (a -> a -> a) 

sum_two' :: Num a => Expression a
sum_two' = Func(\x y -> x + y)
```
showing that the sum expression is a first class value.
(please refer to **Sum.hs** for code)
However functions that provide a name for its computation such as 
```bash
def sum_two(x, y):
    return x + y
```
in Python isn't a lambda expression as we are providing an explict name to the function via the def keyword.
(please refer to **sum.py** for code)

While lambda expressions were an enjoyable topic to learn about in this course, allowing us to express complex algorithms in just a few lines of code (such as in Lab 3, where we computed the transpose of a matrix in a single line of code, or used function composition to optimize stack space in the CPS lecuture), if you’re like me, you may have noticed that we never developed a formal understanding of what really is Lambda Calculus. If I were to ask a C24 student what Lambda Calculus is, they might say something like “it’s a terminology that describes lambda expressions.” While lambda expressions are an important part of Lambda Calculus, as we will see in this lecture, this explanation only gives a “loose” view of the subject.

Similar to how we learn a new programming language in this course, we will first become familiar with the definition of Untyped (ie. we omit talking about explict datatypes like Int, Strings, ...) Lambda Calculus and its syntax, relating it to concepts we have already covered in the C24 course. We will then expand our understanding by exploring how computation and operations we often take for granted in this course can be represented from a Lambda Calculus perspective (ie. arithmetic operators, boolean expression). Finally, we will conclude with a breif discussion the importance of lambda calculus as aspiring computer scientists and SWE why it's more than a convenient way of finding the transpose of a matrix.

(**Side Note: When talking about Lambda Calculus I'll implictly be refering to Untyped Lambda Calculus**)

## What is Lambda Calculus?
Before we can define what lambda calculus really is, we’ll start by defining the basic terminology used in Lambda Calculus

We’ll begin by defining what a lambda expression is in Lambda Calculus.

Let `E` be the set of lambda expressions [We’ll define this set using structural induction, we all can benefit with some practice with structural induction :) ]:

Base Case:  
- Variables: If `x` is a variable then `x ∈ E`

Induction Step:
- Abstraction: If `x` is a variable and `e ∈ E` then `λx.e ∈ E`
- Application: If `e1 ∈ E`, `e2 ∈ E` then `(e1 e2) ∈ E` 

Let's start with defining what a variable is. 

### Variables

A variable is a symbol that is a placeholder for some arbitrary value.

For instance if I have the symbol x, without any “context” we don’t know what x represents. If we give x more “context”, we can replace the symbol with the given “context”.

(You may have noticed that I put quotes on the word context, we’ll talk about what “context” means in Lambda Calculus shortly)

On the flip side, constants like the integer `1` or the string `“hello world”` aren't variables. The value of both constants is fixed and can’t be changed. 

### Abstractions
An abstraction represents a function in Lambda Calculus

Recall from MATA31, a function defines a mapping from a set of input values to the set of output values where each input value maps to exactly one output value.

For example, the relation $f(x) = x^5 + 1$ where $f : \mathbb{R} \to \mathbb{R}$ is a function, it maps an arbitrary real number $x$ to only $x^5 + 1$. 
However, the relation $g(x) = \pm \sqrt{x}$  where $g : \mathbb{R}_{\ge 0} \to \mathbb{R}$ isn’t a function. If I consider the value $x = 1$, $g(1)$ maps to both $-1$ and $1$ (not all elements in the domain map to a unique element of the codomain). 

An abstraction consists of 4 components: 
- A lambda symbol to represent that the expression is a function
- An input variable
- An output expression
- A dot to separate the input variable and the output expression (it represent equality of the function to the output expression)
Symbolically abstractions are of the form
- `λx.e` where `x` is a variable and `e` is an expression

For instance, if we consider `λx.x`, it is a function as it maps the value (the x is a placeholder of) to itself. Additionally the function is of the form `λx.e`. Therefore, `λx.x` is an expression more specifically its an abstraction.

This function should look very familiar. Beside the difference in syntax, this is exactly how we’ve defined the identity function in Racket in the CPS lecture.
As a refresher this is the identity function in Racket
```bash
(define identity' (λ (x) (x)))

;In each example, the return value is the inputted value
(identity' 9)
(identity' '(C . 24))
```
(please refer to **identity.rk** for code)

However, if we consider `λx.1`, while the statement represents a function as it maps the value (the x is a placeholder of) to the constant value 1, the constant 1 isn’t a valid expression (note that constants aren’t defined in the definition of expressions). Thus the function `λx.1` isn’t an expression. This is interesting as we can do this for lambda expression we've learned in this course. As an example in Rxcket we can do
```bash
(define identity' (λ (x) 1))

;In each example, the return value is 1
(identity' 9)
(identity' '(C . 24))
```
(please refer to **one.rk** for code)
This should highlight the fact that Lambda Calculus isn't just the lambda expression we've experience with in this course. 

### Applications
An application represents the process of providing an argument to an expression.

This is “similar-ish” to function application in Racket (as you have seen in the previous examples), where we pass arguments to a function by placing them inside parentheses after the function name.

For instance if I have the statement  `(λx.x) y`, as `λx.x` is an expression (application) and `y` is an expression (variable). Thus the statement `(λx.x) y` is an expression, more specifically it’s an application.

The expression translates to “for the function `λx.x`, provide the function with the argument `y`”.

However, `(λx.x) “hello world”` isn't a valid expression. As discussed previously, constants aren’t allowed in expressions (which is why I emphasise “similar-ish” when discussing function application in Racket, in Racket we can pass constants as arguments to a function). Again, this should highlight the fact that Lambda Calculus isn't just the lambda expression we've experience with in this course. 

### Beta Reduction
In order to evaluate and application (in other words function application), it is done through a  process called beta reduction. Similar to function application in Racket, beta reduction works by replacing every occurrence of the bound variable in the function body with the given argument, and then returning the resulting expression (output).

For instance if I have the expression `(λx.x) y`, applying beta reduction gives us the result `y`. We provide `y` as an argument to the function `(λx.x)`, replace each instance of `x` with `y`, and finally return the output of the expression.

We typically denote beta-reduction using an arrow labeled with `β` ($\to_{\beta}$):

Additionally, performing beta reduction, the following notation is sometimes used to denote subtituion,  `e[y/x]`. This translates to "given the output expression e, return the expression e by replace every instance of x with y". 

Before we move to examples of beta reduction, I would like to brush-up on what is a free variable and what's a bound variable in Lambda Calculus (you should be really familar with it by now from the closure and type inference lessons but we'll define it using Lambda Calculus syntax).

Bound variable are variables that are restricted to a particular function's argument, otherwise they’re free. In lambda calculus, a variable x is free iff there exists an abstraction such that x is an input variable. 

For instance, in the expression  `(λx.x) y`,  `x` is a bound variable as it’s used as input as a lambda function while `y` is a free variable, there doesn’t exist an abstraction that uses y as an input variable.

Another example is  `(λx.x) (λy.y)`, both x and y are bound variables and they’re both tied to a lambda function.

When performing beta reduction, its important the you only replace free variable and NOT bound variables, replacing bound variables is invalid beta reduction (hopefully this should be relatively intuitive, imagine replace an unintentional part of the function via your reduction, this would result in invalid lambda or unexpected behaviour).

Now we're ready to perform some beta reduction :)!

Applying beta reduction to `(λx.x) y` gives the following result

`(λx.x) y` $\to_{\beta}$ `y`, it is equivalently written as `(λx.x) y` $\to_{\beta}$ `x [y/x]`

Applying beta reduction to `(λx.x) (λy.y)` gives the following result

`(λx.x) (λy.y)` $\to_{\beta}$ `(λy.y)`, it is equivalently written as `(λx.x) (λy.y)` $\to_{\beta}$ `x [(λy.y)/x]`

Note while x is a bound variable for the expression `(λx.x)` when applying beta reduction, we look at the output expression we are subtituing to. In this case it's the variable `x`. Notice there no application associated to the variable `x` thus, performing `x [(λy.y)/x]` is a valid beta reduction.

An invalid beta reduction is the lamnda expression `(λx.(λx.x)) y` and doing `(λx.(λx.x)) y`  $\to_{\beta}$ `(λx.x) [y/x]`, `x` in the output expression `(λx.x)` is bounded by an application.

### Definition of Lambda Calculus

Now we’re ready to discuss what is Lambda Calculus?

Lambda calculus is a programming language (developed by Alonzo Church in 1936) that consists of lambda expressions and substitutions. It is often described as “the smallest universal programming language,” meaning that any computation can be represented as an equivalent lambda expression. This idea is supported by the Church-Turing thesis, which states that any computation that can be expressed algorithmically can be modeled by a Turing machine which has an eqivalent representation in lambda calculus.

To motivate the Church-Turing thesis let’s tackle a challenge that you’ve noticed in the language, the lack of constants (ie. integers, strings, …).

## Basic Algorithms in Lambda Calculus

Let’s consider one of the simplest binary operations we first learn in Racket and Haskell: addition. For simplicity, we will work with the natural numbers.
In order to define natural number addition, we first need a number system that uses only functions. To do this, we take inspiration from Lab 9, where we did not (yet) have access to arithmetic operations in Prolog and instead represented numbers using the number of functor composition applied to a term.
Recall that we represented natural numbers as

```bash
% zero
s(zero)

% one
s(s(zero))

% two
s(s(s(zero)))
```
Using the definition of a lambda expression, this simply translates to the number of applications of f to a variable x, in other words …

Zero
λf. λx. x

One
λf. λx. f x

Two
λf. λx. f (f x)

Three
λf. λx. f (f (f x))

...

This numbering system of using the number of compositions of `f` to denote numerical values is called Church Numerals. 

Using this model for representing numerical values, writing a lambda expression that computes natural number addition is intuitive, we simplify combine the number of function application of both arguments

This gives the lambda expression `Add_Nat : λa. λb. λf. λx. a f (b f x)`







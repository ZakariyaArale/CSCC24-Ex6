(Github: https://github.com/ZakariyaArale/CSCC24-Ex6)
# Running Code
## Sum.hs
- Ensure that you have GHCI installed in your terminal (version 9+)
- In the directory containing the file `Sum.hs` run `ghci Sum.hs` or run `ghci` and in ghci terminal run `:l Sum.hs`
- Examples of how to run each function has been commented below each function and there respective expected output

For example here the full code for sumList

```bash
-- |sumList 
-- return the sum of all elemnts of a List, this highlights lambda expressions
-- can be passed as arguments 
sumList :: Num a => [a] -> a
sumList = foldr (\x y -> x + y) 0 
-- sumList []          Expected: 0
-- sumList [-1, -5]    Expected: -6
-- sumList [1, 2, 9]   Expected: 12
```
To run the examples simply copy and paste the function application to the ghci terminal

For example you'll paste 
```bash
ghci> sumList [] 
```
and the output would follow once you press enter
```bash
0
```
## sum.py
This should be a very straightforward to use however ensure that you're using Python interperter (version 3+) to run the program. 

Examples one how to use the program and the expected output have been commented it, to rum them simply remove the print comments

## identity.rkt and one.rkt
Again both of these programs are very straightforward, ensure that you have Dr Racket installed (version 8.11 +) 

To run the indentity program, simiply provide any valid data type as an argument to the identity_ function, you should see the same value being outputted.
Similarly, run the one program, simiply provide any valid data type as an argument to the one_ function, you should see the value `1` being outputted.

As always, examples one how to run the code have been commented, simply remove the comments to run the examples.

## short_circuit.py
Once again very straightforward program, like `sum.py` ensure that you're using Python interperter (version 3+) to run the program. 

To highlight the effect of short circuiting, uncomment the first comment `print(true or 1/0 == 0)` you will see it output true.
After, put the comment back on the  `print(true or 1/0 == 0)` and uncomment the second comment `print(false or 1/0 == 0)`, you'll see that a ZeroDivision Error is raised.

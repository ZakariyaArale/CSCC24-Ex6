-- |sumList 
-- return the sum of all elemnts of a List, this highlights lambda expressions
-- can be passed as arguments 
sumList :: Num a => [a] -> a
sumList = foldr (\x y -> x + y) 0 
-- sumList []          Expected: 0
-- sumList [-1, -5]    Expected: -6
-- sumList [1, 2, 9]   Expected: 12

-- |sum_two_helper 
-- return a lambda expression that sum two numerical values, this highlights lambda expressions
-- can be passed as return values 
sum_two_helper :: Num a => b -> a -> a -> a
sum_two_helper = \b x y -> x + y
-- sum_two_helper [] 2 3          Expected: 5
-- sum_two_helper "Zak" 0 3       Expected: 3

-- |sum_two 
-- return the sum two numerical values
sum_two :: Num a => a -> a -> a
sum_two = sum_two_helper "I love C24"
-- sum_two 2 3          Expected: 5
-- sum_two 0 3          Expected: 3


data Expression a = Func (a -> a -> a) 

-- |sum_two' 
-- return an Expression instance that stores a lambda expression that sums two numerical values 
-- this highlights lambda expressions can be store in data structures
sum_two' :: Num a => Expression a
sum_two' = Func(\x y -> x + y)

-- |apply_expr 
-- return the binary function that is stored under an Expression instance 
apply_expr (Func a) = a
-- apply_expr sum_two' 2 3          Expected: 5
-- apply_expr sum_two' 0 3          Expected: 3
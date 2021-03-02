mysum2 :: Int->Int->Int
-- ^ sum the first n integers using an acc 
mysum2 0 acc= acc
mysum2 n acc = mysum2 (n-1) (acc + n)

fib2 :: Int->Int->Int
fib2 0 acc = acc + 1
fib2 1 acc = acc + 1
fib2 n acc = fib2 (n-1) (fib2 (n-2) acc)

myreplicate2 :: Int->Int->[Int]->[Int]
myreplicate2 0 _ acc = acc
myreplicate2 n x acc = myreplicate2 (n-1) x (x:acc)

myreplication2 n = myreplicate2 n n []


--other solutions
--More efficent, less time consuming
fib2b :: Int->Int->Int->Int
fib2b 0  prev acc = acc
fib2b 1  prev acc = acc
fib2b n prev acc = fib2b (n-1) acc (prev+acc)

fibb x = fib2b x 1 1

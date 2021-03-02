mysum :: Int->Int
-- ^ sums the first n integers, for input value n
mysum 1 = 1
mysum n = n + mysum(n-1)

fib :: Int->Int
-- ^ computes the nthFibonaci number, for input value n
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

myreplicate :: Int->Int->[Int]
-- ^ generate a list of n values in each value is n
myreplicate 0 _ = []
myreplicate x n = x:(myreplicate(n-1) x)

myreplication n =replicate n n

factacc :: Int->Int -> Int
factacc 0 acc = acc
factacc n acc = let newacc = n*acc
                in factacc (n-1) newacc

 

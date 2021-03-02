mylength :: [a] -> Int
mylength [] = 0 --base case
mylength(_:xs) = 1 + mylength xs

mysum :: [Int] -> Int
mysum [] = 0
mysum(x:xs) = x + mysum xs

myreverse :: [a] -> [a]
myreverse [] = [] --base case
myreverse (x:xs) = (reverse xs) ++ [x]



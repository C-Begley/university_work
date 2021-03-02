--DOES NOT COMPILE, just note

--Lists
1:2:3:[]->
[1,2,3,4]->
x:xs->

--Map
map :: (a->b) -> [a] -> [b]
map (\a -> 1+a ) [1,2,3]
[2,3,4]

map f [a,b,c] ~ [f a, f b, f c]

map :: (a-> b) -> ([a] -> [b])   --functer way of thinking of map

--Filter
filter :: (a-> Bool) -> [a] -> [a]

filter (>3) [1,4,5]
[4,5]

filter f []
[]

--folds
foldl :: Foldable t => (b->a->b) -> b -> [a] -> b   -- b is the accumulator 

foldl (\b a ->b + a) 0 [1,2,3]
6

foldl (+) 0 [1,2,3]
6

foldl (\acc x -> trace (show x ++ "+" show acc (acc + x))

0+1+2+3

foldr (a->b->b) -> b -> [a] -> b

foldr (\acc x -> trace (show x ++ "+" show acc (acc + x))
3+2+1+0

--left folds evaluate immediately starting with the accumulator. Right fold has to go the end of the function and then evaluate in one go. Follows lazy implemenation. Foldl won't work for an infinite list but Foldr

1:2:3:[] --is kind of like a fold, for thinking, replace empty list with acc and :: with func

mapfold :: (b -> [a]->[a]) -> [a] -> [b] ->[b] ?????

let mapfold f xs = foldr (\x acc -> acc ++ f x) [] xs

mapfold (+1) [1,2,3]

--Filter
filter :: (a -> Bool) -> [a] -> [a]
: :: a-> [b] -> [b]
\x acc -> if p x then x: acc else acc

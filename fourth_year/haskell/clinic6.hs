--recursive data structure 
data MyIntList = Nil | Cons Int MyIntList deriving (Show)

len :: MyIntList -> Int
len Nil = 0
len (Cons _ tail) = 1 + len tail

data MyList a = Ni | Constr a (MyList a)

--What is the difference between a type constructor and a data constructor in Haskell?
--A type constructor returns a concrete type e.g data '''MyList a ''' = Nil | Cons a  (MyList a)
--A data constructor returns a value of a given type  e.g  data MyList = Ni | '''Cons a (MyList a) '''


--What is a kind in Haskell
--The type of a type constructor *->*

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show, Eq)

treeSize :: Tree a -> Int
treeSize Leaf = 0
treeSize (Node _ left right) = 1 + (treeSize left) + (treeSize right)

treeSum :: Tree Int -> Int
treeSum Leaf = 0
treeSum (Node x l r) = x + (treeSum l) + (treeSum r)

treeElem :: Eq a => a -> Tree a -> Bool
treeElem _ Leaf = False
treeElem x (Node y l r) = ( x == y) || (treeElem x l) || (treeElem x r)

treeMap :: (a->b) -> Tree a -> Tree b
treeMap _ Leaf = Leaf
treeMap f (Node x l r) = let 
                             newl = treeMap f l 
                             newr = treeMap f r
                         in Node (f x) newl newr 


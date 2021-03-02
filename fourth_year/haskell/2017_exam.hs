import Data.Maybe

con :: [[a]] -> [a]
con [] = []
con (x:xs) = x ++ con xs

conpoint :: [[a]] -> [a]
conpoint = foldl (++) []

type Treasure = Int
-- count num. treasure chests
data PirateShip = PirateShip Treasure deriving (Show)
-- e.g. (PirateShip 2) is ship with two treasure chests
addTreasure :: PirateShip -> Maybe PirateShip
addTreasure (PirateShip t) = if t >= 3 then Nothing else Just $PirateShip $t+1

removeTreasure :: PirateShip-> Maybe PirateShip
removeTreasure (PirateShip t) = if t == 0 then Just $PirateShip t else Just $PirateShip $t-1 

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show)

countNodes :: Tree a -> Int
countNodes Leaf = 0
countNodes (Node _ l r) = 1 + countNodes l + countNodes r

mirror :: Tree a -> Tree a
mirror Leaf = Leaf
mirror (Node a l r) = Node a (mirror r) (mirror l)

class Twistable t where
    twist :: t->t
    size  :: t->Int

instance Twistable (Tree a) where
    twist x = mirror x
    size x = countNodes x

instance Twistable [a] where
    twist x = reverse x
    size x  = length x
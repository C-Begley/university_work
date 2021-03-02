maping :: (a->b) -> [a] -> [b]
maping _ [] = [] 
maping f (x:xs) = f x : maping f xs   

data Colour = Red | Green | Blue 

hot :: Colour -> Bool 
hot Red = True
hot _ = False

instance Show Colour where
    show Red = "R"
    show Green = "G"
    show Blue = "B"

data Tree = Tip Int | Node Int Tree Tree    

bst1 = Node 5 (Node 3 (Tip 1) (Tip 2) ) (Node 13 (Tip 7) (Tip 16) )
bst 2 = Node 4 (Tip 7) (Node 3 (Tip 6) (Tip 1))

func :: [a] -> MyMaybe a   
func xs =      
    do a <- myTail xs
       b <- myTail a
       c <- myHead b
       return c    

func' xs = ((myTail xs) >>= myTail) >>= myHead     

data MyMaybe a  =  MyNothing  |  MyJust a deriving (Show)  

instance Functor MyMaybe where
  fmap f (MyNothing) = MyNothing
  fmap f (MyJust x) = MyJust (f x)

instance Applicative MyMaybe where
  pure x = MyJust x 
  MyJust f <*> MyJust x = MyJust (f x)
  MyJust f <*> MyNothing = MyNothing

instance Monad MyMaybe where
  MyNothing >>= f = MyNothing
  (MyJust x) >>= f = f x
  return x = MyJust x

myHead :: [a] -> MyMaybe a
myHead [] = MyNothing
myHead (x:_) = MyJust x
    
myTail :: [a] -> MyMaybe [a] 
myTail [] = MyNothing
myTail (_:xs) = MyJust xs



data Comp a = Finished a deriving(Show)

instance Functor Comp where
  fmap f (Finished x) = Finished (f x)

instance Applicative Comp where
  pure = Finished 
  Finished f <*> Finished x = Finished (f x)

instance Monad Comp where 
    return x = Finished x
    Finished x >>= k = k x

binded :: (Comp a) -> (a ->Comp b) -> Comp b
binded (Finished a) f = f a 

test a = Finished $ "Works"
data Comp a = Finished a deriving(Show)

instance Functor Comp where
  fmap f (Finished x) = Finished (f x)

instance Applicative Comp where
  pure = Finished 
  Finished f <*> Finished x = Finished (f x)

instance Monad Comp where 
    return x = Finished x
    Finished x >>= k = k x

primes :: Int -> Int
primes x = x

fibs :: Int -> Int
fibs x = x + 2

funnysum :: Int -> Comp Int
funnysum n = 
    let x = primes n
        y = fibs n 
        in do return (x+y)


--funnysum :: Int -> Comp Int
--funnysum n = 
--    let x = primes n
--        y = fibs n 
--        in do return (x+y)
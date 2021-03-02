data Comp a = Finished a deriving(Show)

instance Functor Comp where
  fmap f (Finished x) = Finished (f x)

instance Applicative Comp where
  pure = Finished 
  Finished f <*> Finished x = Finished (f x)

instance Monad Comp where 
    return x = Finished x
    Finished x >>= k = k x

runComp :: Comp a -> a 
runComp (Finished x) = x

primes :: Int -> Int
primes x = x

fibs :: Int -> Int
fibs x = x + 2

funnysum :: Int -> Comp Int
funnysum n = 
    let x = primes n
        y = fibs n 
        in do return (x+y)

main :: IO()
main =
        do 
            putStrLn "Enter value for funny sum"  
            s <- getLine
            let 
                n = read s :: Int
                x = funnysum n
                result = runComp x
            putStrLn $ show result
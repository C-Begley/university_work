import Control.Applicative

--liftA2 :: Applicative f=> (a->b->c) -> f a -> f b -> f c

liftA2 (+) (Just 1) (Just 2)
--Just 3

((pure (+)) <*> (Just 1)) <*> (Just 2)

[1] >>= (\n -> [(show n), "elephant"])

[1,2,3] >>= (\n -> [(show n), "elephant" ++ (if n>1 then "s" else "")]) 

--pure code is mathematical functions. Output never deviants. No side effects or dependance on the outside world   

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:xs) = Just xs

-- data Either a ba = Left a | Right b
-- fmap applies function to elements of a container and returns the original container with the edited internals
-- fmap (\x->x+1) (Just 41) ---> Just 42
-- fmap (\x->x+1) (1,2)   ---> (1,3)  

data MagicBox a = MAgicBox a  
--Fill in from shee
-
--fmap f l = (pure f) <*>l
--fmap (x->x+1) [1,2,3] = [2,3,4] 

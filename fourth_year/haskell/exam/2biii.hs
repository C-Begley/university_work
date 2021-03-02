myLookup :: Eq k => [(k,v)] -> k -> Maybe v
myLookup [] _ = Nothing
myLookup (x:xs) l 
      | l == (fst x) = Just $ snd x 
      |otherwise = myLookup xs l

--lookup :: Eq k => [(k,v)] -> k -> Maybe v
--lookup [] _ = Nothing
--lookup (x:xs) l 
--      | l == (fst x) = Just $ snd x 
--      |otherwise = lookup xs l
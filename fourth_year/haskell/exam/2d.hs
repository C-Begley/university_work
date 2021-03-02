type Dict k v = [(k,v)]

myLookup :: Eq k => Dict k v -> k -> Maybe v
myLookup [] _ = Nothing
myLookup (x:xs) l 
      | l == (fst x) = Just $ snd x 
      |otherwise = myLookup xs l

speller :: [[Char]] -> [Char]
-- ^ Function which returns a setence
speller [] = ""
speller lst = let
                h =  [head (head lst)] ++ " is for " ++ head lst 
                r = if length (tail lst) > 0 
                        then
                            if length (tail lst) > 1 
                                then ", " ++ speller (tail lst)
                                else " and " ++ speller (tail lst)
                        else "."  
              in h ++ r

 

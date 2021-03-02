--won't run from file

import Data.Map
m = Data.Map.fromList [("london", 2012), ("rio", 2016)]
m2 = Data.Map.insert "bejing" 2008 m
x = Data.Map.lookup "rio" m2
y = Prelude.lookup "rio" $ Data.Map.toList m2

m3 = Data.Map.delete "rio" m2
z = Prelude.lookup "rio" $ Data.Map.toList m3

d = Data.Map.fromList [(1,2), (2,3), (3,1)]
r = (Data.Map.lookup 1 d ) >>= (flip Data.Map.lookup d) >>= return
 

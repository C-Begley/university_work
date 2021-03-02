ntimes :: (a->a) ->Int-> a -> a
ntimes _ 0 x = x
ntimes f n x = f $ntimes f (n-1) x

blowup ::Integer->Integer
blowup n = n + (blowup $ n+1)
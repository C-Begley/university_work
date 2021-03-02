module Main where
import HDL.Hydra.Core.Lib
import HDL.Hydra.Circuits.Combinational
import HDL.Hydra.Circuits.Register
main :: IO()
main = run_mux2 testdata

testdata :: [[Int]]
testdata =
--  c   x   y
  [[0, 0, 1, 2, 3, 4],
   [0, 1, 1, 2, 3, 4],
   [1, 1, 1, 2, 3, 4],
   [1, 1, 1, 2, 3, 4]]

--testdata = 
--c, d  p  q  r  s 
--[[0, 0, 0, 0, 0, 1]]--,
-- [0, 1, 1, 1, 0, 1],
-- [1, 0, 0, 1, 0, 0],
-- [1, 1, 0, 1, 1, 1],
-- [0, 0, 1, 1, 1, 0],
-- [0, 1, 0, 0, 1, 0],
-- [1, 0, 1, 0, 1, 1],
-- [1, 1, 1, 0, 0, 0]]

run_mux2 :: [[Int]] -> IO()
run_mux2 input = runAllInput input output
  where
--Extract input signals
   c = getbit input 0  
   d = getbit input 1 
   p = getbin 3 input 2
   q = getbin 3 input 3
   r = getbin 3 input 4
   s = getbin 3 input 5

   out = mux2w (c,d) p q r s
   
   output = 
     [string "c = ", bit c,
      string " d = ", bit d,
      string " p = ", bindec 3 p,
      string " q = ", bindec 3 q,
      string " r = ", bindec 3 r,
      string " s = ", bindec 3 s,
      string " => out = ", bindec 3 out]

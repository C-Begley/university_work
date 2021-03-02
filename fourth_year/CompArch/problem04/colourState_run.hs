module Main where
import HDL.Hydra.Core.Lib
import ColourState 

main :: IO ()
main = runColourState test_data

runColourState :: [[Int]] -> IO ()

test_data:: [[Int]]

test_data= [[1], [0],  [0],  [0],  [0],  [1],  [1],  [0],  [0],  [0],  [0],  [0]]

runColourState input = runAllInput input output
  where
    reset = getbit input 0
    (r,b,g) = stateMachine reset
    
    output =
      [string "reset = ", bit reset,
       string " red=", bit r,
       string " blue=", bit b, 
       string " green=", bit g]


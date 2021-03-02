module ColourState where
import HDL.Hydra.Core.Lib
import HDL.Hydra.Circuits.Combinational

stateMachine reset = (red,blue,green)
  where 
   reset' = inv reset 
   red = dff (or2 reset green)
   blue = dff (and2 reset' red)
   green = dff (and2 reset' blue)

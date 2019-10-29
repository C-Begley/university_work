This is a collection of patterns for Conway's Game of Life.
Collected by Jason Summers. <http://pobox.com/~jason1/life/>

The objects here are separated into two basic types: "slide guns" and 
"tethered rakes". The difference is that the rate of outward movement of a 
tethered rake is fixed, while a slide gun's outward movement can be adjusted 
by changing the period of the stationary part.


File naming convention:

TYPE-D-XXd-YYY.lif

TYPE: slide=slide gun, teth=tethered rake

D: Direction of spaceship salvos, o=orthogonal, d=diagonal

XX: Outward movement, in cells per period

d: Direction of output relative to the pattern. Not always applicable.
    (b=backward gliders, f=forward gliders)

YYY: Apparent period of the stationary part (gun)


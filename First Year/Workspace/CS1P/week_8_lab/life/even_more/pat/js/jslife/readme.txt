jslife.zip
Version 2004.11.16

This is Jason's collection of patterns for Conway's Game of Life.

Some other Life pattern collections are listed on this web page:
http://pobox.com/~jason1/life/links.html#patterns

The files contained in this archive are in a format called "RLE", which is 
widely used for Life patterns. Most recent Life programs should recognize it.

Comments and questions may be sent to Jason Summers <jason1@pobox.com>.
<http://pobox.com/~jason1/life/>

-----

The collection is subdivided into several separate directories (folders):

applications
   (1) Patterns whose population over time is unusual.
   (2) High-level patterns; patterns designed to calculate or
       emulate something.
   (I guess these two things may not have a lot in common, but
   I don't want to have too many separate directories.)

interactions
   (For lack of a better name.)
   Moving reactions that are supported by one or more guns or
   puffers, all of which move at a different velocity than the
   reaction itself.

guns
   Spaceship guns. Most ordinary glider guns would be put into
   other collections instead of this one, so most of the guns here
   are unusual in some way -- they may have an adjustable period,
   or an unusual shape, or fire multiple spaceships or unusual
   kinds of spaceships.

misc
   Anything that doesn't fit into another directory. Mostly,
   reactions that are interesting or useful.

odds-and-ends
   Various curiosities, some obsolete, that I can't decide what to
   do with.

oscillators
   Ordinary oscillators. At some point, I intend to remove this
   section in favor of a separate unified oscillator collection.

slideguns
   "Guns" that fire each glider on a separate path. See the section
   below for more information.

synthesis
   Patterns of gliders that collide to form complex objects.

velocity-...
   Spaceships, puffers, stretchers, and spacechip-like fuses.
   Separated by velocity.


----- Additional information bout the "slideguns" directory -----

The objects here are separated into two basic types: "slide guns" and 
"tethered rakes". The difference is that the rate of outward movement of a 
tethered rake is fixed, while a slide gun's outward movement can be adjusted 
by changing the period of the stationary part.

(I may be abusing the term "tethered rake" when I use it to include patterns
like "teth-o-014b-090.lif" that aren't based on a spaceship or puffer.)


File naming convention:

TYPE-D-XXd-YYY.lif

TYPE: slide=slide gun, teth=tethered rake

D: Direction of spaceship salvos, o=orthogonal, d=diagonal

XX: Outward movement, in cells per period

d: Direction of output relative to the pattern. Not always applicable.
    (b=backward gliders, f=forward gliders)

YYY: Apparent period of the stationary part (gun)


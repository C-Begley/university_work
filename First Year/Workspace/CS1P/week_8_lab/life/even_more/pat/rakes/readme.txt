rakes.zip

This is a collection of c/2 orthogonal spaceships, puffers, and 
(especially) rakes of various periods for Conway's Game of Life, compiled 
by Jason Summers <jason1@pobox.com>.

A "rake" for the purposes of this collection is a moving object that 
releases single gliders or other spaceships in a uniform stream. The 
period of the object itself may be higher than that of its output, but it 
must have a definite period when you ignore the output. Rakes with a 
higher period than their output are called "pseudo-period" -- they are 
less highly regarded than "true-period" rakes, and will be kept in 
separate files.

The general goal here is to exhibit the "best" known rakes for every known 
true-period up to some limit (currently 200). I also include pseudo-period 
rakes for some small periods, and some other rake-related patterns. Also, 
any known period up to 1000 that cannot be achieved by combining rakes of 
other periods or applying the technology demonstrated in this collection 
will be included. If you know of a pattern that should be here but is not, 
please send it to the address above, and I'll probably include it.

The reason for focusing on rakes is that once you have a clean rake for 
some period, you can generally combine multiple rakes of that period to 
construct just about anything you could want, including spaceships and 
various types of puffers. However, for some periods no clean rake is known 
(or for very low periods, is impossible), even though there are known 
spaceships or puffers. In that case, I will exhibit the spaceships or 
puffers. If a rake is known, I will only include additional spaceships or 
puffers if they are particularly interesting.

Some rakes are known only in theory, and have not yet been actually 
constructed (as far as I know). In that case I will include a puffer of 
that period, and treat it as if it were a completed rake. The procedure 
for completing the rake would generally be to perturb the puffer with 
sparking spaceships until a glider is released, then use glider 
duplicators to generate as many new gliders as you need, and glider 
turners to bounce the extra gliders back into the puffer's smoke to clean 
it up.

Files names starting with "r" may have a letter after the period. The 
naming convention is that if there is no letter, the file contains a rake 
(or a puffer that could be turned into a rake). The letter "x" means that 
the file contains a puffer or spaceship, but no rake is known for that 
period. The letter "p" indicates a "pseudo-period" rake (defined earlier 
in this document).

A rake is called a "forward" rake if the emitted gliders travel generally 
forward (at a 45-degree angle to the rake's direction), and a "backward" 
rake if the gliders travel generally backward (at a 135-degree angle). For 
sufficiently high periods, the gliders' direction can be changed by using 
the reactions in the turners-p[2,4,6] files. For lower periods, the 
direction can be changed by combining multiple rakes (e.g. in a glider 
"kickback" reaction) -- see the turners-general file.

There are known methods for constructing any (pseudo-)period c/2 glider 
rake that is theoretically possible. Consider the p72+8N puffer in the 
var-072+8n.lif file. If, for example, you want to make a pseudo-period-146 
rake, just construct some period-584 (=73*8) rakes, and interleave them to 
divide the period by 4 (584/4 = 146).

True-period rakes are now known for *all* multiples of 8, and all 
multiples of 4 higher than 564. The files "var-072+8n.lif" and 
"var-???+24n.lif" are the starting points for building them.

Some of these rakes ought to be better attributed, so if you feel a 
discoverer deserves credit that I haven't given, please let me know.

For more information, visit <http://pobox.com/~jason1/life/>.

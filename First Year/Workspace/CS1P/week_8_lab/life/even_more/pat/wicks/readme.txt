Collection of wicks for Conway's Game of Life

Compiled by Jason Summers <jason1@pobox.com>
http://pobox.com/~jason1/life/

A "wick" is an infinite linearly repeating oscillator.

A "fencepost" is an object that can stabilize one end of a wick. Most of 
the wicks in this collection have no known fenceposts, so the patterns 
will blow up pretty quickly. If a fencepost is known, it is usually 
included with the pattern. Uninteresting fenceposts for some of the high 
period wicks can be built by firing gliders at the ends -- some of these 
would be very large, and are not included.

The period of a wick can be expressed in the form A/B, where A is the 
period, and A/B (divided out) is the number of generations it takes for a 
congruent pattern to appear (the same pattern but possibly shifted and/or 
flipped). If A=B, the wick is called a "barber pole". Wicks where B=1 are 
usually the most interesting, since they are typically the easiest to 
stabilize.

This collection does not attempt to include every known wick. In fact, an 
infinite number are known. Consider the following wicks:

.*..*..*..*..*    .*..*..*..*..*..*    .*..*..*..*..*..*..*
**************    *****************    ********************
..............    .................    ....................
.***..***..***    .****..****..****    .*****..*****..*****
**...**...**..    **....**....**...    **.....**.....**....
.***..***..***    .****..****..****    .*****..*****..*****
..............    .................    ....................
**************    *****************    ********************
.*..*..*..*..*    .*..*..*..*..*..*    .*..*..*..*..*..*..*

  Period 5/5          Period 6/6              Period 7/7

The series can be continued to produce a wick of any desired period.

Any spaceship "tagalong" that can be extended in the direction of the 
spaceship's movement also constitutes a wick. For example:

.*.........*.........*
**......****......****
*.....***.*.....***.*.
*....**...*....**...*.
**...*....**...*....**
.***.*.....***.*.....*
...****......****.....
......*.........*.....

    Period 20/10

Wicks of this type are usually not include in this collection.

Also not included are:

 * wicks that have been made finite, and are more interesting when 
considered to be an oscillator than a wick

 * wicks of period 3 or less


Most of the wicks in this collection were found independently by me, using 
a random torus search program. Some of them, however, were previously 
discovered by other people. I have not gone to much effort to determine 
and give credit to the first discoverer. In some cases that would be 
almost impossible anyway, since many of these wicks would not have been 
considered interesting enough to make public. I have, however, attempted 
to give proper credit for any nontrivial fenceposts.

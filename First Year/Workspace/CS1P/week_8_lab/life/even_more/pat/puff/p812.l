x = 112, y = 47
14bo14boo$12bo3bo10bo4bo$11bo14bo$11bo4bo9bo5bo$11b5o10b6o3$10bo$boobo
3booboo$obb5obo$obbobooboo$oo3b3oboo6boobobboo$bbo6boo5bobob5o$9boob3o
bo$bbo6boo5bobob5o$oo3b3oboo6boobobboo$obbobooboo$obb5obo$boobo3booboo
$10bo$87b4o$58b6o22b6o$11b5o42bo5bo20boob4o15b4o$11bo4bo41bo27boo19bo
3bo$11bo47bo4bo42bo$12bo3bo44boo13b4o28bobbo$14bo60b6o$74boob4o$75boo
6$46b5o$46bo4bo$46bo$47bo3bo6boo$49bo7boob4o$58b6o15boo$59b4o15boob3o$
79b5o$80b3o5b6o$88bo5bo$88bo$89bo4bo$91boo!

This is a dirty puffer with period 812.
This begins by the blinker puffer burning out into a puff which is easily
turned into a forwards glider by a HWSS.  Three spaceships then turn that
glider into another glider moving backwards.  The backwards glider is
turned into a loaf.  The loaf is then turned back into a forwards glider
by three more spaceships.  The glider impacts into the growing row of
blinkers, and with the help of a passing LWSS, ignites the blinker row.
The burning moves up the row to complete the cycle.

This puffer can be modified to create a puffer of any period 860 + 8N,
by applying the following rules:

Firstly, moving the back 4 spaceships back by 4 cells, and advancing them
by two generations, increases the period of the puffer by 24 generations.
This works by delaying the conversion of the loaf into the final glider.

Applying the rule twice results in the simpler second rule that moving
the back 4 spaceships back by 6 cells increases the period by 48 generations.
This doesn't require anything to have its generations advanced.

Thirdly, moving the front 4 spaceships diagonally out and back by 2 cells,
moving the next 3 spaceships diagonally out and back by 2 cells and advancing
them by two generations, and moving the back spaceship back 4 cells and
advancing it by two generations, increases the period by 32 generations.
This works by increasing the travel time of two of the gliders, and also
compensating for a phase shift which results.

This rule cannot be applied arbitrarily often by itself because the set of
three spaceships which are advanced in generations will override the set of
four front spaceships.  So the first rule has to be applied as necessary
to open up more room.  So combining the first rule and the second rule
results in the following rule which can be applied arbitrarily often:

Fourthly, moving the front 4 spaceships diagonally out and back by 2 cells,
moving the next 3 spaceships outwards by 2 cells and backwards by 4 cells,
and moving the back spaceship backwards by 6 cells, increases the period
by 56 generations.  Once again nothing needs its generations advanced.

So the four rules described increase the period by the following amounts:
	Rule 1: 24 generations = 3 * 8
	Rule 2: 48 generations = 6 * 8
	Rule 3: 32 generations = 4 * 8
	Rule 4: 56 generations = 7 * 8

Since 3 and 7 are relatively prime to each other, then the period can
obviously be increased by any multiple of 8 from 12 onwards by applying
rules 1 and 4 the appropriate number of times (since 3*7-3-7 = 11).  But
most of the smaller multiples can also be covered by using the other rules:
	3*8:		rule1
	4*8:		rule3
	6*8:		rule2
	7*8:		rule4
	8*8:		rule3 + rule3
	9*8:		rule1 + rule2
	10*8:		rule2 + rule3
	11*8:		rule3 + rule4

So the last period of the form 8N+4 which I don't know how to make has
period 812 + 5 * 8 = 852.  All periods of the form 860 + 8N can be
constructed using the above method.

The entire series of puffers can have a bounded width by noticing that
rule 1 does not increase the width of the puffer at all.  Since each
application of rule 1 increases the period by 24, with enough applications
of rule 1, the desired large period can be reached within 24 generations
without increasing the width.  Then the remaining (up to 24) generations
can use a small bounded number of other rules as required, only increasing
the width slightly.

David I. Bell, January 1997

x = 308, y = 176
161b2o$162bo$162bobo7bo$163b2o5bobo$168b2o71b3o$168b2o12b2o56bo3bo$
168b2o12b2o55bo5bo$170bobo$172bo65bo7bo$238bo7bo2$239bo5bo$240bo3bo$
241b3o4$84bo$83bobo$66b2o15b2obo$66bobo14b2ob2o3b2o$61b2o6bo13b2obo4b
2o$57b2obo2bo2bo2bo13bobo$57b2o2b2o6bo8bo5bo$66bobo7bobo$66b2o9b2o5$
85bo$86bo$84b3o40b2o$127bobo8bo$118b3ob2o4b3o6bo7bo$118b4o2bo4b3o5b2o
5bobo$122b2o4b3o7bo4bo3b2o3b2o$127bobo13bo3b2o3b2o$93bo33b2o14bo3b2o$
91bobo50bobo$92b2o51bo$268bo$267bobo$266bob2o15b2o$131bo117b2o9b2o3b2o
b2o14bobo$100bo30b2o112b4o4b2o5b2o4bob2o13bo6b2o$101bo28bobo112b3ob2o
2b2o12bobo13bo2bo2bo2bob2o$99b3o148bo17bo5bo8bo6b2o2b2o$274bobo7bobo$
274b2o9b2o$175bo2bo56bo2bo26bo2bo$174bo59bo29bo$123b2o49bo3bo55bo3bo
25bo3bo$108bo15b2o48b4o56b4o26b4o$106bobo14bo155bo$107b2o169b2o$278bob
o$159b2o2b3o2b2o81b2o7b2o$159bo2b5o2bo81bo9bo9bo$116bo43b9o83b9o10b2o$
116b2o5bo33b3o9b3o77b3o2b5o2b3o6bobo$115bobo5bobo31bo2bo7bo2bo77bo2bo
2b3o2bo2bo$126b2o4b2o24b2o9b2o79b2o9b2o23b2o9b2o$126b2o4b2o151b2o9bobo
$126b2o152bo6bo7b3o4b2ob3o$113b2o8bobo126bo26bobo12b3o4bo2b4o$112bobo
8bo126b4o6b2o2b2o11b2o3bo12b3o4b2o$112bo131b2o3bobob2o5b4obo2bobo6b2o
3bo13bobo$111b2o131b2o2bo2bob3o5b2obo3bo3bo4b2o3bo14b2o$249bobob2o4bo
12bo6bobo$250b4o14bo4bo6bo$252bo19bo$268bo3bo$268bobo11$20b2o$20b2o4$
19b3o$19b3o$18bo3bo$17bo5bo142bo$18bo3bo101bobo39bobo$19b3o101bo2bo39b
2o$114b2o6b2o10bo6bo$114b2o4b2o3bo8bo5bobo$122b2o9bo6b2obo$123bo2bo2b
2o9b2ob2o3b2o$124bobo2bo2b3o5b2obo4b2o$107b2o20b4o7bobo$109bo20b2o9bo$
96b2o12bo8b2o$17b2o77b2o4bo7bo8b2o$18bo74b2o5b2o8bo$15b3o67b2o5b3o5bo
2b2o4bo13bo$15bo69b2o6b2o6b5ob2o12b2o$96b2o4bo19b2o$96b2o2$110bo$111bo
$109b3o$114bobo$114b2o$115bo3$64bo53bo$62b3o51bobo$61bo55b2o$61b2o49bo
$112b3o$115bo$114b2o2$117b2o$116b2o$118bo3$50b2o$51b2o$50bo74bo$124b2o
$124bobo6b2o$133bo$134b3o$136bo$99bo$34b2o61b3o$34bo61bo35b2o$25bo6bob
o61b2o33b2o$22b4o6b2o99bo$13bo7b4o68b2o$12bobo6bo2bo67bobo50b2o$11bo3b
2o4b4o10b2o57bo50bo2bo$2o9bo3b2o5b4o10b2o97bo3b3o7bo6b2o$2o9bo3b2o8bo
9bo98b5o3bo6bo6b2o$12bobo107b2o9b2ob2o3bo7bo$13bo108b2o8b3ob2o3bo3bo2b
o$22bobo108b2ob4o5b2o$23b2o60b3o46b4o$23bo63bo47bo$86bo$27b2o$27b2o2$
14b2o$13b3o3b2obo55b2o$3b2o5bob2o5bo3bo2bo50bobo$3b2o5bo2bo4bo4bo2b2o
51bo$10bob2o4b4o5b2o8b2o$13b3o3bo7b3o7b2o$14b2o11b2o$26b2o$26bo$59b2o
9b3o$51bo7bo2bo9bo$50bo3b2o7bo7bo5bo$50bo5bo6bo12b4o$51b5o7bo11b2obobo
3b2o$59bo2bo11b3obo2bo2b2o$59b2o14b2obobo$76b4o$77bo!

A very long period oscillator: 1800 generations. In more humorous moments,
known as the glider racetrack. Sometimes you're a glider, sometimes a
spaceship, and sometimes just a hole. -- David Goodenough

This uses several reactions:

The glider starts travelling SW, and enters a three glider to LWSS
synthesis found by David Buckingham. There are two parallel streams of
gliders moving in opposite directions, a NW P30 and and a SE P60. When
idling, these fall into eaters, but when *THE* glider arrives, a single
instance of the synthesis takes place, sending a LWSS west. The gun firing
SE has to be P60 to let the LWSS escape.

Next, the LWSS hits a glider going NE from another P60 gun, and is
converted back into a glider going SE. I'm not sure who this reaction is
due to.

Next, the kickback reaction with a NE stream from a P30 gun is used to
turn the glider around so it's going NW, and send it back through the
stream from the P60. As far as the LWSS + glider to glider synth goes,
a P30 gun would be OK. However, since you can't get a glider back through
a P30 stream without a crash, I need a P60 stream to let the glider back
through.

Now it goes to a shuttle that turns it NE, and then it hits a stream of SE
gliders from a P30 gun. When it hits the stream, it destroys exactly one
glider in the stream, creating a hole. When idling, the stream hits another
shuttle that turns it NW, and then runs into what would be a P30 gun, except
that the inbound stream keeps it permanently turned off. This is part of
the switchable P30 LWSS gun found by David I. Bell, AKA an in-line NOT gate
for glider guns. When the hole arrives, it allows a single glider to escape
NE, which is promptly turned SE by another shuttle.

The glider then runs into the westbound output of a P120 LWSS gun, as
found by Dean Hickerson. It undergoes the same glider plus LWSS gives
glider reaction, creating a glider going NE. This in then reversed to SW
by the "ping" reaction with a PD, and at that point it's on its
starting path. It continues SW, and once again enters the three glider
LWSS synthesis, and thus the cycle repeats.

David Goodenough, January 1995

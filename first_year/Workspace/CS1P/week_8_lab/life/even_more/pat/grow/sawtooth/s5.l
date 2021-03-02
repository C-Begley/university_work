! "main" (cells 687 length 102 width 199 generation 0)
! Population is unbounded but does not tend to infinity.  Its graph
! is a sawtooth function with ever-increasing teeth.  More
! specifically, the population in generation  t = 385*9^n - 189
! (n>=1),  is t/4 + 1079,  but the population in generation
! 1155*9^n - 179 (n>=0)  is only 977.
!
! The pattern consists of two parts, a stationary shotgun and a set
! of puffers moving east.  The shotgun produces, and usually
! destroys, a salvo consisting of a MWSS and 2 LWSSs.  The moving
! part consists of a period 8 blinker puffer (found by Bob
! Wainwright), and two p24 glider puffers, whose output gliders
! destroy each other (with help from an accompanying MWSS).  In
! generation  385*9^n - 189  (n>=1)  (and 228 for n=0), a salvo hits
! the back end of the row of blinkers, causing it to decay at 2c/3.
! When the row is completely gone, a new row starts to form and a
! spark is produced.  The spark is turned into a glider by an
! accompanying HWSS; the glider is turned into a westward LWSS, in
! generation 1155*9^n - 127  (n>=0), by interaction with the glider
! puffers.  (This 3 glider synthesis of a LWSS is due to David
! Buckingham.)  When the LWSS hits the shotgun, in generation
! 2310*9^n - 184  (n>=0),  another salvo is released, starting the
! cycle again.
!
! The idea for this sawtooth pattern was suggested by Bill Gosper.
! Dean Hickerson, drhickerson@ucdavis.edu  7/8/92
51k99h@!
105............................................................................OO
105............................................................................O
105...O
105.O.O
93...OO......OO
93..O....O...OO...............O........................OO
93.O....OO...OO...............OO.......................O
83.O9.O11.O.O13.OO13.OO5.O.O17.OO
83.OO8.O13.O13.3O11.3O5.OO18.O.O
94.O26.OO9.O.OO15.O12.3O7.OO
95.OO23.OO10.O..O12.4O13.3O7.O
120.O...........O.OO...........OOOO......O.O....OOO.............OOO
120................OOO.........O..O.......OO...O.O.............O...O
120.................OO.........OOOO.......O....OO.............O.....O
120....OO.................OO....OOOO...........................O...O
120.....O................O.O.......O............................OOO
120......................O......................................OOO
120.....................OO
80.OO................................................................OO.........OO
81.O...............................................................O..O.......O..O
81.O.O.............................................................OOO.........OOO
82.OO64.9O25.3O
147.O..OOOOO..O.......................OO.OO
12.O134.OO..3O..OO23.OO.OO
11.O169.5O
11.O4.O163.OO3.OO
11.5O136.O
137...............O
137..O............O...O
137.O.............OOOO
12.OO123.O4.O
11.OO.3O120.5O
12.OOOO...OOO
12..OO
182..O
182.OO
14.O115.OO
13.O116.O.O
13.O5.O101.OO8.3O12.O40.O.O
13.6O102.O10.3O8.4O40.O3.O
106.O24.3O8.4O28.OO3.OO10.O5.OO
102.O3.OO.3O18.O.O9.O..O10.O15.O..O3.O.O10.O5.O
102.OO4.4O18.OO10.4O9.OO6.O7.O7.O11.O
106.OO35.4O16.OO6.O15.O3.O
114.................................O........................O...............O.O
114.OO................OO......................................O..O
114.O.O................O........................................OO
114..OOO
36.O79.OO
35.O.............................................................................OO
35.O5.O71.3O
35.OOOOOO
.
114.O
114.OO
.
13.OO126.O
12.OO.4O122.OO
13.6O84.O26.O11.OO8.OO
.O12.4O84.OO26.O.O9.3O8.O
O58.5O54.O12.O.O8.OO
O3.O54.O4.O38.O14.OO11.O..O..OO..OO
4O55.O42.O.O26.O.O4.O..O
6.3O27.4O20.O40.O..O25.O.O
6.OO.OO25.O3.O59.O..O26.O
6.OOO...OOO.....................O
4O33.O65.O
O3.O97.OO
O........................OO
.O......................OOOO
.......................OO.OO
12.6O6.OO105.OO
12.O5.O10.O73.O27.3O
12.O16.O.O71.OO15.O12.OO.O5.OO
13.O15.O58.OO29.OO12.O..O6.O
24.OO64.O27.OO13.OO.O
23.OO.OO52.OO9.O13.O11.3O11.3O
24.4O33.OO17.O10.O13.O.O10.OO11.OO
25.OO33.O..O27.O16.OO9.OO
60.O.............................O.................OO..........O
32.OOOOOO......................O...........................OO..................OO
32.O.....O.....................O.OO.........................................O.O
32.O.............................O..........................................O
32..O.........O..O.OO
32...........O......OO
32...........O...O.O............O
32...........OOOO...............OO
.
.
.
21..........O
21..........OO.............................O
21.OO........OO..............O............OO
21.O.........OOO.............O.O.......................O
21...........OO...............O.O....................O.O
21..........OO................O..O......OO.........OO............OO
21..........O.................O.O........O.........OO.............O
21...........................O.O...OO......OO......OO
21...........................O.....O.......OOO.......O.O
21.........................................OO..........O
21.......................................O
21......................................OO

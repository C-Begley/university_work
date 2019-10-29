! "main" (cells 533 length 64 width 147 generation 0)
! Irrational 5
! Population growth is linear with an irrational multiplier.
! Each middleweight spaceship produced by the puffers either hits a
! boat or is deleted by a glider.  Denoting the first possibility by
! 1 and the second by 0, we obtain a sequence beginning 101011011010...
! If we prepend 101, we obtain the Fibonacci string sequence, defined
! by starting with 1 and then repeatedly replacing each 0 by 1 and each
! 1 by 10:  1 -> 10 -> 101 -> 10110 -> 10110101 -> ...  (See Knuth's
! "The art of computer programming, vol. 1", exercise 1.2.8.36 for
! another definition.)  The density of 1's in this sequence is
! (sqrt(5)-1)/2,  which implies that the population in gen t is
! asymptotic to  (8 - 31 sqrt(5)/10) t.  More specifically, the
! population in gen  20 F[n] - 92  (n>=6)  is 98 F[n] - 124 F[n-1] + 560,
! where  F[n]  is the n'th Fibonacci number.  (F[0]=0,  F[1]=1,  and
! F[n] = F[n-1] + F[n-2]  for  n>=2.)
! Dean Hickerson, drhickerson@ucdavis.edu  5/12/91
32k73h@!
127...........OO
127..OOOO....OOOO
127.O...O....OO.OO
18.O112.O6.OO
17.O109.O..O
17.O...O
4O13.4O104.OO
O3.O120.OO8.OO
O123.O3.O5.O..O
.O23.O99.O3.O4.O..OO
25.O.O97.O4.O..O..OO
25.OO100.O.O3.4O
2..OO...OO
2.O.O......O
..O6.O..O17.O106.OO
..3O7.OO16.O.O103.4O
11.OO17.OO43.O43.OO15.OO.OO
74.O...........................................OOOO................OO
74.O...O.......................................OO.OO
35.O20.4O14.4O42.OO
4O5.OO24.O.O18.O3.O34.O
O3.O3.OO.OO22.OO19.O37.O
O8.4O44.O36.O4.O11.OO
.O8.OO82.5O10.OO.OO
15.4O5.OO14.O68.4O16.OO
15.O3.O3.OO.OO12.O.O16.O50.OO15.OO.OO
15.O8.4O12.OO16.O68.4O
16.O..O5.OO31.O69.OO
20.......................................OO....................O
20.OO.......................O..............O....................O......OO
18.5O22.O.O29.O3.O4.OO.OO34.3O
17.O4.O22.OO31.4O4.4O33.O3.OO
17.O..3O64.OO34.O.O..OO
17.OO..O34.4O5.OO32.OO21.O5.O
19.OO35.O3.O3.OO.OO31.OO21.O..OO
56.O........OOOO.................O............O.......................O
56..O........OO..................OO.....................................O
56................................OO................................O
15.4O67.OO16.OO16.O6.OO
15.O3.O85.OO11.O3.O4.OO.OO
15.O17.4O67.O14.4O4.4O
16.O16.O3.O11.OO77.OO6.O
33.O12.3O.OO85.O6.OO
34.O11.5O37.OO19.OO22.O3.O4.OO.OO
25.O21.3O19.OO15.OO.OO19.OO22.4O4.4O
24.O43.4O14.4O19.O33.OO
7.O16.O3.O39.OO.OO14.OO
6.O.................OOOO..........................................OO
6.O3.O103.OO16.3O7.O
6.4O105.OO15.O9.OO
114.O.................OOO......O.OO
114......................OOO...O.O
114............................OO
10.OO4.O102.OO
8.OO.OO3.4O100.OO
8.O..O4.5O98.O
8.O..O9.O122.OO
9.OO8.OO105.OO14.OO.OO
19.O105.4O13.4O
125.OO.OO.............OO
7.O8.OO109.OO
6.O........OOOO
6.O...O...OO.OO
6.OOOO.....OO

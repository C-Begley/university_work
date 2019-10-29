#C still life  Any stable pattern, usually assumed to be finite
#C    and nonempty.  For the purposes of enumerating still lifes this
#C    definition is, however, unsatisfactory because, for example, any
#C    pair of blocks would count as a still life, and there would therefore
#C    be an infinite number of 8-bit still lifes.  For this reason a
#C    stricter definition is often used, counting a stable pattern as a
#C    single still life only if its islands cannot be divided into two
#C    nonempty sets both of which are stable in their own right.  Compare
#C    pseudo still life.
#C      The requirement that a still life not be decomposable into two
#C    separate stable patterns may seem a bit arbitrary, as it does not
#C    rule out the possibility that it might be decomposable into more
#C    than two.  This is shown by the patterns in the following diagram,
#C    both found by Gabriel Nivasch in July 2001.  On the left is a 32-cell
#C    pattern that can be broken down into three stable pieces but not into
#C    two.  On the right is a 34-cell pattern that can be broken down into
#C    four stable pieces but not into two or three.  (Note that, as a
#C    consequence of the Four-Colour Theorem, four is as high as you need
#C    ever go.)  It is arguable that patterns like these ought not to be
#C    considered as single still lifes.
	......**...........**.
	..*.*..*......**.*..*.
	.*.**.*.......*.**.*..
	.*....**...........**.
	**.**.........*.**...*
	...**.**....***.**.**.
	**....*....*.......*..
	.*.**.*.....***.**.*..
	*..*.*........*.*.*...
	**....................
.
.
.
.
#C      Still lifes have been enumerated by Conway (4-7 bits), Robert
#C    Wainwright (8-10 bits), Dave Buckingham (11-13 bits), Peter Raynham
#C    (14 bits) and Mark Niemiec (15-24 bits).  The resulting figures are
#C    shown below.  (These figures shouldn't be affected by the above
#C    discussion of the strict definition of "still life", because it is
#C    unlikely that there are any doubtful cases with much less than 32
#C    cells.)
#C 	-------------
#C 	Bits   Number
#C 	-------------
#C 	  4        2
#C 	  5        1
#C 	  6        5
#C 	  7        4
#C 	  8        9
#C 	  9       10
#C 	 10       25
#C 	 11       46
#C 	 12      121
#C 	 13      240
#C 	 14      619
#C 	 15     1353
#C 	 16     3286
#C 	 17     7773
#C 	 18    19044
#C 	 19    45759
#C 	 20   112243
#C 	 21   273188
#C 	 22   672172
#C 	 23  1646147
#C 	 24  4051711
#C 	-------------


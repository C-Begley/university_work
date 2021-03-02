#C A c/3 rake that produces a stream of gliders determined by a pseudo-random
#C number generator.  Many gliders already output by the device are shown
#C in the pattern.  This is a smaller version of a previous pattern.
#C
#C The base period is 90 generations, and gliders are (possibly) emitted at
#C multiples of this base period.  The output is generated based on the
#C pattern of the absence or presence of MWSS's and blinkers within the device.
#C These (possibly present) MWSS's and blinkers form a loop within the device.
#C MWSS's head upwards to the front of the device, and are turned into blinkers
#C which remain until the middle of the device catches up to them.  The blinkers
#C are then used to XOR the MWSS's stream to change its state.  The stream of
#C MWSS's is detected at the top of the device to produce the output gliders.
#C Moving the period 45 spaceship at the head of the MWSS stream upwards by
#C multiples of 30 cells increases the number of bits in the PRNG, which can
#C increase the period of the device.  This is based on a design for a moving
#C PRNG by Dean Hickerson, with some modifications of my own.
#C
#C David I. Bell, November 2002
x = 1292, y = 971
1124b3o$1124b3o$1104boob3o13bo3bo13b3oboo$1104boo4booboo21booboo4boo$
1103bobbobo4boo7bo5bo7boo4bobobbo$1110boobobboo4booboboo4boobboboo$
1116boboo11boobo$1111b3oboobbo3bo3bo3bobboob3o$1111bo3b3obo4bobo4bob3o
3bo$1109booboboo4bobbo3bobbo4booboboo$1108bobobbo8bobobobo8bobbobo$
1106b3obobbo5boobobbobboboo5bobbob3o$1105boobo9bobobob3obobobo9boboo$
1104bo3bo9bobobbooboobbobo9bo3bo$1119b3obbobobb3o$1120boboo3boobo$
1118boo3bo3bo3boo$1118bobo4bo4bobo$1120bobbobobobbo$1120bob3ob3obo$
1120bobo5bobo$1117boobobobbobboboboo$1117boobobobbobboboboo$1120bobob
3obobo$1119bobb7obbo$1093boboob3o49b3oboobo$1092booboo4boobo16bo7bo16b
oboo4booboo$1091bobbobobbo3b3o18b3o18b3o3bobbobobbo$1092bo5bo3bo3bo13b
3o5b3o13bo3bo3bo5bo$1105boo4b3o5boob3ob3oboo5b3o4boo$1105boobboobo9b3o
b3o9boboobboo$1106boo4boboo9bo9boobo4boo$1111bobbobo3boo7boo3bobobbo$
1106boobobbobobobo13bobobobobboboo$1102boo6bo8bo11bo8bo6boo$1101boobo
12bob13obo12boboo$1101boobo41boboo$1099b3oboo3bo13b7o13bo3boob3o$1094b
o3bo4bobb3ob3o9b7o9b3ob3obbo4bo3bo$1093b4o4b3obboo5bo7bo3bo3bo7bo5boo
bb3o4b4o$1092bo3bo9boobobbo25bobboboo9bo3bo$1093bobobbo4boo4bo31bo4boo
4bobbobo$1097bo9bob3o27b3obo9bo$1109bo3bo5boo9boo5bo3bo$1108bobobbo5b
oo3b3o3boo5bobbobo$1113boo3boo3b5o3boo3boo$1105b3obbooboo3bobb3o3b3obb
o3booboobb3o$1104boo8bo3b5o5b5o3bo8boo$1094bo6boboo3bobobbo5b3o7b3o5bo
bbobo3boobo6bo$1090boobobo4bobooboobobo29bobobooboobo4boboboo$1090boo
4bobbo3boboo11bo13bo11boobo3bobbo4boo$1089bobbo3bo3bobobbo12bo13bo12bo
bbobo3bo3bobbo$1098boboo3bo12bobboo5boobbo12bo3boobo$1094boo3bo3bo17b
3o3b3o17bo3bo3boo$1094b3obobobboo15boobo3boboo15boobbobob3o$1095bobo
20b3oboo3boob3o20bobo$1096bo22b5o3b5o22bo$1120boboo3boobo$1121boo5boo$
1173bo$1172bobo$1156bo14bo3bo14bo$1152b3ob3o13b3o13b3ob3o$1151bo6bob3o
21b3obo6bo$1152boo3bo5bo6boo3boo6bo5bo3boo$1160b7o3boo3boo3b7o$1158bo
bboo3boobb3ob3obboo3boobbo$1159boobo4boo9boo4boboo$1165b4obbooboobb4o$
1157boob4o7booboo7b4oboo$1156boboboo5boobob3oboboo5boobobo$1153boobo
10boobo5boboo10boboo$1153boobo9bobobo5bobobo9boboo$1153bobo10bo3bo5bo
3bo10bobo$1172bobo$1166bo3b3ob3o3bo$1166bob5ob5obo$1166bobo9bobo$1168b
obooboboobo$1167boobob3oboboo$1168bobob3obobo$1165booboboo3booboboo$
1165boobobo5boboboo$1166bobobo5bobobo$1147bo21boo5boo21bo$1140boob3ob
3o20b7o20b3ob3oboo$1140boo4bobbooboo19bo19booboobbo4boo$1139bobboboo3b
obboo14bobobbobbobo14boobbo3boobobbo$1151bobbo5bo6boobo5boboo6bo5bobbo
$1155bobb4o5boo3bobo3boo5b4obbo$1158bo3bo6boo5boo6bo3bo$1153b3obbobob
oo5b9o5boobobobb3o$1156bobbooboboo15booboboobbo$1158boobo3boboo9boobo
3boboo$1116b3o46bobob9obobo$1116bobbo46b15o$1116bo51bo9bo$1116bo3bo49b
o5bo$1116bo52bo7bo$1117bobo36bo13bo5bo$1155boboboo10b5o$1154bo4boo$
1128bo22boboo3bobbo$1128bo21booboobo$1128bo20bobb6o$1145boo9bobbo$
1134boob3o4boobo3bo3bo3bo$1134boo4boobboob3oboobbobboo5bo15bo$1133bobb
obo3boboo5boo3bobbo4boo15boo$1116b3o21b3o5boo5bo8bo17bo$1115bobbo23b3o
bo23boo3boo$1118bo23boo20boo3bobo3bobo3boo$1114bo3bo45bob5o5b5obo$
1118bo45bo3boo7boo3bo$1115bobo47b3o11b3o$1165b3o11b3o4$1168b3o5b3o$
1168bobbo3bobbo$1167bo11bo$1168bo3bobo3bo$1169bobbobobbo$1169bobooboob
o$1168boobo3boboo$1168booboobooboo$1168booboobooboo$1170bo5bo4$1128bo
41boo3bo$1128bo41boo3bo$1128bo40boo$1170b3o$1170b3o$1171boo$$1116b3o$
1115bobbo$1118bo$1114bo3bo54boo$1118bo54boo$1115bobo$1166bo$1165bobo$
1166bo$1163bobo6boo$1163b3o7booboo$1162bobbo11boo$1163b3obo4boo$1166bo
$1166bo$1196boobo$1193boobooboo$1193bobbobobbo$1187boo4boo5bo$1187boob
oo$1168bo17bo3boo$1167bobo20boo$1166bobbobb3o$1128bo38boo3bobbo$1128bo
46bo$1128bo42boobbo$1170bo3bo$1138bo3bo$1136b3oboobobo23boo$1132booboo
6bobbo$1116b3o13boobbobbo3bobboobboo$1115bobbo12bobbo4bobbobbooboboo$
1118bo23boo4bo3bo$1114bo3bo22boobbobbobobo$1118bo24bo$1115bobo31b3o8$
1151boo$1142boo7boo$1139booboo7boo$1136b4obboo4boo27boo$1135bo4bo4boob
oo26bobo$1136boo7boo3bo7bo16b3o$1145boo9b4o16b5o$1152booboo3bo3bo$
1152boobbo5b4o15bo$1151bobbo7bo3bo11bobbo$1128bo31bobbobo13b3o$1128bo
32bo11boo6boo$1128bo43b3o3boboo$1178b3o$1179bo18$1116b3o$1116bobbo$
1116bo$1116bo3bo$1116bo$1117bobo3$1128bo67b3oboo$1128bo65boo4boo$1128b
o64bo3bobobbo$1188b3obb3o$1178boo7bobob3o$1171bo6boo8bo4bo$1170boo19b
oo$1170bobo27boobo$1197boobooboo$1197bobbobobbo$1191boo4boo5bo$1191boo
boo$1190bo3boo$1148boo44boo$1147boo$1149bo5$1126bo37boboo22boobo$1125b
oo36boobooboo16boobooboo$1125bobo34bobbobobbo16bobbobobbo$1163bo5boo4b
oo4boo4boo5bo$1172booboo4booboo$1172boo3bobbo3boo$1172boo10boo$$1103b
oo$1102boo$1104bo$1174bo$1173bobo$1157bo14bo3bo14bo$1153b3ob3o13b3o13b
3ob3o$1152bo6bob3o21b3obo6bo$1153boo3bo5bo6boo3boo6bo5bo3boo$1161b7o3b
oo3boo3b7o$1159bobboo3boobb3ob3obboo3boobbo$1160boobo4boo9boo4boboo$
1166b4obbooboobb4o$1158boob4o7booboo7b4oboo$1157boboboo5boobob3oboboo
5boobobo$1058boo94boobo10boobo5boboo10boboo$1057boo95boobo9bobobo5bobo
bo9boboo$1059bo94bobo10bo3bo5bo3bo10bobo$1173bobo$1167bo3b3ob3o3bo$
1167bob5ob5obo$1167bobo9bobo$1036bo132bobooboboobo$1035boo131boobob3ob
oboo$1035bobo131bobob3obobo$1069bo96booboboo3booboboo$1068b3o95boobobo
5boboboo$1049boboo14bo3bo14boobo77bobobo5bobobo$1048boobooboobo10b3o
10boboobooboo57bo21boo5boo21bo$1047bobbobobooboo8b5o8booboobobobbo49b
oob3ob3o20b7o20b3ob3oboo$1048bo6bo5bo4boo3boo4bo5bo6bo50boo4bobbooboo
19bo19booboobbo4boo$1056bo3b4obo7bob4o3bo57bobboboo3bobboo14bobobbobbo
bo14boobbo3boobobbo$1060bo3b3obobob3o3bo49bo23bobbo5bo6boobo5boboo6bo
5bobbo$1055boobobbo3boo5boo3bobboboo44bo27bobb4o5boo3bobo3boo5b4obbo$
1054bo4bobbobobbooboobbobobbo4bo43bo30bo3bo6boo5boo6bo3bo$1053boobobo
6boo5boo6boboboo68b3obboboboo5b9o5boobobobb3o$1051boobobo6boobobobobob
oo6boboboo69bobbooboboo15booboboobbo$991bo57boobo9bo3bobbobbo3bo9boboo
69boobo3boboo9boobo3boboo$990boo56bo3bo9boboboo3boobobo9bo3bo75bobob9o
bobo$990bobo56bobo11bobobo3bobobo11bobo77b15o$1066bobobobo96b3o5b3o$
1063bo11bo98bo$1061boobo3bobo3boboo96bo$1064bo4bo4bo116bo$1064boboobob
oobo112boobobo$1063boobo5boboo111boo4bo$1062bobobo5bobobo109bobbo3boob
o$1061boobobob3oboboboo113bobooboo$1064bobo5bobo115b6obbo$1061booboboo
3booboboo110bobbo9boo$1040boboo24b3o24boobo67boo13boo5bo3bo3bo3boboo4b
3oboo$1036b3obooboboo18b9o18booboboob3o62boobo11boboo4boobbobboob3oboo
bboo4boo$946bo88bo6boobb4o15boo5boo15b4obboo6bo61booboo9booboo4bobbo3b
oo5boobo3bobobbo$945boo89boo3bo3bo4bo12boo9boo12bo4bo3bo3boo63booboo7b
ooboo9bo5boo5b3o$945bobo100b3o5boo9bobobo9boo5b3o76bobo9bobo19bob3o$
1054boboo5bobboo3boobbo5boobo82bo13bo22boo$1051boboo3boo19boo3boobo79b
3o9b3o$1050booboobobobo4bob5obo4bobobobooboo79boo9boo$1050boobo4bob3ob
11ob3obo4boboo$1054boobo3bob13obo3boboo87booboo$1061bo15bo$1062bo13bo
95booboo80bo$1172bo3bo79bobo$1068b3o99bo7bo61bo14bo3bo14bo$1064b4o3b4o
94bobo5bobo56b3ob3o13b3o13b3ob3o$1052bo11bobb5obbo93bo3booboo3bo54bo6b
ob3o21b3obo6bo$1051boob3o8b9o98booboo59boo3bo5bo6boo3boo6bo5bo3boo$
1049b3o5bo7boo5boo95boobbobobboo64b7o3boo3boo3b7o$1046boo7boo114boo3b
oo64bobboo3boobb3ob3obboo3boobbo$1046boo4bo190boobo4boo9boo4boboo$
1005bo40b3o4bo195b4obbooboobb4o$1004bobo27bo5b3o5boo3boo186boob4o7boob
oo7b4oboo$988bo14bo3bo14bo7b3ob3o6bobb3obboobboo183boboboo5boobob3obob
oo5boobobo$984b3ob3o13b3o13b3ob3obbo6boo5boo6boob3o180boobo10boobo5bob
oo10boboo$983bo6bob3o21b3obo6bobboo3bobbob4o3boobbooboo4boo15boo92boo
64boobo9bobobo5bobobo9boboo$878boo104boo3bo5bo6boo3boo6bo5bo3boo31bo
21bo90boo3boo59bobo10bo3bo5bo3bo10bobo$877boo113b7o3boo3boo3b7o21bo17b
3o17b3o95bo79bobo$879bo110bobboo3boobb3ob3obboo3boobbo17bobo18bo6boo3b
oo6bo91boobbo74bo3b3ob3o3bo$991boobo4boo9boo4boboo46boo3boo98boo3boo
72bob5ob5obo$997b4obbooboobb4o46bo17bo171bobo9bobo$989boob4o7booboo7b
4oboo37b3o15b3o172bobooboboobo$988boboboo5boobob3oboboo5boobobo39bo13b
o174boobob3oboboo$856bo128boobo10boobo5boboo10boboo34boboo11boobo98boo
73bobob3obobo$855boo128boobo9bobobo5bobobo9boboo35boo13boo98b3o70boobo
boo3booboboo$855bobo127bobo10bo3bo5bo3bo10bobo38b3o5b3o41b3o56bo73boob
obo5boboboo$1004bobo57bobbo3bobbo41bobbo53b3obbo71bobobo5bobobo$998bo
3b3ob3o3bo51boboo3boobo41bo56bo4bo52bo21boo5boo21bo$998bob5ob5obo103bo
3bo53b3o3bo43boob3ob3o20b7o20b3ob3oboo$998bobo9bobo103bo57boob3obo42b
oo4bobbooboo19bo19booboobbo4boo$1000bobooboboobo106bobo51bobobbooboo
42bobboboo3bobboo14bobobbobbobo14boobbo3boobobbo$833boo164boobob3obob
oo52bobobobobobo95bobboo4b4o52bobbo5bo6boobo5boboo6bo5bobbo$832boo166b
obob3obobo53bobobobobobo95bobbobobo4boo55bobb4o5boo3bobo3boo5b4obbo$
834bo162booboboo3booboboo50bo9bo53bo41b3o11bo57bo3bo6boo5boo6bo3bo$
997boobobo5boboboo51boo5boo54bo42bob3o6b3o52b3obboboboo5b9o5boobobobb
3o$998bobobo5bobobo51bobo5bobo53bo43b3o5boo58bobbooboboo15booboboobbo$
979bo21boo5boo21bo32bobbo3bobbo167boobo3boboo9boobo3boboo$972boob3ob3o
20b7o20b3ob3oboo26boo5boo105b3o67bobob9obobo$972boo4bobbooboo19bo19boo
boobbo4boo27bo5bo177b15o$971bobboboo3bobboo14bobobbobbobo14boobbo3boob
obbo108boboo100b4o3b4o$983bobbo5bo6boobo5boboo6bo5bobbo88b3o28booboob
oo99boo3boo$987bobb4o5boo3bobo3boo5b4obbo91bobbo27bobbobobbo98b3obob3o
$990bo3bo6boo5boo6bo3bo46boo49bo28bo5boo4boo79bo11bobbo3bobbo$985b3obb
oboboo5b9o5boobobobb3o40boobo44bo3bo37booboo78boboboo6b3o3bo3b3o$988bo
bbooboboo15booboboobbo44bobo48bo37boobbo17boo58bo4boo11bobo$990boobo3b
oboo9boobo3boboo47bo46bobo38boo17boobboo54boboo3bobbo9bobobo$997bobob
9obobo160boobobbo53booboobo14b5o$998b15o162boo3bo52bobb6o12bobobobo$
1000b3o5b3o218boo9bobbo6b3obbooboobb3o$1005bo212boob3o4boobo3bo3bo3bo
11bo3bo$1005bo63boo106boo39boo4boobboob3oboobbobboo12b3o$1022bo46boo
106bo27bo3bo7bobbobo3boboo5boo3bobbo12b3o$1018boobobo178boboboob3o12b
3o5boo5bo$1018boo4bo176bobbo6booboo10b3obo$1017bobbo3boobo34bobo131boo
bboobbo3bobbobboo10boo19boo$1022bobooboo29b4obbo3bo3bo123booboboobbobb
o4bobbo28bo3bo$1021b6obbo28bo8bo4boo121bo3bo4boo38bo5boo12bo4bo$1019bo
bbo9boo23bobbooboobboo5bo120bobobobbobboo44bo12boboobo$997boo13boo5bo
3bo3bo3boboo4b3oboo12b3o4bo6boobo129bo38bo3boo5boo3boo3boboo$996boobo
11boboo4boobbobboob3oboobboo4boo13boobboo8boo122b3o48bo6boo3boo$996boo
boo9booboo4bobbo3boo5boobo3bobobbo16boo180bo4boo$997booboo7booboo9bo5b
oo5b3o52b3oboo91bo$998bobo9bobo19bob3o52boo4boo90b4o55b3o$998bo13bo22b
oo51bo3bobobbo30bo$998b3o9b3o70b3obb3o37bo60bo$999boo9boo70bobob3o39bo
58boo65boo3boo$1083bo4bo102bo3boo57boo3boo$1003booboo78boo102bob3obo$
1061bo4bo102boo19boboobo8boo48boo3boo$1003booboo52bobobbobo4bo96boo20b
o12booboo45boo3boo$1003bo3bo52bobo9boo124boo4boobb4o$1001bo7bo50boo12b
o123booboo4bo4bo$1000bobo5bobo47b3o4bobbobb3o115bo7bo3boo7boo$999bo3b
ooboo3bo22booboo18bo7bo4bobo95b3o17b4o9boo$1003booboo23boobooboboo16bo
3boobbo4bo96bobbobbo9bo3bo3booboo$1000boobbobobboo17b4obb3obbob3o11boo
bobboo4b3o97bo4bo9b4o5bobboo58boo3bo$698boo302boo3boo18bo4bo5b3o4b3o7b
oo4bo105bobobbobo10bo7bobbo56bobbobobo$697boo329boo8bob3obobobo6b3o3b
oo105boo3boo3bo3bobobbo65boo3bobo$699bo339b4obobobo8bo3bo6bo109bo7bo
66booboboo$1037bobbo4bobo10b3o5booboo107bobo74b4o$1038bo19b3o4booboo
68boo9b3o5boo96b4o$1046bo18b4o64bobooboo7boobobobooboo92bo7bo$1002boo
42bo85b3obo3boo4bo3bobobobbobo90bo4bo4bo$1002boo3boo57bo3boo59bo3boobo
bobo4boboboo3bobbo89b3obbobobb3o$1007bo57b3oboboo59bo3b3obob3o5bobob4o
bbo20bo68bo4bo4bo$1002boobbo64boo63bo3bobbooboobboboboobo22b4o67boo5b
oo$1002boo3boo56bo4boo65boobbobboo6b4o4bo14bo3bo3booboo65bo3bo$1064boo
boobbo64b3o5bo4bo9b3o12b4o5bobboo65bobobo$1065bo5bo63boobboo3bo6bo6bo
3boo9bo3bo7bobbo65b3o$1066b3o69boo3boo8bobboo3b3o10bobobbo75b3o$1008b
oo27b3o27boo66booboo4bo12bo3boo15bo78boo$653boo352b3o23boboo3bo103bo
112boo$652boo352bo25b3o3b3obb3o202bo$654bo349b3obbo21bo3bo4b3obobo199b
obbo$1004bo4bo22bo7bo4bo8boo189bo$1005b3o3bo29boo8booboo189bo3bo$1005b
oob3obo35b4obboo4boo$1002bobobbooboo35bo4bo4booboo184boob3oboobo5b3o
15boobo$1001bobboo4b4o34boo7boo3bo183boo5b4o4bobbo12boobooboo$1001bobb
obobo4boo42boo189bobobb3o4bo16bobbobobbo$1001b3o11bo100b3o129bobbo8bo
bbo7boo4boo5bo$1002bob3o6b3o77bo21bobbo128bobbo9bobbo7booboo$1003b3o5b
oo72b3o4b4o8b3o11bo129bobo10bo8bo3boo$1084bo3boobo3boo8bobooboobbo3bo
155boo$1010b3o71bobobbobobo3bo4boobo4boo6bo138boo$1083boo4bobobbo6bobo
bo3bobbobbobo139bobbo$979boboo79boo21boobbobob7obobobo150bo4bo$978boob
ooboo73booboo22bo4bo5bo5bo3bo147b3o3bo$977bobbobobbo70b4obboo4boo12b3o
bboobboo4bo6boo150bob3o$978bo5boo4boo63bo4bo4booboo11b4o4b3o7boobbo4bo
113bo3bo30b3o$987booboo64boo7boo3bo9bo3b3o11boo3bo3boo111b3oboobobo$
987boobbo17boo54boo18b3o10b3o115booboo6bobbo$987boo17boobboo68bobo3boo
10boo4b3o109boobbobbo3bobboobboo$586bo418boobobbo160boo41bobbo4bobbobb
ooboboo21b3o$585boo419boo3bo162boo3bo46boo4bo3bo$585bobo584bo7bo44boo
bbobbobobo$1172bo5bo48bo$1008boo159boboo4bo55b3o$1008bo27bo3bo124bo4b
oobboobo$1033boboboob3o120boo5bo17b3o9b3o$1032bobbo6booboo117boo20boob
obo7boboboo$1027boobboobbo3bobbobboo136bobo4bo9bo4bobo$1027booboboobbo
bbo4bobbo134boboo9bo9boobo$1026bo3bo4boo91bo52bo3b4o5bobo5b4o3bo$1026b
obobobbobboo31boo57bo55bobbo5bo3bo5bobbo$1035bo31b4o57bo53bo11b3o11bo$
1027b3o36b3o4boo109b4o15b4o19boo$1065bo6bobo108b4obbooboo3booboobb4o
15booboo$541bo477bo45b3o3boobo110bo4boboo3boobo4bo14b4obboo4boo$540boo
476b4o44boo3b4o113bobobo5bobobo16bo4bo4booboo$540bobo531b3o143boo7boo
3bo7bo$1020bo54boo152boo9b4o$1018boo216booboo3bo3bo$1022bo3boo208boobb
o5b4o$1021bob3obo10boobo193bobbo7bo3bo$1000boo19boboobo8boobooboo201bo
bbobo$1000boo20bo12bobbobobbo201bo$1029boo4boo5bo$1029booboo233bo$
1020bo7bo3boo233bo$999b3o17b4o9boo8bo11bo$998bobbobbo9bo3bo3booboo13b
4o9b4o$998bo4bo9b4o5bobboo12boo3bo7bo3boo$496bo501bobobbobo10bo7bobbo
8bobo4bo9bo4bobo$495boo502boo3boo3bo3bobobbo16boo3bo7bo7bo3boo$495bobo
511bo7bo18bo3boo5b3o5boo3bo55b3o$1009bobo26boboo4bo3bo4boobo57bobbo
141b3o$1036boobbo6b3o6bobboo55bo143booboo$1040bo5b5o5bo59bo3bo139boobo
bo$1036bo3bobooboo3booboobo3bo55bo144bo3bo$1038boo3bo9bo3boo58bobo141b
obbo$473boo567bobboo3boobbo207b3o$472boo$474bo5$451bo$450boo$450bobo5$
1280b3oboo$428boo848boo4boo$427boo848bo3bobobbo$429bo842b3obb3o$1271bo
bob3o$1272bo4bo$1141bobo131boo$1093bo47boo107b3o31boobo$1091bobo48bo
107bo30boobooboo$977boob3o109boo157bo10boo17bobbobobbo$977boo4boo277b
oo11boo4boo5bo$976bobbobo3bo13boo274booboo$983b3obb3o8boo273bo3boo$
985b3obobo286boo$985bo4bo14boo221boo$986boo18boo220bobo$975boboo26bo
222bo$974boobooboo$973bobbobobbo146bo$974bo5boo4boo140bo$983booboo140b
o119boboo22boobo$983boo3bo39bo218boobooboo16boobooboo$983boo43boo175b
3o38bobbobobbo16bobbobobbo$361bo665bobo175bo41bo5boo4boo4boo4boo5bo$
360boo844bo49booboo4booboo$360bobo893boo3bobbo3boo$1256boo10boo3$985bo
boo22boobo35boo131boo$984boobooboo16boobooboo35boo130bobo$983bobbobobb
o16bobbobobbo33bo132bo$984bo5boo4boo4boo4boo5bo$993booboo4booboo$993b
oo3bobbo3boo$993boo10boo$1073bo$1073boo85b3o$1072bobo85bo$1161bo5$
1095boo41boo$1096boo40bobo$293boo800bo42bo$292boo783bo$294bo781bobo77b
3o$1060bo14bo3bo14bo61b3o$1056b3ob3o13b3o13b3ob3o37boob3o13bo3bo13b3ob
oo$1055bo6bob3o21b3obo6bo36boo4booboo21booboo4boo$1056boo3bo5bo6boo3b
oo6bo5bo3boo36bobbobo4boo7bo5bo7boo4bobobbo$271bo792b7o3boo3boo3b7o51b
oobobboo4booboboo4boobboboo$270boo790bobboo3boobb3ob3obboo3boobbo55bob
oo11boobo$270bobo790boobo4boo9boo4boboo51b3oboobbo3bo3bo3bobboob3o$
1069b4obbooboobb4o57bo3b3obo4bobo4bob3o3bo$1061boob4o7booboo7b4oboo47b
ooboboo4bobbo3bobbo4booboboo$1060boboboo5boobob3oboboo5boobobo45bobobb
o8bobobobo8bobbobo$1057boobo10boobo5boboo10boboo40b3obobbo5boobobbobbo
boo5bobbob3o$1057boobo9bobobo5bobobo9boboo39boobo9bobobob3obobobo9bob
oo$1057bobo10bo3bo5bo3bo10bobo38bo3bo9bobobbooboobbobo9bo3bo$1076bobo
72b3obbobobb3o$1070bo3b3ob3o3bo67boboo3boobo$1070bob5ob5obo65boo3bo3bo
3boo$1070bobo9bobo65bobo4bo4bobo$1072bobooboboobo69bobbobobobbo$1071b
oobob3oboboo68bob3ob3obo$226bo845bobob3obobo69bobo5bobo$225boo842boobo
boo3booboboo63boobobobbobboboboo$225bobo841boobobo5boboboo30b3o30boobo
bobbobboboboo$1070bobobo5bobobo31bobbo32bobob3obobo$1051bo21boo5boo21b
o12bo34bobb7obbo$1044boob3ob3o20b7o20b3ob3oboo5bo3bo4boboob3o49b3oboob
o$1044boo4bobbooboo19bo19booboobbo4boo5bo7booboo4boobo16bo7bo16boboo4b
ooboo$1043bobboboo3bobboo14bobobbobbobo14boobbo3boobobbo5bobo3bobbobo
bbo3b3o18b3o18b3o3bobbobobbo$1055bobbo5bo6boobo5boboo6bo5bobbo24bo5bo
3bo3bo13b3o5b3o13bo3bo3bo5bo$1059bobb4o5boo3bobo3boo5b4obbo41boo4b3o5b
oob3ob3oboo5b3o4boo$1062bo3bo6boo5boo6bo3bo44boobboobo9b3ob3o9boboobb
oo$1057b3obboboboo5b9o5boobobobb3o40boo4boboo9bo9boobo4boo$1060bobboob
oboo15booboboobbo48bobbobo3boo7boo3bobobbo$1062boobo3boboo9boobo3boboo
45boobobbobobobo13bobobobobboboo$1069bobob9obobo56bo8bo11bo8bo$181bo
888b15o64bob13obo$180boo890b11o$180bobo933b3o$1074booboboo34bobbo$
1060bo14bobobo38bo35boo3boo$1059boboboo10bo3bo34bo3bo35boo3boo10bob3o$
1058bo4boo8b9o36bo37b3o11booboo$1055boboo3bobbo5boobo5boboo31bobo34boo
3bo3boo6bobbob3o$158boo894booboobo13bob3obo70bobbo5bobbo6bo4boob3o$
157boo894bobb6o8bo13bo66bobooboboboobo17bo$159bo889boo9bobbo6boboo7boo
bo65boobobbobobboboo7b3obbobbo4bo$1038boob3o4boobo3bo3bo3bo7b3o7b3o68b
o9bo8b3o3bo6boo6boobo$1038boo4boobboob3oboobbobboo8b3o5b3o87bo4b5obboo
bo3boobooboo$1037bobbobo3boboo5boo3bobbo6boboo7boobo91bo3bobobbo3bobbo
bobbo$1044b3o5boo5bo10b3o9b3o85boboboo6b4o3boo5bo$136bo883bo25b3obo20b
3o7b3o65b3o11b3o18boboo$135boo882bobo24boo24b3o5b3o104bo25b3o$135bobo
865bo14bo3bo14bo34bo9bo33b3o34b3o3b3o25bo25b3o$999b3ob3o13b3o13b3ob3o
30boobbobobboo33bobbo32boboo3boobo30boob3o13bo3bo13b3oboo$998bo6bob3o
21b3obo6bo30bobo3bobo34bo34bo4b3o4bo29boo4booboo21booboo4boo$999boo3bo
5bo6boo3boo6bo5bo3boo32bobbobbo4bobo28bo3bo31bo9bo29bobbobo4boo7bo5bo
7boo4bobobbo$1007b7o3boo3boo3b7o41bo3bo5bobo28bo36boo5boo37boobobboo4b
ooboboo4boobboboo$1005bobboo3boobb3ob3obboo3boobbo50bo30bobo28bo6bo3bo
45boboo11boobo$113boo891boobo4boo9boo4boboo113bo51b3oboobbo3bo3bo3bobb
oob3o$112boo898b4obbooboobb4o45boo3boo4bo114bo3b3obo4bobo4bob3o3bo$
114bo889boob4o7booboo7b4oboo37boo3boo3bobo62bo4boo3boo37booboboo4bobbo
3bobbo4booboboo$1003boboboo5boobob3oboboo5boobobo32bo13bobo62bo4boo3b
oo36bobobbo8bobobobo8bobbobo$1000boobo10boobo5boboo10boboo27bobo93bo
30b3obobbo5boobobbobboboo5bobbob3o$1000boobo9bobobo5bobobo9boboo28boo
92bo30boobo9bobobob3obobobo9boboo$1000bobo10bo3bo5bo3bo10bobo122b3o27b
o3bo9bobobbooboobbobo9bo3bo$91bo927bobo186b3obbobobb3o$90boo921bo3b3ob
3o3bo46boo3boo128boboo3boobo$90bobo920bob5ob5obo46boo3boo35b3o35boo3b
oo46boo3bo3bo3boo$1013bobo9bobo87bobbo35boo3boo46bobo4bo4bobo$1015bob
ooboboobo48boo3boo37bo90bobbobobobbo$1014boobob3oboboo47boo3boo33bo3bo
35boo3boo48bob3ob3obo$1015bobob3obobo92bo35boo3boo48bobo5bobo$1012boob
oboo3booboboo86bobo88boobobobbobboboboo$68boo942boobobo5boboboo177boob
obobbobboboboo$67boo944bobobo5bobobo45boo134bobob3obobo$69bo924bo21boo
5boo21bo25bobo85boo46bobb7obbo$987boob3ob3o20b7o20b3ob3oboo17bobo86bob
o19boboob3o49b3oboobo$987boo4bobbooboo19bo19booboobbo4boo17boo87boobo
17booboo4boobo16bo7bo16boboo4booboo$986bobboboo3bobboo14bobobbobbobo
14boobbo3boobobbo17boboo84boobo16bobbobobbo3b3o18b3o18b3o3bobbobobbo$
998bobbo5bo6boobo5boboo6bo5bobbo29bo3bo81bo3boo17bo5bo3bo3bo13b3o5b3o
13bo3bo3bo5bo$1002bobb4o5boo3bobo3boo5b4obbo34bo3bobobo76b3obo31boo4b
3o5boob3ob3oboo5b3o4boo$1005bo3bo6boo5boo6bo3bo38bo4bobo81bo30boobboob
o9b3ob3o9boboobboo$1000b3obboboboo5b9o5boobobobb3o29b3obboo4bo34b3o37b
o4bobo31boo4boboo9bo9boobo4boo$1003bobbooboboo15booboboobbo39b6o33bobb
o32boobbo4boboo35bobbobo3boo7boo3bobobbo$1005boobo3boboo9boobo3boboo
32bo5bo3b3o35bo39bobbo35boobobbobobobo13bobobobobboboo$1012bobob9obobo
39bo5bo41bo3bo35boo8bo32bo8bo11bo8bo$1013b15o40bo5bo41bo43bo5bo39bob
13obo$1015bo9bo91bobo40bo5bo47bo$1017bo5bo46b3o141bo$1017bo5bo138b3o
45b9o$1015b3o5b3o11bo171bobbo3bobbo$1014bo11bo6boobobo157b3obo8bo4bo4b
o$1018b5o10boo4bo157booboo7bo3b3o3bo$1018b5o9bobbo3boobo152b3obobbo11b
o$1013bobbo7bobbo9bobooboo23bo32boobo30bo56b3oboo4bo9boo3boo$bo1012b4o
b3ob4o9b6obbo23bo5boo9bo11boobooboo25b3ob3o23bo29bo17bo4bobo4bo$oo
1017b3o12bobbo9boo18b3obboobbo8boo10bobbobobbo23bo6boo10boo9bobo24bo4b
obbobb3o8bo3booboo3bo$obo1017bo13bo3bo3bo3boboo4b3oboo4bo3b4obo6boo4bo
4boo4boo5bo11b3o11boo3bobbo3bo4bo11bo6bo9boboo6boo6bo3b3o7bo11bo$1034b
oobbobboob3oboobboo4boo4bo5boobo6boo3bo5booboo19bobbo21b4o4bobo3bo5boo
bo11boobooboo3boboobb5o4bo11b3o$1034bobbo3boo5boobo3bobobbo19booboo5bo
3boo22bo21bo3bo3b3obobbo18bobbobobbo3bobbobo3bo18bo$1038bo5boo5b3o17b
oo10boo9boo18bo3bo19bobbobo5bo3b3o6bobo10bo5boo3b4o6boobobo$1047bob3o
20bo8b3o34bo20bo14bo7boo20boobo$1009boobo37boo19boo42bobo33b3o7bobo20b
o$1008b4obo13b3oboo37b3o79bo31bo18b4o$1008bo3boo13boobobo35bobbo91bobo
36b4obo13bo4boo$1017boo3boo6boo36b3o3bo88bo37boobobboo12b3obo$1017boo
3boo4b3obo9bo3bo21b3obbobobbo82b3ob3o33b3obboo3boo3boo4boo$1028b5o7b3o
boobobo24b6o75boo3b3ob3o20b3ob3o7b3obboo3boo3boo$1036booboo6bobbo23bob
oo76boo4boo3bo18b4obo4boobo4bobobo$1036boobbobbo3bobboobboo19bo4bo73b
oo4bo19bo3boo3boobo3b3o4b3o$1035bobbo4bobbobbooboboo21boobo73bo3boo19b
4o5boobo3bo3bo4bo$1046boo4bo3bo19bobbo74bo3boo18bo3bobo3bo9bo$1018bo3b
o22boobbobbobobo19bo39b3o36bo22bobobobo3bo$1017bobobobo23bo28bobbo36bo
bbo35bo3bo19b3o4bobo22boo3boo$1014booboo3booboo26b3o21boo37bo39bobbo
20bo30boo3boo$1017b3ob3o92bo3bo35boo$1116bo94boo3boo$1117bobo91boo3boo
5$1018bo3bo$1017bobobobo22boo140bo23bo3bo$1017bobobobo19booboo139b4o
19boobobobo$1018bobb3o16b4obboo4boo128bo3bo3booboo15boobobobo$1039bo4b
o4booboo127b4o5bobboo20boo$1020bo3bo15boo7boo3bo7bo53b3o61bo3bo7bobbo
15boboo$1019bo5bo23boo9b4o51bobbo52b3o7bobobbo25bo$1018bo3bo3bo29boob
oo3bo3bo49bo51bo3boobo7bo22boo5boo$1018bobbobobbo29boobbo5b4o44bo3bo
46b3obb3o3b3o28bo4bo4bo$1018bo3bo3bo28bobbo7bo3bo47bo45bobob3o4bo3bo
27bo3bobo3bo$1019bo5bo38bobbobo45bobo47bo4bo7bo28bo4bo4bo$1020bo3bo40b
o102boo38boo5boo$1021b3o186bo3bo$1210bo3bo$1211b3o$1019boo$1019boo193b
oo$1214boo$$1028b3o173b3o$1028bobbo84b3o84b4o$1022b4oboobboo83bobbo82b
4o3bobbo$1013boo6bo4booboobo83bo87bo$1013b3o5bo8bobbo48boo32bo3bo83b4o
5bo6bo$1013boo7bobo3boobbo49boo32bo34boo51bobbob5o4booboo$1015boo8bo3b
3o85bobo31boo48boo3boo10bobo$1015bobbo8b3o175bobo10b3o$1016boo187b3o9b
obo$1205boo11bo$$1019bo61boobo130bo$1017booboo21bo37b5o105bo22b4o$
1017bobboo17b3oboo37b4o63boo39boboboo17bobboo$1017boo8bo10bo5b3o142bo
4boo17bo4bo$1019bo4bobbo11boo7boo32b3o64boo35boboo3bobbo16bobboo$1019b
o23bo4boo32b3o31b3o66booboobo22boo$1009boo13bo17bo4b3o33bo31bobbo31bob
o31bobb6o$1009boo8bo21boo3boo5b3o5bo56bo32bo28boo9bobbo29boo$1019bo19b
oobboobb3obbo6b3ob3o48bo3bo32bo17boob3o4boobo3bo3bo3bo20bo8boo$1019bo
19b3oboo6boo5boo6bo51bo50boo4boobboob3oboobbobboo20bo$1040booboobboo3b
4obobbo3boo34b3oboo9bobo12boboo34bobbobo3boboo5boo3bobbo20bo$1098boo4b
oo23boobooboo38b3o5boo5bo$1055bo41bo3bobobbo21bobbobobbo40b3obo$1055bo
bo34b3obb3o29bo5boo4boo34boo$1091bobob3o40booboo$1092bo4bo40boo3bo$
1095boo41boo$1104boobo22bo$1067b3o31boobooboo17b3ob3o33boo$1067bo33bo
bbobobbo15bo6boo31bobo$1068bo26boo4boo5bo7b3o7boo3bobbo3bo28bo$1009boo
26bobbo54booboo16bobbo16b4o$1009boo25boobboo52bo3boo16bo19bo3bo52bo4bo
25boo$1037bobbo41boo14boo16bo3bo13bobbobo52bo6bo24boo$1082boo32bo18bo
15boo40bo4bo$1045boo70bobo31boo$1045bobo140b3o$1045bo144bo$1189bo$$
1068boboo22boobo42bo22bo$1067boobooboo16boobooboo37b3ob3o18b3ob3o$
1066bobbobobbo16bobbobobbo35bo6boo16boo6bo$1067bo5boo4boo4boo4boo5bo
37boo3bobbo3bo6bo3bobbo3boo$1076booboo4booboo56b4o4b4o$1076boo3bobbo3b
oo26b3o27bo3bobbo3bo$1076boo10boo25bobbo25bobbobo4bobobbo$998bo22bo14b
oo80bo26bo12bo38boo$994b3ob3o18b3ob3o8booboo75bo3bo77b4o9boob3o20b3ob
oo$993bo6boo16boo6bo7b4o80bo76booboo9boo4boo16boo4boo$994boo3bobbo3bo
6bo3bobbo3boo9boo78bobo78boo10bobbobo3bo14bo3bobobbo$1004b4o4b4o199b3o
bb3o4b3obb3o$1004bo3bobbo3bo201b3obobobbobob3o$1002bobbobo4bobobbo199b
o4bo4bo4bo$1003bo12bo201boo10boo6$1116b3o$1116bobbo$1116bo$1116bo3bo$
1116bo$1117bobo10$1116b3o$1080boo33bobbo$1079b4o35bo$1079booboo30bo3bo
32boo$1081boo35bo31booboo$1115bobo33b4o$1152boo9$1116b3o$1116bobbo$
1116bo$1116bo3bo$1116bo$1117bobo35b3o$1155b3o$1135boob3o13bo3bo13b3ob
oo$1135boo4booboo21booboo4boo$1134bobbobo4boo7bo5bo7boo4bobobbo$1069b
3o69boobobboo4booboboo4boobboboo$1069b3o75boboo11boobo$1049boob3o13bo
3bo13b3oboo50b3oboobbo3bo3bo3bobboob3o$1049boo4booboo21booboo4boo50bo
3b3obo4bobo4bob3o3bo$1048bobbobo4boo7bo5bo7boo4bobobbo47booboboo4bobbo
3bobbo4booboboo$1055boobobboo4booboboo4boobboboo30b3o20bobobbo8bobobob
o8bobbobo$1061boboo11boobo35bobbo18b3obobbo5boobobbobboboo5bobbob3o$
1056b3oboobbo3bo3bo3bobboob3o33bo17boobo9bobobob3obobobo9boboo$1056bo
3b3obo4bobo4bob3o3bo33bo16bo3bo9bobobbooboobbobo9bo3bo$1054booboboo4bo
bbo3bobbo4booboboo28bobo32b3obbobobb3o$1053bobobbo8bobobobo8bobbobo63b
oboo3boobo$1051b3obobbo5boobobbobboboo5bobbob3o59boo3bo3bo3boo$1050boo
bo9bobobob3obobobo9boboo58bobo4bo4bobo$1049bo3bo9bobobbooboobbobo9bo3b
o59bobbobobobbo$1064b3obbobobb3o74bob3ob3obo$1065boboo3boobo75bobo5bob
o$1063boo3bo3bo3boo70boobobobbobboboboo$1063bobo4bo4bobo70boobobobbobb
oboboo$1065bobbobobobbo75bobob3obobo$1065bob3ob3obo74bobb7obbo$1065bob
o5bobo40b3o5boboob3o49b3oboobo$1062boobobobbobboboboo37bobbo3booboo4b
oobo16bo7bo16boboo4booboo$1062boobobobbobboboboo37bo5bobbobobbo3b3o18b
3o18b3o3bobbobobbo$1065bobob3obobo40bo6bo5bo3bo3bo13b3o5b3o13bo3bo3bo
5bo$1064bobb7obbo40bobo16boo4b3o5boob3ob3oboo5b3o4boo$1038boboob3o49b
3oboobo33boobboobo9b3ob3o9boboobboo$1037booboo4boobo16bo7bo16boboo4boo
boo33boo4boboo9bo9boobo4boo$1036bobbobobbo3b3o18b3o18b3o3bobbobobbo37b
obbobo3boo7boo3bobobbo$1037bo5bo3bo3bo13b3o5b3o13bo3bo3bo5bo33boobobbo
bobobo13bobobobobboboo$1050boo4b3o5boob3ob3oboo5b3o4boo50bo8bo11bo8bo
6boo$1050boobboobo9b3ob3o9boboobboo57bob13obo12boboo$1051boo4boboo9bo
9boobo4boo87boboo$1056bobbobo3boo7boo3bobobbo68b7o13bo3boob3o$1051boob
obbobobobo13bobobobobboboo63b7o9b3ob3obbo4bo3bo$1055bo8bo11bo8bo67b7o
8bo5boobb3o4b4o$1062bob13obo37b3o50bobboboo9bo3bo$1115bobbo53bo4boo4bo
bbobo$1069b3o46bo51b3obo9bo$1118bo49bo3bo$1067bo5bo41bobo50bobbobo$
1067bobbobbo10bob3o78boo$1083booboo79booboobb3o$1082bobbob3o77bo8boo$
1083bo4boob3o53b3o12boo4bobbobo3boobo6bo$1094bo52bo3bo10b3o6bobobooboo
bo4boboboo31b3o$1085b3obbobbo4bo54boo8boo10boobo3bobbo4boo31b3o$1062b
oo13boo5b3o3bo6boo6boobo39bo5bo21bobbobo3bo3bobbo10boob3o13bo3bo13b3ob
oo$1062bobo11bobo4bo4b5obboobo3boobooboo37b4oboo5bo16bo3boobo19boo4boo
boo21booboo4boo$1062bobbo9bobbo10bo3bobobbo3bobbobobbo36bo3bo26bo3bo3b
oo14bobbobo4boo7bo5bo7boo4bobobbo$1062bobbo9bobbo4boboboo6b4o3boo5bo
38b3o12bo13boobbobob3o21boobobboo4booboboo4boobboboo$1063bobo9bobo19bo
boo15b3o30bo13bo20bobo28boboo11boobo$1064bo11bo23bo15bobbo65bo24b3oboo
bbo3bo3bo3bobboob3o$1064boo9boo23bo15bo93bo3b3obo4bobo4bob3o3bo$1064bo
11bo39bo91booboboo4bobbo3bobbo4booboboo$1117bobo32bo54bobobbo8bobobobo
8bobbobo$1068booboo78boo52b3obobbo5boobobbobboboo5bobbob3o$1069bobo78b
obo51boobo9bobobob3obobobo9boboo$1068booboo77bo20booboo27bo3bo9bobobb
ooboobbobo9bo3bo$1151boo3boo11boobobooboo39b3obbobobb3o$1067bo5bo78bo
4bo8b3obobb3obb4o37boboo3boobo$1065boo7boo76boobbo5b3o4b3o5bo4bo34boo
3bo3bo3boo$1065boobbobobboo76boo7bobobob3obo8boo35bobo4bo4bobo$1065boo
boobooboo85bobobob4o48bobbobobobbo$1066bobbobobbo87bobo4bobbo46bob3ob
3obo$1067boo3boo76boo19bo6booboo36bobo5bobo$1116b3o30bobbo10bo12boobob
ooboo30boobobobbobboboboo$1115bobbo30bobo11bo9b3obobb3obb4o27boobobobb
obboboboo$1118bo31bo18b3o4b3o5bo4bo29bobob3obobo$1075bo42bo9boob3o34bo
bobob3obo8boo29bobb7obbo$1115bobo10boo4boo19boo11bobobob4o14boboob3o
49b3oboobo$1067boo4bo53bobbobo3bo18b3o3boo6bobo4bobbo11booboo4boobo16b
o7bo16boboo4booboo$1067boo4bo60b3obb3o16bobobboo13bo11bobbobobbo3b3o
18b3o18b3o3bobbobobbo$1072bo63b3obobo7bo6boo11bo12boobo4bo5bo3bo3bo13b
3o5b3o13bo3bo3bo5bo$1067boo3boo62bo4bo23bo4bo9boobooboo16boo4b3o5boob
3ob3oboo5b3o4boo$1067boo3boo63boo17bo7bo15bobbobobbo15boobboobo9b3ob3o
9boboobboo$1152boobbo3boboo10boo4boo5bo17boo4boboo9bo9boobo4boo$1152bo
4bo16booboo31bobbobo3boo7boo3bobobbo$1074bo98bo3boo26boobobbobobobo13b
obobobobboboo$1074bo102boo30bo8bo11bo8bo6boo$1073bo69bo72bob13obo12bob
oo$1072boo42b3o23bobo100boboo$1069boob3o41bobbo22bobo96bo3boob3o$1069b
o3bo42bo42bo60bo7bo8b3ob3obbo4bo3bo$1070b3o3bo39bo41bobo60bo5bo8bo5boo
bb3o4b4o$1071bo3bobo39bobo37bo3bo57boobo3boboo7bobboboo9bo3bo$1067boo
4boobbo79bobbo8bobbo45bobbo5bobbo9bo4boo4bobbobo$1067b3o3boo81boboo9b
4o45boo3bobo3boo7b3obo9bo$1066bobbob3oboboo77bobo10bobbo46bo4bo4bo6bo
3bo$1067bo3bo7boo76bo66bo11bobbobo$1067bobboo4booboo154boo$1068boo82b
oo81booboobb3o$1076bo75boo81bo8boo$1076bo159bobbobo3boobo6bo$1076bo57b
o104bobobooboobo4boboboo$1047bo82b3ob3o77bo28boobo3bobbo4boo$1043b3ob
3o66b3o10bo6boo74booboo27bobbobo3bo3bobbo$1042bo6boo64bobbo11boo3bobbo
3bo69bo3bo27bo3boobo$1043boo3bobbo3bo62bo21b4o69bobo5boo23bo3bo3boo$
1053b4o17bo43bo21bo3bo67boobbo4boo22boobbobob3o$1053bo18bobbo39bobo20b
obbobo68bo3bo35bobo$1051bobbobobbo11bo3bo63bo73bo39bo$1052bo7bo10bobb
oo142bo$1071booboo143bo$1074boo139bo3boo$1074bo79b4o58bobboo$1072b3o
78boo4boo58boboo$1153bob3oboo57b5o16booboo$1100b3ob3o113bobo14booboboo
boo$1097b4obo4boobo110b3o10b3obobb3obb4o$1093bo3boo3boobo3b3o108bobo7b
3o4b3o5bo4bo$1092b4o5boobo3bo3bo3b3o101boobboo3bobobob3obo8boo$1091bo
3bobo3bo9bo4bobbo31boobo68bobo3bobobob4o$1091bobobobo3bo14bo35boo67b4o
5bobo4bobbo$1092b3o4bobo14bo104b3o15bo6booboo$1093bo23bobo111bo12boobo
booboo$1231bo9b3obobb3obb4o$1218boo17b3o4b3o5bo4bo$1083b3obo108boob3o
15bobbo15bobobob3obo8boo$1084bobbo108boo4boo13bobo16bobobob4o$1082bobb
o109bobbobo3bo13bo10boo6bobo4bobbo$1083boo117b3obb3o18boobo14bo$1091b
oo111b3obobo16bo3bo6bo12boobo$1086b3obobo111bo4bo16b6o6bo9boobooboo$
1065boo19b3obbo9bo103boo19bo21bobbobobbo$1065boo33b4o121b3o14boo4boo5b
o$1095bo3bo3booboo8b3o107boo3bo10booboo$1094b4o5bobboo7bobbo108bobo11b
o3boo$1093bo3bo7bobbo9bo101boo7boobo12boo$1065boo17b3o7bobobbo18bo101b
oo9bo$1064boo4bo12bo3boobo7bo16bobo$1063boo3boo8b3obb3o3b3o$1064boo3b
oo6bobob3o4bo3bo52bo$1065bo4bo4b4o4bo7bo51boo$1074b3o4boo61boo80boo$
1075boo130b3o18b3o$1203boboo3bo16bobboo$1202b3o3bobo16b5o$1201bo3bo4b
oo15b3obo$1202bo7b3o$1208bobo$1116b3o88boo14b3o$1116bobbo86bo3bo11boo
bboo$1116bo93bo9b3ob3o$1116bo90boboo9boo3bo$1117bobo82bo4bo$1201bobo3b
3o$1200bo3bo35boobo$1201boobo3bo28boobooboo$1206boo29bobbobobbo$1231b
oo4boo5bo$1206bobbo21booboo$1206bobo21bo3boo$1234boo3$1116b3o90bo$
1115bobbo88boo13boo$1118bo14bo73b3o3b3o5bobbo$1118bo13bo74boo3b3o5b6o$
1115bobo14b3o77boo7bobbo$1196boo24boo4bo$1196bobo28bobo$1043boboo149bo
31b3obo$1042boobooboo179b3o$1041bobbobobbo14boo119boo43boo$1042bo5boo
4boo8boo118boo$1051booboo130bo$1051boo3bo13boo$1051boo16bobo101b3o$
1043bo27bo101bo$1039b3ob3o70b3o55bo$1038bo6boo69bobbo43bo$1039boo3bobb
o3bo64bo45boo$1049b4o63bo45bobo$1049bo3bo63bobo$1047bobbobo39b3o56boo$
1048bo45bo56bobo$1093bo57bo$$1140boo$1139boo$1141bo$1053bo22bo38boo$
1049b3ob3o18b3ob3o33bobo11b3o$1048bo6boo16boo6bo34bo4bobo4bo$1049boo3b
obbo3bo6bo3bobbo3boo40boo6bo$1059b4o4b4o47bo3bo$1059bo3bobbo3bo46boo$
1057bobbobo4bobobbo36bo7bobo$1058bo12bo35b4o$1103booboo3bo$1103boobbo
3bo$1102bobbo7bo$1113bo$1108boobo$1108boo$1108bobo$1111boo$1109b3o$
1103bo3boobbo$1102b3o3boo$1101bo3bobbobo$1102bobobobo$1108bo$1107boo$
1108bo$1108bo!
10200 screen 5,2
10210 for i=0 to 42:sp$=""
	10220 for j=0 to 31
		10230 read a$
		10240 sp$=sp$+chr$(val(a$))
	10250 next J
	10260 sprite$(i)=sp$
10270 next i
10280 for i=0 to 42:sp$=""
	10290 for j=0 to 15
		10300 read a$
		10310 sp$=sp$+chr$(val(a$))
	10320 next J
	10330 color sprite$(i)=sp$
10340 next I
10350 rem sprites data definitions
10360 rem data definition sprite 0, name: Sprite-2
10370 data 32,48,56,127,127,63,126,63
10380 data 127,127,127,56,48,48,32,0
10390 data 0,0,0,224,240,224,0,0
10400 data 240,248,240,0,0,0,0,0
10410 rem data definition sprite 1, name: Sprite-2
10420 data 32,48,127,31,127,56,127,39
10430 data 127,48,56,60,127,31,127,32
10440 data 0,0,240,248,240,0,248,252
10450 data 248,0,0,0,240,248,240,0
10460 rem data definition sprite 2, name: Sprite-16
10470 data 0,0,3,15,31,63,127,255
10480 data 127,63,15,15,0,0,0,0
10490 data 0,0,248,252,252,248,248,192
10500 data 248,252,252,248,0,0,0,0
10510 rem data definition sprite 3, name: Sprite-16
10520 data 3,31,59,115,96,192,255,255
10530 data 255,192,96,48,27,15,3,3
10540 data 248,252,252,248,0,0,0,192
10550 data 0,0,0,0,248,252,252,248
10560 rem data definition sprite 4, name: Sprite-8
10570 data 0,0,0,15,159,207,255,255
10580 data 255,238,207,159,15,0,0,0
10590 data 0,0,0,248,252,254,248,240
10600 data 224,0,252,254,252,0,0,0
10610 rem data definition sprite 5, name: Sprite-8
10620 data 3,7,3,31,159,206,255,255
10630 data 255,206,159,31,31,3,7,3
10640 data 252,254,252,224,128,0,224,240
10650 data 224,0,128,224,128,252,254,252
10660 rem data definition sprite 6, name: No_name9
10670 data 0,0,0,240,248,254,127,127
10680 data 127,127,254,248,240,0,0,0
10690 data 0,0,0,0,0,0,0,252
10700 data 252,0,0,0,0,0,0,0
10710 rem data definition sprite 7, name: No_name9
10720 data 96,112,120,252,255,255,127,127
10730 data 127,127,255,255,252,120,112,96
10740 data 0,0,0,0,0,128,224,252
10750 data 252,224,128,0,0,0,0,0
10760 rem data definition sprite 8, name: Sprite-6
10770 data 0,0,85,106,117,0,117,106
10780 data 85,0,91,109,118,0,0,0
10790 data 0,0,86,171,86,0,86,171
10800 data 86,0,110,183,218,0,0,0
10810 rem data definition sprite 9, name: Sprite-6
10820 data 117,106,85,0,85,106,117,0
10830 data 117,106,85,0,91,109,118,0
10840 data 86,171,86,0,86,171,86,0
10850 data 86,171,86,0,110,183,218,0
10860 rem data definition sprite 10, name: Sprite-30
10870 data 0,0,0,0,0,1,1,6
10880 data 6,1,1,0,0,0,0,0
10890 data 0,0,0,0,0,128,128,96
10900 data 96,128,128,0,0,0,0,0
10910 rem data definition sprite 11, name: Sprite-30
10920 data 0,0,0,0,0,1,3,7
10930 data 7,3,1,0,0,0,0,0
10940 data 0,0,0,0,0,128,192,224
10950 data 224,192,128,0,0,0,0,0
10960 rem data definition sprite 12, name: Sprite-30
10970 data 0,0,0,0,0,1,2,5
10980 data 5,2,1,0,0,0,0,0
10990 data 0,0,0,0,0,128,64,160
11000 data 160,64,128,0,0,0,0,0
11010 rem data definition sprite 13, name: Sprite-30
11020 data 0,0,0,0,0,0,0,7
11030 data 7,0,0,0,0,0,0,0
11040 data 0,0,0,0,0,0,0,224
11050 data 224,0,0,0,0,0,0,0
11060 rem data definition sprite 14, name: Sprite-26
11070 data 128,64,32,50,31,15,15,63
11080 data 31,31,47,15,16,32,0,0
11090 data 0,0,0,144,40,208,224,224
11100 data 248,224,240,248,176,24,8,4
11110 rem data definition sprite 15, name: Sprite-26
11120 data 0,0,0,0,1,4,1,31
11130 data 7,3,5,1,0,0,0,0
11140 data 0,0,0,0,32,192,224,248
11150 data 224,192,160,0,0,0,0,0
11160 rem data definition sprite 16, name: Sprite-26
11170 data 0,0,0,0,0,0,1,0
11180 data 0,2,0,0,0,0,0,0
11190 data 0,0,0,0,0,0,32,0
11200 data 128,0,32,0,0,0,0,0
11210 rem data definition sprite 17, name: Sprite-26
11220 data 0,0,0,0,0,0,0,0
11230 data 0,0,0,0,0,0,0,0
11240 data 0,0,0,0,0,0,0,0
11250 data 0,0,0,0,0,0,0,0
11260 rem data definition sprite 18, name: Sprite-7
11270 data 0,0,0,0,0,0,0,1
11280 data 1,1,3,63,63,63,60,60
11290 data 0,0,0,0,0,0,0,128
11300 data 128,128,192,252,252,252,60,60
11310 rem data definition sprite 19, name: Sprite-14
11320 data 32,248,112,112,112,112,113,115
11330 data 114,115,115,251,255,255,240,96
11340 data 4,31,14,14,14,14,206,110
11350 data 46,110,110,111,255,255,15,6
11360 rem data definition sprite 20, name: Sprite-22
11370 data 1,1,2,2,2,2,3,3
11380 data 3,3,9,9,15,1,3,2
11390 data 128,128,64,64,64,64,192,192
11400 data 192,192,144,144,240,128,192,64
11410 rem data definition sprite 21, name: Sprite-23
11420 data 0,0,12,12,12,12,12,12
11430 data 30,63,30,255,255,187,40,16
11440 data 0,0,0,0,0,0,0,0
11450 data 112,104,102,255,254,212,40,16
11460 rem data definition sprite 22, name: Sprite-24
11470 data 0,8,28,12,2,1,0,0
11480 data 0,7,15,127,187,17,187,85
11490 data 0,0,0,0,0,0,128,112
11500 data 80,240,248,254,186,17,186,84
11510 rem data definition sprite 23, name: Sprite-25
11520 data 0,0,0,0,0,0,8,28
11530 data 14,7,3,31,15,16,41,16
11540 data 0,0,0,0,0,0,0,0
11550 data 0,12,236,132,28,132,74,138
11560 rem data definition sprite 24, name: Sprite-34
11570 data 53,58,53,58,53,63,63,63
11580 data 3,6,6,3,1,1,1,0
11590 data 92,172,92,172,92,252,252,252
11600 data 192,96,96,192,128,128,128,0
11610 rem data definition sprite 25, name: Sprite-35
11620 data 25,114,102,198,204,204,204,252
11630 data 252,31,7,3,6,12,6,0
11640 data 140,70,102,99,51,51,51,63
11650 data 63,240,192,128,192,96,192,0
11660 rem data definition sprite 26, name: Sprite-37
11670 data 1,1,1,1,1,131,143,248
11680 data 251,8,15,1,1,1,1,0
11690 data 128,128,128,128,128,193,241,31
11700 data 223,16,240,128,128,128,128,0
11710 rem data definition sprite 27, name: Sprite-36
11720 data 3,7,13,30,30,13,7,3
11730 data 3,7,13,30,30,13,7,3
11740 data 192,224,176,120,120,176,224,192
11750 data 192,224,176,120,120,176,224,192
11760 rem data definition sprite 28, name: Sprite-38
11770 data 1,0,0,1,3,3,1,0
11780 data 0,1,3,3,1,7,5,7
11790 data 128,192,192,128,0,0,128,192
11800 data 192,128,0,0,128,224,160,224
11810 rem data definition sprite 29, name: Sprite-39
11820 data 6,7,7,6,7,7,51,49
11830 data 55,62,54,55,49,3,2,0
11840 data 48,112,112,48,240,240,230,70
11850 data 246,190,54,246,198,224,32,0
11860 rem data definition sprite 30, name: Sprite-8
11870 data 0,0,1,7,1,0,0,0
11880 data 0,0,1,7,1,0,0,0
11890 data 0,0,224,248,252,62,31,15
11900 data 31,63,254,252,224,0,0,0
11910 rem data definition sprite 31, name: No_name9
11920 data 0,0,0,0,1,3,127,3
11930 data 3,127,3,1,0,0,0,0
11940 data 0,28,52,116,244,246,252,248
11950 data 248,252,246,244,116,52,28,0
11960 rem data definition sprite 32, name: Sprite_name10
11970 data 0,0,0,0,1,2,123,187
11980 data 187,123,2,1,0,0,0,0
11990 data 30,32,94,190,126,248,255,255
12000 data 255,255,248,126,190,94,32,30
12010 rem data definition sprite 33, name: Sprite-11
12020 data 0,0,0,0,6,4,30,47
12030 data 47,30,4,6,0,0,0,0
12040 data 30,62,127,255,224,254,254,254
12050 data 254,254,224,255,255,126,62,30
12060 rem data definition sprite 34, name: Sprite-12
12070 data 0,15,23,15,0,1,126,191
12080 data 191,126,1,0,15,23,15,0
12090 data 4,255,252,255,228,128,240,64
12100 data 64,240,128,228,255,252,255,4
12110 rem data definition sprite 35, name: Sprite-13
12120 data 15,15,1,1,1,1,1,125
12130 data 253,125,1,1,1,1,15,15
12140 data 224,224,128,192,224,240,248,87
12150 data 87,248,240,224,192,128,224,224
12160 rem data definition sprite 36, name: Sprite-14
12170 data 0,0,0,63,255,0,0,7
12180 data 15,7,1,0,255,63,0,0
12190 data 4,14,63,254,255,30,238,132
12200 data 128,132,238,31,254,254,15,4
12210 rem data definition sprite 37, name: Sprite-15
12220 data 0,0,0,1,3,31,241,44
12230 data 44,241,31,15,7,3,0,0
12240 data 6,102,226,238,240,192,220,28
12250 data 28,220,192,240,238,226,230,102
12260 rem data definition sprite 38, name: Sprite-16
12270 data 31,63,31,0,31,7,0,3
12280 data 0,7,31,0,31,63,31,0
12290 data 192,240,216,12,230,243,255,255
12300 data 255,243,230,12,216,240,192,0
12310 rem data definition sprite 39, name: Sprite-17
12320 data 0,0,0,0,0,0,31,243
12330 data 31,0,0,0,0,0,0,0
12340 data 224,240,248,252,255,255,255,252
12350 data 252,255,255,252,248,240,224,192
12360 rem data definition sprite 40, name: Sprite-26
12370 data 255,255,255,255,255,255,255,255
12380 data 255,255,255,255,255,255,255,255
12390 data 255,255,255,255,255,255,255,255
12400 data 255,255,255,255,255,255,255,255
12410 rem data definition sprite 41, name: Sprite-6
12420 data 0,0,0,0,0,0,0,109
12430 data 118,123,0,0,0,0,0,0
12440 data 0,0,0,0,0,0,0,182
12450 data 219,110,0,0,0,0,0,0
12460 rem data definition sprite 42, name: Sprite-6
12470 data 0,0,0,0,117,106,85,0
12480 data 0,109,118,123,0,0,0,0
12490 data 0,0,0,0,86,171,86,0
12500 data 0,182,219,110,0,0,0,0
12510 rem data colors definitions sprite 0, name: Sprite-2
12510 data 9,9,9,9,4,9,5,4,5,4,9,9,9,9,9,9
12520 rem data colors definitions sprite 1, name: Sprite-2
12520 data 9,9,9,4,9,9,5,4,5,9,9,9,9,4,9,9
12530 rem data colors definitions sprite 2, name: Sprite-16
12530 data 0,0,12,12,12,12,3,13,2,12,12,12,12,12,12,12
12540 rem data colors definitions sprite 3, name: Sprite-16
12540 data 12,12,12,12,2,2,3,13,3,3,2,2,12,12,12,12
12550 rem data colors definitions sprite 4, name: Sprite-8
12550 data 0,0,0,8,8,8,5,8,5,5,8,8,8,8,8,8
12560 rem data colors definitions sprite 5, name: Sprite-8
12560 data 8,8,8,5,5,5,5,8,5,5,5,5,5,8,8,8
12570 rem data colors definitions sprite 6, name: No_name9
12570 data 0,0,0,7,7,7,7,5,5,7,7,7,7,7,7,7
12580 rem data colors definitions sprite 7, name: No_name9
12580 data 7,7,7,7,7,7,4,5,5,4,7,7,7,7,7,7
12590 rem data colors definitions sprite 8, name: Sprite-6
12590 data 0,0,7,7,7,7,7,7,7,7,7,7,7,7,7,7
12600 rem data colors definitions sprite 9, name: Sprite-6
12600 data 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7
12610 rem data colors definitions sprite 10, name: Sprite-30
12610 data 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
12620 rem data colors definitions sprite 11, name: Sprite-30
12620 data 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
12630 rem data colors definitions sprite 12, name: Sprite-30
12630 data 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
12640 rem data colors definitions sprite 13, name: Sprite-30
12640 data 0,0,0,0,0,0,0,10,10,10,10,10,10,10,10,10
12650 rem data colors definitions sprite 14, name: Sprite-26
12650 data 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10
12660 rem data colors definitions sprite 15, name: Sprite-26
12660 data 0,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10
12670 rem data colors definitions sprite 16, name: Sprite-26
12670 data 0,0,0,0,0,0,10,10,10,10,10,10,10,10,10,10
12680 rem data colors definitions sprite 17, name: Sprite-26
12680 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12690 rem data colors definitions sprite 18, name: Sprite-7
12690 data 0,0,0,0,0,0,0,8,5,5,5,5,5,5,9,9
12700 rem data colors definitions sprite 19, name: Sprite-14
12700 data 8,8,4,4,4,4,4,4,4,4,4,9,9,9,9,8
12710 rem data colors definitions sprite 20, name: Sprite-22
12710 data 13,13,4,4,4,4,4,4,4,4,2,2,2,2,6,8
12720 rem data colors definitions sprite 21, name: Sprite-23
12720 data 0,0,14,14,14,14,14,14,4,4,4,6,6,6,6,6
12730 rem data colors definitions sprite 22, name: Sprite-24
12730 data 0,12,12,12,12,12,12,6,6,6,6,6,12,12,12,12
12740 rem data colors definitions sprite 23, name: Sprite-25
12740 data 0,0,0,0,0,0,14,14,14,14,14,12,12,12,12,12
12750 rem data colors definitions sprite 24, name: Sprite-34
12750 data 6,6,6,6,6,6,6,6,4,4,4,4,4,4,4,4
12760 rem data colors definitions sprite 25, name: Sprite-35
12760 data 9,9,9,9,9,10,10,10,10,10,10,10,8,8,8,8
12770 rem data colors definitions sprite 26, name: Sprite-37
12770 data 13,13,13,13,13,13,13,13,13,13,13,6,6,6,10,10
12780 rem data colors definitions sprite 27, name: Sprite-36
12780 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
12790 rem data colors definitions sprite 28, name: Sprite-38
12790 data 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
12800 rem data colors definitions sprite 29, name: Sprite-39
12800 data 6,6,6,6,6,6,8,8,8,13,13,13,13,13,13,13
12810 rem data colors definitions sprite 30, name: Sprite-8
12810 data 0,0,9,8,9,9,9,7,9,9,9,8,9,9,9,9
12820 rem data colors definitions sprite 31, name: No_name9
12820 data 0,13,13,13,13,13,10,5,5,10,13,13,13,13,13,13
12830 rem data colors definitions sprite 32, name: Sprite_name10
12830 data 6,6,6,6,6,6,8,7,7,8,6,6,6,6,6,6
12840 rem data colors definitions sprite 33, name: Sprite-11
12840 data 5,5,5,5,5,5,5,13,13,5,5,5,5,5,5,5
12850 rem data colors definitions sprite 34, name: Sprite-12
12850 data 13,13,13,13,13,2,12,12,12,12,2,13,13,13,13,13
12860 rem data colors definitions sprite 35, name: Sprite-13
12860 data 9,9,10,10,10,10,10,9,9,9,10,10,10,10,9,9
12870 rem data colors definitions sprite 36, name: Sprite-14
12870 data 4,4,4,8,8,4,4,5,5,5,4,4,8,8,4,4
12880 rem data colors definitions sprite 37, name: Sprite-15
12880 data 13,13,13,13,8,8,9,9,9,8,8,8,13,13,13,13
12890 rem data colors definitions sprite 38, name: Sprite-16
12890 data 8,8,8,9,7,7,4,4,4,7,7,9,8,8,8,8
12900 rem data colors definitions sprite 39, name: Sprite-17
12900 data 12,12,12,12,12,12,6,8,6,12,12,12,12,12,12,12
12910 rem data colors definitions sprite 40, name: Sprite-26
12910 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
12920 rem data colors definitions sprite 41, name: Sprite-6
12920 data 0,0,0,0,0,0,0,7,7,7,7,7,7,7,7,7
12930 rem data colors definitions sprite 42, name: Sprite-6
12930 data 0,0,0,0,7,7,7,7,7,7,7,7,7,7,7,7
12940 rem data atrubutes sprite 0, name: Sprite-2
12950 put sprite 0,(1,0),,0
12960 rem data atrubutes sprite 1, name: Sprite-2
12970 put sprite 1,(34,0),,1
12980 rem data atrubutes sprite 2, name: Sprite-16
12990 put sprite 2,(67,0),,2
13000 rem data atrubutes sprite 3, name: Sprite-16
13010 put sprite 3,(100,0),,3
13020 rem data atrubutes sprite 4, name: Sprite-8
13030 put sprite 4,(133,0),,4
13040 rem data atrubutes sprite 5, name: Sprite-8
13050 put sprite 5,(166,0),,5
13060 rem data atrubutes sprite 6, name: No_name9
13070 put sprite 6,(199,0),,6
13080 rem data atrubutes sprite 7, name: No_name9
13090 put sprite 7,(0,33),,7
13100 rem data atrubutes sprite 8, name: Sprite-6
13110 put sprite 8,(33,33),,8
13120 rem data atrubutes sprite 9, name: Sprite-6
13130 put sprite 9,(66,33),,9
13140 rem data atrubutes sprite 10, name: Sprite-30
13150 put sprite 10,(99,33),,10
13160 rem data atrubutes sprite 11, name: Sprite-30
13170 put sprite 11,(132,33),,11
13180 rem data atrubutes sprite 12, name: Sprite-30
13190 put sprite 12,(165,33),,12
13200 rem data atrubutes sprite 13, name: Sprite-30
13210 put sprite 13,(198,33),,13
13220 rem data atrubutes sprite 14, name: Sprite-26
13230 put sprite 14,(0,66),,14
13240 rem data atrubutes sprite 15, name: Sprite-26
13250 put sprite 15,(33,66),,15
13260 rem data atrubutes sprite 16, name: Sprite-26
13270 put sprite 16,(66,66),,16
13280 rem data atrubutes sprite 17, name: Sprite-26
13290 put sprite 17,(99,66),,17
13300 rem data atrubutes sprite 18, name: Sprite-7
13310 put sprite 18,(132,66),,18
13320 rem data atrubutes sprite 19, name: Sprite-14
13330 put sprite 19,(165,66),,19
13340 rem data atrubutes sprite 20, name: Sprite-22
13350 put sprite 20,(198,66),,20
13360 rem data atrubutes sprite 21, name: Sprite-23
13370 put sprite 21,(0,99),,21
13380 rem data atrubutes sprite 22, name: Sprite-24
13390 put sprite 22,(33,99),,22
13400 rem data atrubutes sprite 23, name: Sprite-25
13410 put sprite 23,(66,99),,23
13420 rem data atrubutes sprite 24, name: Sprite-34
13430 put sprite 24,(99,99),,24
13440 rem data atrubutes sprite 25, name: Sprite-35
13450 put sprite 25,(132,99),,25
13460 rem data atrubutes sprite 26, name: Sprite-37
13470 put sprite 26,(165,99),,26
13480 rem data atrubutes sprite 27, name: Sprite-36
13490 put sprite 27,(198,99),,27
13500 rem data atrubutes sprite 28, name: Sprite-38
13510 put sprite 28,(0,132),,28
13520 rem data atrubutes sprite 29, name: Sprite-39
13530 put sprite 29,(33,132),,29
13540 rem data atrubutes sprite 30, name: Sprite-8
13550 put sprite 30,(66,132),,30
13560 rem data atrubutes sprite 31, name: No_name9
13570 put sprite 31,(99,132),,31
13580 rem data atrubutes sprite 32, name: Sprite_name10
13590 put sprite 32,(132,132),,32
13600 rem data atrubutes sprite 33, name: Sprite-11
13610 put sprite 33,(165,132),,33
13620 rem data atrubutes sprite 34, name: Sprite-12
13630 put sprite 34,(198,132),,34
13640 rem data atrubutes sprite 35, name: Sprite-13
13650 put sprite 35,(0,165),,35
13660 rem data atrubutes sprite 36, name: Sprite-14
13670 put sprite 36,(33,165),,36
13680 rem data atrubutes sprite 37, name: Sprite-15
13690 put sprite 37,(66,165),,37
13700 rem data atrubutes sprite 38, name: Sprite-16
13710 put sprite 38,(99,165),,38
13720 rem data atrubutes sprite 39, name: Sprite-17
13730 put sprite 39,(132,165),,39
13740 rem data atrubutes sprite 40, name: Sprite-26
13750 put sprite 40,(165,165),,40
13760 rem data atrubutes sprite 41, name: Sprite-6
13770 put sprite 41,(198,165),,41
13780 rem data atrubutes sprite 42, name: Sprite-6
13790 put sprite 42,(0,198),,42
13800 goto 13800

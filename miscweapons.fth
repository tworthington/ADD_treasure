%table: III.H
01	i: 2d12 .. ." x Arrow, +1" ;i
09	i: 2d8 .. ." x Arrow, +2" ;i
13	i: 2d6 .. ." x Arrow, +3" ;i

	dtable: arrowofslaying
1	i: ." Arachnids" ;i
2	i: ." Avians" ;i
3	i: ." Bards" ;i
4	i: ." Clerics" ;i
5	i: ." Demons" ;i
6	i: ." Devils" ;i
7	i: ." Dragons" ;i
8	i: ." Druids" ;i
9	i: ." Elementals" ;i
10	i: ." Fighters" ;i
11	i: ." Giants" ;i
12	i: ." Golems" ;i
13	i: ." Illusionists" ;i
14	i: ." Ki-rin" ;i
15	i: ." Magic-users" ;i
16	i: ." Mammals" ;i
17	i: ." Monks" ;i
18	i: ." Paladins" ;i
19	i: ." Rangers" ;i
20	i: ." Reptiles" ;i
21	i: ." Sea Monsters" ;i
22	i: ." Thieves" ;i
23	i: ." Titans" ;i
24	i: ." Undead" ;i
;table
15	i: ." Arrow of Slaying " 24 d arrowofslaying ;i
16	i: ." Axe +1" ;i
21	i: ." Axe +2" ;i
23	i: ." Axe +2, Throwing" ;i
24	i: ." Axe +3" ;i
25	i: ." Battle Axe +1" ;i
28	i: 2d10 .. ." x Bolt +2" ;i
33	i: ." Bow +1" ;i

: heavy? d10 1 = if ." Heavy " then ;
36	i: heavy? ." Crossbow of Accuracy, +3" ;i
37	i: heavy? ." Crossbow of Distance" ;i
38	i: heavy? ." Crossbow of Speed" ;i
39	i: ." Dagger +1, +2 vs. creatures smaller than man-sized" ;i
47	i: ." Dagger +2, +3 vs. creatures larger than man-sized" ;i
51	i: ." Dagger of Venom" ;i
52	i: ." Flail +1" ;i
57	i: ." Hammer +1" ;i
61	i: ." Hammer +2" ;i
63	i: ." Hammer +3, Dwarven Thrower" ;i
64	i: ." Hammer of Thunderbolts" ;i
65	i: ." Javelin +2" ;i
68	i: ." Mace +1" ;i
73	i: ." Mace +2" ;i
76	i: ." Mace of Disruption" ;i
77	i: ." Mace +4" ;i
78	i: ." Military Pick +1" ;i
81	i: ." Morning Star +1" ;i

	%table: magicscimitar
	1	i: ." , +2" ;i
	96	i: ."  of wounding" ;i
	99	i: ."  of sharpness" ;i
	;table
: khopesh? ." Scimitar" d10 1 = if ."  (khopesh)" then ;
84	i:  khopesh? magicscimitar ;i
89	i: ." Sling of Seeking +2" ;i
90	i: ." Spear +1" ;i
95	i: ." Spear +2" ;i
97	i: ." Spear +3" ;i
98	i: ." Spear, Cursed Backbiter" ;i
100	i: ." Trident (Military Fork) +3" ;i
;table

%table: III.H.2
01	i: 2d4 .. ." x Arrow, +4, 2-8" ;i
03	i: ." Axe, +4" ;i

	dtable: axeofhurling
	1	i: 1 ;i
	6	i: 2 ;i
	11	i: 3 ;i
	16	i: 4 ;i
	20	i: 5 ;i
	;table
04	i: ." Axe of Hurling, +" d20 axeofhurling .. ;i
05	i: ." Battle Axe, +2" ;i
11	i: ." Battle Axe, +3" ;i
14	i: 6d6 .. ." x Bolt, +1" ;i
21	i: 3d4 .. ." x Bolt, +3" ;i
23	i: 5d4 .. ." x Bullet, Sling, +1" ;i
28	i: 3d4 .. ." x Bullet, Sling, +2" ;i
32	i: 2d4 .. ." x Bullet, Sling, +3" ;i
35	i: d4 .. ." x Bullet, Sling, of Impact" ;i
36	i: ." Dagger, +1" ;i
41	i: ." Dagger, +2" ;i
44	i: ." Dagger, +2, Longtooth" ;i
45	i: ." Dagger, +3" ;i
	%table: daggerofthrowing
	1	i: 1 ;i
	36	i: 2 ;i
	66	i: 3 ;i
	91	i: 4 ;i
	;table
47	i: ." Dagger of Throwing, +" daggerofthrowing . ;i
48	i: ." Dart, +1" ;i
52	i: ." Dart, +2" ;i
55	i: ." Dart, +3" ;i
57	i: d2 .. ." x Dart of Homing" ;i
58	i: ." Flail, +2" ;i
62	i: ." Hammer, +4" ;i
	%table: hornblade
	1	i: ." knife-sized, +1" ;i
	21	i: ." knife-sized, +2" ;i
	36	i: ." dagger-sized, +1" ;i
	51	i: ." dagger-sized, +2" ;i
	71	i: ." scimitar-sized, +2" ;i
	91	i: ." scimitar-sized, +3" ;i
	;table
63	i: ." Hornblade, " hornblade ;i
64	i: ." Javelin, +1" ;i
69	i: ." Javelin, +3" ;i
71	i: ." Knife, +1" ;i
76	i: ." Knife, +2" ;i
	dtable: knifebuckle
	1	i: 1 ;i
	5	i: 2 ;i
	8	i: 3 ;i
	10	i: 4 ;i
	;table
79	i: ." Knife, Buckle, +" d10 knifebuckle . ;i
80	i: ." Lance, +1" ;i
82	i: ." Mace, +3" ;i
84	i: ." Morning Star, +2" ;i
	dtable: polearms
	0: 	." Bardiche" ;i
	0:	." Bec de Corbin" ;i
	0:	." Bill-Guisarme" ;i
	0:	." Fauchard" ;i
	0:	." Fauchard-Fork" ;i
	0:	." Glave" ;i
	0:	." Glave-Guisarme" ;i
	0:	." Guisarme-Voulge" ;i
	0:	." Halberd" ;i
	0:	." Hammer, Lucern" ;i
	0:	." Hook, Fauchard" ;i
	0:	." Military Fork" ;i
	0:	." Partisan" ;i
	0:	." Pike" ;i
	0:	." Ranseur" ;i
	0:	." Spetum" ;i
	0:	." Voulge" ;i
	;table

87	i: ." Pole Arm (" pick1 polearms ." ), +1" ;i
	dtable: magicstaff
	1	i: 1 ;i
	6	i: 2 ;i
	10	i: 3 ;i
	14	i: 4 ;i
	18	i: 5 ;i
	;table
88	i: ." Quarterstaff, Magic, +" d20 magicstaff . ;i
90	i: khopesh? ." , +1" ;i
93	i: khopesh? ." , +3" ;i
95	i: khopesh? ." of Speed" ;i
96	i: khopesh? ." , +4" ;i
97	i: ." Spear, +4" ;i
100	i: ." Spear, +5" ;i
;table

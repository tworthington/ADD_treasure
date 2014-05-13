requires MODULES
requires ERRORS

module: MAGIC

private:

digression cleric1 "spelllists.fth"

public:

26 array magictreasure
26 cells allot

: clearmagic
  26 times
     0 i magictreasure !
  iterate
;

: %table: ( <name> -- baseaddr prevdummt)
  [ ' < ] literal
  create here 0 , swap , 0
does> ( addr )
  d100 swap (prep-tab) (table)
;

\ force a number into a %table instead of letting it roll
: %debug: ( n ) ' >pf @ (prep-tab) (table) ;

: override: ( n )
  ' >pf @  lit
  postpone (prep-tab)
  postpone (table)
; immediate

digression languagetab 'languages.fth'

private:

: pot ." Potion of " ;
: sprot ." Scroll of protection from " ;

public:

digression III.A "potiontables.fth"

%table: potions
1	i: III.A ;i
66	i: III.A.2 ;i
;table

digression III.B 'scrolls.fth'

%table: scrolls
1	i: III.B ;i
86	i: sprot III.B.2 ;i
;table

digression III.C 'rings.fth'

%table: rings
1	i: ." Ring of " III.C ;i
68	i: ." Ring of " III.C.2 ;i
;table

digression III.D 'rods.fth'

%table: rod/staff/wand
1	i: III.D ;i
41	i: ." Wand of " III.D.2 wandcharges ;i
;table

digression III.E.1 'miscmagic.fth'

%table: misc.magic
1	i: III.E.1 ;i
15	i: III.E.2 ;i
29	i: III.E.3 ;i
43	i: III.E.4 ;i
57	i: III.E.5 ;i
71	i: III.E.6 ;i
86	i: III.E.7 ;i
;table

digression III.F 'armour_shield.fth'

%table: armour/shield
1      i: III.F ;i
51     i: III.F.2 ;i
;table

digression III.G 'swords.fth'

%table: swordstab
1	i: III.G ;i
96	i: III.G.2 ;i
;table

: swords
  0 swordego !
  0 swordlanguages !
  -1 legalalign !
  -primaries
  -extras
  swordstab
;

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
28	i: 2d10 ." x Bolt +2" ;i
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
14	i: 6d6 .. ." x Bolt, +1, 6-36" ;i
21	i: 3d4 .. ." x Bolt, +3, 3-12 in number" ;i
23	i: 5d4 .. ." x Bullet, Sling,, +1" ;i
28	i: 3d4 .. ." x Bullet, Sling,, +2" ;i
32	i: 2d4 .. ." x Bullet, Sling,, +3" ;i
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
48	i: ." Dart, +1, 3-12 in number" ;i
52	i: ." Dart, +2, 2-8 in number" ;i
55	i: ." Dart, +3, 1-4 in number" ;i
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

%table: misc.weapons
1	i: III.H ;i
51	i: III.H.2 ;i
;table

private:

defer map-details

dtable: III.magic
1	i: potions cr ;i
21	i: scrolls cr ;i
36	i: rings cr ;i
41	i: rod/staff/wand cr ;i
46	i: misc.magic cr ;i
61	i: armour/shield cr ;i
76	i: swords cr ;i
87	i: misc.weapons cr ;i
;table

\ GEMS

dtable: magicmaptreasure
1 	i: d100 III.magic ." plus 4 potions" ;i
6	i: d100 III.magic ., d100 III.magic ;i
9	i: ." 1 sword, 1 armour/shield, 1 misc. weapon" ;i
13	i: ." Any 3 items except swords and potions" ;i
15	i: ." 6 potions, 6 rings" ;i
19	i: ." 1 ring, 1 rod, any 2 others" ;i
20	i: ." 1 rod, 1 misc magic, any 3 others" ;i
;table

dtable: moneytreasure
1  i: 2d4 1000s ..  ." cp, "
      d4 1+ 10 * 1000s .. ." sp" ;i
3  i: 5d6 1000s ..  ." ep" ;i
6  i: 3d6 1000s ..  ." gp" ;i
11 i: 5d4 100 * ..  ." pp" ;i
13 i: d10 10 * dup .. ."  gems:" cr .gems ;i
16 i: 5 10 roll  dup .. ."  jewels:" cr .jewels ;i
18 i: 17 d  moneytreasure .,  17 d  moneytreasure ., ;i
19 i: 17 d  moneytreasure .,  17 d  moneytreasure ., 17 d  moneytreasure ;i
20 i: 1 moneytreasure .,
      3 moneytreasure .,
      6 moneytreasure .,
      11 moneytreasure .,
      13 moneytreasure .,
      16 moneytreasure  ;i

;table

%table: combinedhoard
1      i: 1 moneytreasure 1 ., magicmaptreasure ;i
21     i: 6 moneytreasure 1 ., magicmaptreasure ;i
41     i: 3 moneytreasure 6 ., moneytreasure .,
       	  1 magicmaptreasure ., 15 magicmaptreasure ;i
56     i: 1 moneytreasure ., 3 moneytreasure ., 6 moneytreasure .,
       	  9 magicmaptreasure ., 13 magicmaptreasure ;i
66     i: 6 moneytreasure ., 10 moneytreasure .,
       	  6 magicmaptreasure ., 15 magicmaptreasure ;i
76     i: 3 moneytreasure ., 6 moneytreasure ., 11 moneytreasure ., 16 moneytreasure .,
       	  1 magicmaptreasure ., 9 magicmaptreasure ;i
81     i: 20 moneytreasure ." ."
          ."  Map to magic treasure: " 1 magicmaptreasure map-details ;i

86     i: 20 moneytreasure ." ."
          ."  Map to magic treasure: " 19 magicmaptreasure map-details ;i

91     i: 1 moneytreasure ., 3 moneytreasure .,
          ." nearby: " 20 magicmaptreasure ;i

97     i: 11 moneytreasure ., 13 moneytreasure .,
          ." nearby: " 15 magicmaptreasure ., 20 magicmaptreasure ;i
;table


%table: II.map
	1   i: ." False map to area"  ;i
	6   i: ." Map to monetary treasure: "
	       d20 moneytreasure ;i
	71  i: ." Map to magic treasure: "
	       d20 magicmaptreasure ;i
	91  i: ." Map to combined hoard: " combinedhoard ;i
;table

%table: distance
1      i: ."  located in labyrinth of caves found in/near lair, " ;i
21     i: ."  located outdoors, "
       	  d4 4 + . ." miles distant, " ;i
61     i: ."  located outdoors, "
       	  d4 10 * . ." miles distant, " ;i
91     i: ."  located outdoors, "
       	  5 10 roll 10 * . ." miles distant, " ;i
;table

%table: location
       1      i: ." burried and unguarded" ;i
       11     i: ." hidden in water" ;i
       21     i: ." in a lair with guard" ;i
       71     i: ." somewhere in a ruin" ;i
       81     i: ." in a burial crypt" ;i
       91     i: ." secreted in a town" ;i
;table

: (map-details)
  distance
  location
;

: just-map
  II.map
  map-details
;

' map-details is (map-details)

%table: I.map/magic
1 i: just-map  ;i
11 i: d100 III.magic  ;i

;table

%table: limitedmap/magic ( n )
1	i: drop just-map ;i
11	i: III.magic ;i
;table

36 base !

lookup: magictype
A i:  3 times I.map/magic ?.; iterate ;i

B i: [ base @ decimal ] 40 d 60 + [ base ! ] limitedmap/magic ;i

C i: I.map/magic ., I.map/magic ;i

D i: d100 limitedmap/magic .; d100 limitedmap/magic .; potions ;i
E i: 3 times I.map/magic .; iterate .;  scrolls ;i
F i: 3 times 75 d limitedmap/magic .; iterate potions .; scrolls ;i
G i: 4 times I.map/magic .; iterate .;  scrolls ;i
H i: 4 times I.map/magic .; iterate .; potions .; scrolls  ;i

I i:  I.map/magic ;i

J i: ." j magic " ;i
K i: ." k magic " ;i
L i: ." l magic " ;i
M i: ." m magic " ;i
N i: ." n magic " ;i
O i: ." o magic " ;i
P i: ." p magic " ;i
Q i: ." q magic " ;i
R i: ." r magic " ;i

S i: 2d4 times potions ?.; iterate ;i
T i: d4 times scrolls ?.; iterate ;i
U i: ." u magic " ;i
V i: ." v magic " ;i

W i: just-map ;i

X i: misc.magic .; potions ;i
Y i: ." y magic " ;i

Z i: d100 III.magic ., d100 III.magic ., d100 III.magic   ;i

;table
decimal

public:

: .magic 
  26 0 do
     i magictreasure @ 
     ?dup if
        times
	     	j 10 + magictype cr
	iterate
     then
  loop
;

;module
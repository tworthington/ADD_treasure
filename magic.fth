requires MODULES
requires ERRORS

module: MAGIC

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

private:

: pot ." Potion of " ;
: sprot ." Scroll of protection from " ;

public:

digression III.A "potiontables.fth"

%table: potions
1	i: III.A ;i
66	i: III.A.2 ;i
;table

private:
: 2-9  d8 1+ ;
: 2-7  d6 1+ ;
: 3-8  d6 2 + ;
: 3-6  d4 2 + ;
: 4-9  d6 3 + ;
: 4-7  d4 3 + ;

: .numspells ( n -- )
  dup 1 = if ." of 1 spell: "  else  ." of " dup . ." spells: "  then drop
;

: .level ( xt -- )
  execute ( lv )
  ." level " ..
;

: under--? ( a x -- a-1 x flag)
  swap 1- tuck 0<>
;

: scroll  ( n xt -- )
  over .numspells
  begin  ( n xt )
  	 dup ( n xt xt )
	 .level  ( n xt )
	 under--? 
  while
 	 .,
  repeat
  2drop
;

: muscroll ( n xt ) ." Magical scroll " scroll ;
: clscroll ." Clerical scroll " scroll ;
: illscroll ." Illusionist scroll " scroll ;
: drscroll ." Druidic scroll " scroll ;

: (spellscroll)  ( n clxt muxt -- )
  d100 71 < if  
       d10 1 = if drop illscroll  else  nip muscroll  then
  else  \ cleric
  	drop
	d4 1 = if drscroll  else  clscroll then
  then
;

: spellscroll ( <murange> <clrange> )
   ' ' lit lit 
   postpone (spellscroll)
; immediate

public:

%table: III.B
1	i: 1 spellscroll d4 d4 ;i
11	i: 1 spellscroll d6 d6 ;i
17	i: 1 spellscroll 2-9 2-7 ;i
20	i: 2 spellscroll d4 d4 ;i
25	i: 2 spellscroll d8 d6 ;i
28	i: 3 spellscroll d4 d4 ;i
33	i: 3 spellscroll 2-9 2-7 ;i
36	i: 4 spellscroll d6 d6 ;i
40	i: 4 spellscroll d8 d6 ;i
43	i: 5 spellscroll d6 d6 ;i
47	i: 5 spellscroll d8 d6 ;i
50	i: 6 spellscroll d6 d6 ;i
53	i: 6 spellscroll 3-8 3-6 ;i
55	i: 7 [ ' d8 ] literal muscroll ;i
58	i: 7 [ ' 2-9 ] literal muscroll ;i
60	i: 7 spellscroll 4-9 4-7 ;i
61	i: sprot ." demons" ;i
63	i: sprot ." devils" ;i

	%table: scrprotelementals
	1      i: ." air elementals" ;i
	16     i: ." earth elementals" ;i
	31     i: ." fire elementals" ;i
	46     i: ." water elementals" ;i
	60     i: ." all elementals" ;i
	;table
65	i: sprot scrprotelementals ;i

	%table: scrprotlycanthropes
	1	i: ." werebears" ;i
	6	i: ." wereboars" ;i
	11	i: ." wererats" ;i
	21	i: ." weretigers" ;i
	26	i: ." werewolves" ;i
	41	i: ." all lycanthropes" ;i
	99	i: ." shape-changers" ;i
	;table
71	i: sprot scrprotlycanthropes ;i
77	i: sprot ." magic" ;i
83	i: sprot ." petrification" ;i

	%table: scrprotpossession
	1	i: ." 10-60 rnds, mobile" ;i
	91	i: ." 10-60 turns, stationary" ;i
	;table
88	i: sprot ." possession (" scrprotpossession ." )" ;i
93	i: sprot ." undead" ;i

	%table: scrollcursed
	1	i: ." reader polymorphed to monster of equal level, attacks" ;i
	26	i: ." reader turned to liquid, drains away" ;i
	31	i: ." reader and all within 20' transported " 2d6 100 * . ." miles away" ;i
	41	i: ." reader and all withing 20' transported to another world, plane, or continuum" ;i
	51	i: ." reader contracts disease, fatal in " 2d4 . ." turns" ;i
	76	i: ." explosive runes, " 6d4 6 + . ." damage to reader, others within 1" " ."  save for half" ;i
	91	i: ." nearby item demagicked" ;i
	100	i: ." random spell affects reader at 12th level of use" ;i
	;table
98	i: ." Cursed scroll (" scrollcursed ." )" ;i
;table

\ all protection scrolls
%table: III.B.2
1	i: ." acid" ;i
3	i: ." breath weapons, dragon" ;i
8	i: ." breath weapons, non-dragon" ;i
13	i: ." cold" ;i
18	i: ." electricity" ;i
23	i: ." fire" ;i
28	i: ." gas" ;i
33	i: ." illusions" ;i
38	i: ." paralyzation" ;i
43	i: ." plants" ;i
49	i: ." poison" ;i

	%table: scrprottraps
	1	i: ." mechanical traps" ;i
	51	i: ." magical traps" ;i
	71	i: ." all traps" ;i
	;table
55	i: scrprottraps ;i
60	i: ." water" ;i
65	i: ." weapons, magical blunt" ;i
71	i: ." weapons, magical edged" ;i
77	i: ." weapons, magical missile" ;i
83	i: ." weapons, non-magical blunt" ;i
89	i: ." weapons, non-magical edged" ;i
95	i: ." weapons, non-magical missile" ;i
;table

%table: scrolls
1	i: III.B ;i
86	i: sprot III.B.2 ;i
;table

private:

defer map-details

%table: III.magic
1	i: potions ;i
21	i: scrolls ;i
36	i: ." Ring " ;i
41	i: ." Rod/staff/wand " ;i
46	i: ." Misc. magic " ;i
61	i: ." Armour/shield " ;i
76	i: ." Sword " ;i
87	i: ." Misc. weapon " ;i
;table

\ GEMS

dtable: magicmaptreasure
1 	i: III.magic ." plus 4 potions" ;i
6	i: III.magic ., III.magic ;i
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
11 i: III.magic  ;i

;table

36 base !

lookup: magictype
A i:  I.map/magic ., I.map/magic ., I.map/magic  ;i

B i: ." b magic " ;i

C i: I.map/magic ., I.map/magic ;i

D i: ." d magic " ;i
E i: ." e magic " ;i
F i: ." f magic " ;i
G i: ." g magic " ;i
H i: ." h magic " ;i

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

S i: ." s magic " ;i
T i: ." t magic " ;i
U i: ." u magic " ;i
V i: ." v magic " ;i

W i: just-map ;i

X i: ." x magic " ;i
Y i: ." y magic " ;i

Z i: III.magic ., III.magic ., III.magic   ;i

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
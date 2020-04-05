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
  swordstab
;

digression III.H 'miscweapons.fth'

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
1 	i: d100 III.magic 4 times potions cr iterate ;i
6	i: d100 III.magic ., d100 III.magic ;i
9	i: swords cr armour/shield cr misc.weapons cr ;i
13	i: 3 times 
	     begin  d100  dup 76 86 >=< over 21 < or while drop repeat
	     III.magic
	   iterate
        ;i
15	i: 6 times potions cr iterate 6 times rings cr iterate ;i
19	i: rings cr rod/staff/wand cr d100 III.magic  d100 III.magic ;i
20	i: rod/staff/wand cr misc.magic cr  3 times d100 III.magic iterate ;i
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
          ." and nearby: " 15 magicmaptreasure ., 20 magicmaptreasure ;i
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
  ." {"  II.map
  map-details ." }"
;

' map-details is (map-details)

%table: I.map/magic
1 i: just-map cr  ;i
11 i: d100 III.magic  ;i

;table

%table: limitedmap/magic ( n )
1	i: drop just-map cr ;i
11	i: III.magic ;i
;table

36 base !

lookup: magictype
A i:  3 times I.map/magic ?cr iterate ;i

B i: [ base @ decimal ] 40 d 60 + [ base ! ] limitedmap/magic ;i

C i: I.map/magic cr I.map/magic ;i

D i: d100 limitedmap/magic  d100 limitedmap/magic potions cr ;i
E i: 3 times I.map/magic cr iterate  scrolls ;i
F i: 3 times 75 d limitedmap/magic  iterate potions cr scrolls cr ;i
G i: 4 times I.map/magic iterate  scrolls cr ;i
H i: 4 times I.map/magic iterate  potions cr scrolls cr ;i

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

S i: 2d4 times potions cr iterate ;i
T i: d4 times scrolls cr iterate ;i
U i: potions cr rings cr rod/staff/wand cr misc.magic cr armour/shield cr swords cr misc.weapons cr ;i
V i: 2 times rings cr rod/staff/wand cr misc.magic cr armour/shield cr swords cr misc.weapons cr iterate ;i

W i: just-map ;i

X i: misc.magic cr potions cr ;i
Y i: ." y magic" ;i

Z i: d100 III.magic d100 III.magic d100 III.magic   ;i

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

global:
: #magic
  times  d100 III.magic iterate ;

;module
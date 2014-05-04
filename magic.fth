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

digression III.B 'scrolls.fth'

%table: scrolls
1	i: III.B ;i
86	i: sprot III.B.2 ;i
;table

%table: III.C
	%table: ringofcontrariness
	1	i: ." flying" ;i
	21	i: ." invisibility" ;i
	41	i: ." levitation" ;i
	61	i: ." shocking grasp (once per round)" ;i
	71	i: ." spell turning" ;i
	81	i: ." strength (18/00)" ;i
	;table
1	i: ." contrariness and " ringofcontrariness ."  (cursed)" ;i
7	i: ." delusion (cursed)" ;i
13	i: ." djinni summoning" ;i

	dtable: ringofelementalcommand
	1      i: ." air" ;i
	2      i: ." earth" ;i
	3      i: ." fire" ;i
	4      i: ." water" ;i
	;table
	
15	i: ." elemental " d4 ringofelementalcommand ."  command" ;i
16	i: ." feather falling" ;i
22	i: ." fire resistance" ;i
28	i: ." free action" ;i
31	i: ." human influence" ;i
34	i: ." invisibility" d10 1 = if ."  and inaudibility" then ;i
41	i: ." mammal control" ;i
44	i: ." multiple wishes (" 2d4 .. ." )" ;i

	%table: ringofprotection
	1      i: ." +1" ;i
	71     i: ." +2" ;i
	83     i: ." +2, 5' radius" ;i
	84     i: ." +3" ;i
	91     i: ." +3, 5' radius" ;i
	92     i: ." +4 to AC, +2 on saves" ;i
	98     i: ." +6 to AC, +1 on saves" ;i
	;table
45	i: ." protection (" ringofprotection ." )" ;i
61	i: ." regeneration" d10 1 = if ."  (vampiric)" then ;i
62	i: ." shooting stars" ;i

64	i: 
	  d100 71 < if  
	        d10 1 = if ." illusionist " 1 else  ." magic-user " 0 then
          else  \ cerical
          	d4 1 = if ." druidic "  else  ." clerical " then  1
	  then  ( 7-levels?)
	  ." spell storing (" d4 1+ dup . ." spells, levels: "
	  times dup if   d6 dup 6 = if drop d4 then 
	  	    else d8 dup 8 = if drop d6 then
		    then
		.
	  iterate ." )"  
	;i

66	i: ." spell turning" ;i
70	i: ." swimming" ;i

	%table: ringoftelekinesis
	1	i: ." 250gp" ;i
	26	i: ." 500gp" ;i
	51	i: ." 1000gp" ;i
	90	i: ." 2000gp" ;i
	100	i: ." 4000gp" ;i
	;table
76	i: ." telekinesis (" ringoftelekinesis ."  max)" ;i
78	i: ." three wishes" ;i
80	i: ." warmth" ;i
86	i: ." water walking" ;i
91	i: ." weakness (cursed)" ;i

	%table: ringofwizardrey
	1	i: ." first level" ;i
	51	i: ." second level" ;i
	76 	i: ." third level" ;i
	83	i: ." first and second level" ;i
	89	i: ." fourth level" ;i
	93	i: ." fifth level" ;i
	96	i: ." first through third level" ;i
	100	i: ." fourth and fifth level" ;i
	;table
99	i: ." wizardry (doubles " ringofwizardrey ."  spells) (M)" ;i
100	i: ." x-ray vision" ;i
;table

%table: III.C.2
01	i: ." animal friendship (27 charges)" ;i
09	i: ." anything (" d6 100 * . ." gp value)" ;i
11	i: ." blinking" ;i
21	i: ." Boccob" ;i
23	i: ." chameleon power" ;i

	%table: ringofclumsiness
	1	i: ." free action" ;i
	11	i: ." feather falling" ;i
	21	i: ." invisibility" ;i
	36	i: ." jumping" ;i
	51	i: ." swimming" ;i
	61	i: ." warmth" ;i
	81	i: ." water walking" ;i
	;table
32	i: ." clumsiness and " ringofclumsiness ."  (cursed)" ;i

	%table: ringoffaerie
	1	i: ." evil" ;i
	6	i: ." good" ;i
	76	i: ." neutral" ;i
	;table
41	i: ." færie (" ringoffaerie ." )" ;i
50	i: ." jumping" ;i
59	i: ." mind shielding" ;i
68	i: ." of the ram (" 6 10 roll . ." charges)" ;i
71	i: ." shocking grasp" ;i
80	i: ." sustenance" ;i
93	i: ." truth" ;i
;table

%table: rings
1	i: ." Ring of " III.C ;i
68	i: ." Ring of " III.C.2 ;i
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
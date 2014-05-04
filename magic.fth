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

digression III.C 'rings.fth'

%table: rings
1	i: ." Ring of " III.C ;i
68	i: ." Ring of " III.C.2 ;i
;table

private:
: rodcharges ."  - " 40 d10 + . ." charges" ;
: staffcharges ."  - " 19 d6 + . ." charges" ;
: wandcharges ."  - " 80 d20 + . ." charges" ;

public:
%table: III.D
1	i: ." Rod of Absorption (C,M)" rodcharges ;i
7	i: ." Rod of Alertness" rodcharges ;i
11	i: ." Rod of Beguiling (C,M,T)" rodcharges ;i
12	i: ." Rod of Cancellation" rodcharges ;i
22	i: ." Rod of Flailing" rodcharges ;i
27	i: ." Rod of Lordly Might (F)" rodcharges ;i
28	i: ." Rod of Passage" rodcharges ;i
31	i: ." Rod of Resurrection (C)" rodcharges ;i
32	i: ." Rod of Rulership" rodcharges ;i
33	i: ." Rod of Security" rodcharges ;i
37	i: ." Rod of Smiting (C,F)" rodcharges ;i
38	i: ." Rod of Splendor" rodcharges ;i
41	i: ." Staff of Command (C,M)" staffcharges ;i
42	i: ." Staff of Curing (C)" staffcharges ;i
49	i: ." Staff-Mace" staffcharges ;i
56	i: ." Staff of the Magi (M)" staffcharges ;i
57	i: ." Staff of Power (M)" staffcharges ;i
58	i: ." Staff of the Serpent (" d10 7 < if ." python" else ." adder" then ." ) (C)"  staffcharges ;i
64	i: ." Staff of Slinging (D)" staffcharges ;i

	dtable: staffspear
	1	i: ." +1" ;i
	7	i: ." +2" ;i
	11	i: ." +3" ;i
	14	i: ." +4" ;i
	17	i: ." +5" ;i
	20	i: ." +6" ;i
	;table
71	i: ." Staff-Spear (" d20 staffspear ." )" staffcharges ;i
77	i: ." Staff of Striking (C,M)" staffcharges ;i
83	i: ." Staff of Swarming Insects (C,M)" staffcharges ;i
86	i: ." Staff of Thunder & Lightning" staffcharges ;i
87	i: ." Staff of Withering (C)" staffcharges ;i
91	i: ." Staff of the Woodlands (D)" staffcharges ;i
;table

%table: III.D.2
1	i: ." anything" ;i
2	i: ." the buckler (F,M,T)" ;i
6	i: ." Conjuration (M)" ;i
8	i: ." Defoliation" ;i
11	i: ." Earth & Stone" ;i
13	i: ." Enemy Detection" ;i
17	i: ." Fear (C,M)" ;i
21	i: ." Fire (M)" ;i
23	i: ." Fireballs" ;i
27	i: ." Flame Extinguishing" ;i
31	i: ." Force (F,M)" ;i
32	i: ." Frost (M)" ;i
33	i: ." Ice Storms" ;i
36	i: ." Illumination" ;i
40	i: ." Illusion (M)" ;i
44	i: ." Lightning (M)" ;i
46	i: ." Lightning Bolts" ;i
50	i: ." Magic Detection" ;i
54	i: ." Magic Missiles" ;i
62	i: ." Metal & Mineral Detection" ;i
67	i: ." Metal Command" ;i
69	i: ." Negation" ;i
75	i: ." Paralyzation (M)" ;i
79	i: ." Polymorphing (M)" ;i
83	i: ." Secret Door & Trap Location" ;i
87	i: ." Size Alteration" ;i
91	i: ." Steam & Vapor (C,M)" ;i
93	i: ." Wonder" ;i
;table

%table: rod/staff/wand
1	i: III.D ;i
41	i: ." Wand of " III.D.2 wandcharges ;i
;table

private:

defer map-details

%table: III.magic
1	i: potions ;i
21	i: scrolls ;i
36	i: rings ;i
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
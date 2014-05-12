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

%table: language
1	e: s" Brownie" ;e
2	e: s" Bugbear" ;e
4	e: s" Centaur" ;e
5	e: s" Dragon, Black" ;e
6	e: s" Dragon, Blue" ;e
7	e: s" Dragon, Brass" ;e
8	e: s" Dragon, Bronze" ;e
9	e: s" Dragon, Copper" ;e
10	e: s" Dragon, Gold" ;e
11	e: s" Dragon, Green" ;e
12	e: s" Dragon, Red" ;e
13	e: s" Dragon, Silver" ;e
14	e: s" Dragon, White" ;e
15	e: s" Dryad" ;e
16	e: s" Dwarvish" ;e
21	e: s" Elvish" ;e
26	e: s" Ettin" ;e
27	e: s" Gargoyle" ;e
28	e: s" Giant, Cloud" ;e
29	e: s" Giant, Fire" ;e
30	e: s" Giant, Frost" ;e
31	e: s" Giant, Hill" ;e
34	e: s" Giant, Stone" ;e
35	e: s" Giant, Storm" ;e
36	e: s" Goblin" ;e
40	e: s" Gnoll" ;e
41	e: s" Gnome" ;e
45	e: s" Halfling" ;e
50	e: s" Hobgoblin" ;e
52	e: s" Kobold" ;e
55	e: s" Lammasu" ;e
56	e: s" Lizard Man" ;e
59	e: s" Manticore" ;e
60	e: s" Medusion" ;e
61	e: s" Minotaur" ;e
62	e: s" Naga, Guardian" ;e
63	e: s" Naga, Spirit" ;e
64	e: s" Naga, Water" ;e
65	e: s" Nixie" ;e
66	e: s" Nymph" ;e
67	e: s" Ogrish" ;e
71	e: s" Ogre magian" ;e
72	e: s" Orcish" ;e
77	e: s" Pixie" ;e
78	e: s" Salamander" ;e
79	e: s" Satyr" ;e
80	e: s" Shedu" ;e
81	e: s" Sprite" ;e
82	e: s" Sylph" ;e
83	e: s" Titan" ;e
84	e: s" Troll" ;e
85	e: s" Xorn" ;e
86	e: s" Human foreign" ;e
;table

private:

create langtrack 100 cells allot

: -language
  dup 86 < if cells langtrack + -1 swap !
  else drop
  then
;

: alanguage
  begin
    language ( n caddr len )
    rot dup cells langtrack + @ while \ failed
    drop 2drop
  repeat
  -language
  type
;

: languages ( n )
  langtrack 100 cells 0 fill
  times
	alanguage ?.;
  iterate
;

variable swordego
variable swordint
variable swordalignment
variable swordlanguages

variable legalalign

lookup: $alignment
0 	i: s" Chaotic Good" ;i
1	i: s" Chaotic Neutral" ;i
2	i: s" Chaotic Evil" ;i
3 	i: s" Neutral Evil" ;i
4	i: s" Lawful Evil" ;i
5	i: s" Lawful Neutral" ;i
6	i: s" Lawful Good" ;i
7	i: s" Neutral Good" ;i
8	i: s" Neutral" ;i
;table

binary

11000001 constant Good
00011100 constant Evil

Good Evil or not constant Good<>Evil

01110000 constant Lawful
00000111 constant Chaotic

Lawful Chaotic or not constant Law<>Chaos

0 constant Neutral
-1 constant Any

decimal

\ elimiate set of alignments
: -align  ( l/c g/e -- )
  or
  not legalalign @ and legalalign !
;

\ allow only a set of alignments
: +align ( l/c g/e -- )
  and
  legalalign @ and legalalign !
;

: .good/evil/both 
  Good<>Evil swordalignment @ btest if ." good/evil" else
    Good swordalignment @ btest if ." evil" else ." good"
  then then
;

: .law/chaos/both 
  Law<>Chaos swordalignment @ btest if ." law/chaos" else
    Lawful swordalignment @ btest if ." chaos" else ." law"
  then then
;

\ Final word swords force alignment but can't use 0
\ because then alignment is random, so we signal it
\ with a negative alignment
: .alignment swordalignment @ dup 0< if  negate 1- then
   $alignment type ;

%table: alignmenttab
1	i: 0  ;i
6	i: 1  ;i
16	i: 2  ;i
21	i: 3  ;i
26	i: 4  ;i
31	i: 6  ;i
56	i: 5  ;i
61	i: 8  ;i
81	i: 7  ;i
;table

: alignment
  swordalignment @ 0= if
    begin
	  alignmenttab legalalign @ over btest 0= while drop
    repeat
    swordalignment !
  then
;

: shift-align ( align shift -- align2)
  over 8 = if drop else  + 7 mod then ;

: diametric   4 shift-align ;

variable primes?
11 constant #primes
#primes array primaries

: primaries++ ( n -- ) dup if 2 swordego +! then  1 swap primaries +!  -1 primes? ! ;

: -primaries
  #primes times 0 i primaries ! iterate 0 primes? ! ;

variable extras?
18 constant #extras
#extras array extras

: extras++  dup if 4 swordego +! then  1 swap extras +!  -1 extras? ! ;

: -extras #extras times 0 i extras ! iterate 0 extras? ! ;


%table: specialpurpose
1	i: ." defeat " swordalignment @ 8 = if  ." extreme alignments" else
	      	       		      	    	swordalignment @ diametric $alignment type
					    then
	   ;i
11	i: ." kill clerics" ;i
21	i: ." kill fighters" ;i
31	i: ." kill magic users" ;i
41	i: ." kill thieves" ;i
51	i: ." kill bards and monks" ;i
56	i: ." overthrow " .law/chaos/both ;i
66      i: ." overthrow " .good/evil/both ;i
76	i: ." slay non-human monsters" ;i
;table

%table: specialpurposepower
1	i: ." blindness 2d6 rnds" ;i
11	i: ." confusion 2d6 rnds" ;i
21	i: ." disintegrate" ;i
26	i: ." fear for 1d4 rnds" ;i
56	i: ." insanity for 1d4 rnds" ;i
66	i: ." paralysis for 1d4 rnds" ;i
81	i: ." +2 to saves, -1 to each of opponents' damage die" ;i
;table

dtable: extrapowers ( # -- power)
1	i: 1 ;i
8	i: 2 ;i
16	i: 3 ;i
23	i: 4 ;i
29	i: 5 ;i
35	i: 6 ;i
42	i: 7 ;i
48	i: 8 ;i
55	i: 9 ;i
62	i: 10 ;i
68	i: 11 ;i
76	i: 12 ;i
82	i: 13 ;i
89	i: 14 ;i
94	i: 15 ;i
\ 95	i: 94 d extrapowers extras++ 94 d extrapowers  ;i
\ 99	i: ." Character may choose extraordinary ability. Special purpose: " specialpurpose	   ." ; special purpose power: " specialpurposepower 12 swordego +! .; 0 ;i
;table

lookup: .extra ( x )
1	i: ." charm person on contact - " 3 * . ." times/day" ;i
2	i: .' clairaudience, 3" range - ' 3 * . ." times/day 1 round per use" ;i
3	i: .' clairvoyance, 3" range - ' 3 * . ." times/day 1 round per use" ;i
4	i: ." determine directions and depth - " 2* . ." times/day" ;i
5	i: .' ESP, 3" range - ' 3 * . ." times/day 1 round per use" ;i
6	i: .' flying, 12"/turn - ' . ." hr/day" ;i
7	i: ." heal - " . ." /day" ;i
8	i: .' illusion, 12" range - ' 2* . ." times/day, as the wand" ;i
9	i: ." levitation, 1 turn duration - " 3 * .. ." /day at 6th level" ;i
10	i: ." strength - " . ." time/day (upon wielder only)" ;i
11	i: ." telekinesis, 2,500 g.p. wt. maximum - " 2* . ." times/day, 1 round each use" ;i
12	i: .' telepathy, 6" range - ' 2* . ." times/day" ;i
13	i: ." teleportation - " .. ." /day 6,000 g.p. wt. maximum, segments to activate" ;i
14	i: .' X-ray vision, 4" range - ' 2* . ." times/day 1 turn per use" ;i
15	i: ." Character may choose one primary ability" drop ;i
;table

: .extras
  extras? @ if .;
  #extras 1 do
  	  i  extras @ ?dup if  i .extra .; then
  loop
  then
;

: extra d100 extrapowers extras++  ;

dtable: primeability ( # -- ability)
1	i: 1 ;i
12	i: 2 ;i
23	i: 3 ;i
34	i: 4 ;i
45	i: 5 ;i
56	i: 6 ;i
67	i: 7 ;i
78	i: 8 ;i
83	i: 9 ;i
88	i: 10 ;i
93	i: 92 d primeability primaries++  92 d primeability  ;i
99	i: extra 0 ;i
;table

\ add a number of primary abilities to sword
: primary ( n )
  alignment
  times
	d100 primeability primaries++
  iterate
;

: "rad ( in -- )  .. [char] " emit ."  radius" ;

: /2"rad ( ½in -- )
  2 /mod ?dup if .. then if ." ½" then " ."  radius" ;

lookup: .primary ( n )
1	i: ." detect elevator/shifting rooms/walls within " "rad ;i
2	i: ." detect sloping passages in a " "rad ;i
3	i: ." detect traps of large size in a " "rad ;i
4	i: ." detect " .good/evil/both ."  in a " "rad ;i
5	i: ." detect precious metals, kind, and amount in a " 2* "rad ;i
6	i: ." detect gems, kind, and number in a "  /2"rad ;i
7	i: ." detect magic in a " "rad ;i
8	i: ." detect secret doors in a " /2"rad ;i
9	i: ." detect invisible objects in a " "rad ;i
10	i: ." locate object in a " 12 * "rad ;i
;table

: .primes
  primes? @ if .;
  #primes 1 do
  	  i  primaries @ ?dup if dup 2* swordego +!
	    i .primary .; then
  loop
  then
;

dtable: #languages
1	i: 1 ;i
41	i: 2 ;i
71	i: 3 ;i
86	i: 4 ;i
96	i: 5 ;i
100	i: 99 d #languages 99 d #languages + 6 max ;i
;table

: .languages
  swordlanguages @ ?dup if
    ." speaks "
    dup dup . 1 = if ." other language: " else ." other languages: " then
    languages
    swordint @ 15 > if ."  (and can read these too"
        swordint @ 16 > if ." , as well as magical texts" then
	." )"
    then
  then
;

: speech
  d100 #languages dup swordego +!
  1+ swordlanguages !  \ count alignment language
;

: .sword
  .;
  .alignment .;
  swordego @ 1+ 2/ swordego !
  ." INT " swordint @ .. .;
  ." EGO " swordego @ .. .;
  ." Personality " swordego @ swordint @ + .. .;
  .languages .primes .extras
;

\ store ego as half points
%table: ego ( base)
1	i:  drop ;i	\ nothing special about sword
76	i:  2* swordego !  12 swordint !  1 primary ." , semi-empathic " .sword ;i
84	i:  2* swordego !  13 swordint !  2 primary ." , empathic " .sword ;i
90	i:  2* swordego !  14 swordint !  2 primary speech .sword ;i
95	i:  2* swordego !  15 swordint !  3 primary speech .sword ;i
98	i:  1+ 2* swordego ! 16 swordint ! 3 primary speech .sword ;i
100	i:  3 + 2* swordego ! 17 swordint ! 3 primary speech extra .sword ;i
;table

: superego
  25 d 75 + override: ego
;
  
%table: swordtype
1	i: ." Longsword" ;i
66	i: ." Broadsword" ;i
86	i: ." Falcion" ;i
91	i: ." Shortsword" ;i
96	i: ." Bastard sword" ;i
100	i: ." Two-handed sword" ;i
;table

public:

%table: III.G
1	i: swordtype ." , +1" 1 ego ;i
26	i: swordtype ." , +1, +2 vs. magic-using & enchanted creatures" 3 ego ;i
31	i: swordtype ." , +1, +3 vs. lycanthropes" 4 ego ;i
36	i: swordtype ." , +1, +3 vs. regenerating creatures & shape-changers" 4 ego ;i
41	i: swordtype ." , +1, +4 vs. reptiles" 5 ego ;i
46	i: swordtype ." , +1, Flame Tongue: +2 vs. regenerating; +3 vs. cold-using, inflamable, or avian; +4 vs. undead " 5 ego ;i
50	i: swordtype ." , +1 Luck Blade (" d4 1+ . ." wishes)" Lawful Neutral -align 2 ego ;i
51	i: swordtype ." , +2" 2 ego ;i
59	i: swordtype ." , +2, Giant Slayer" 4 ego ;i

	lookup: dragonslayertype ( align)
	1	i: ." black" Chaotic Evil ;i		6	i: ." gold" Lawful Good ;i
	2	i: ." blue" Lawful Evil ;i		7	i: ." silver" Lawful Good ;i
	3	i: ." green" Lawful Evil ;i		8	i: ." brass" Chaotic Good ;i
	4	i: ." white" Chaotic Evil ;i		9	i: ." bronze" Lawful Good ;i
	5	i: ." red" Chaotic Evil ;i		10	i: ." copper" Chaotic Good ;i
	;table
63	i: swordtype ." , +2, Dragon Slayer (" d10  dragonslayertype -align ." )" 6 ego ;i
67	i: ." Shortsword of Quickness +2" 4 ego ;i
71	i: swordtype ." , +3" 3 ego ;i
77	i: swordtype ." , +3, Frost Brand: + 6 vs. fire using/dwelling creatures" 9 ego ;i
80	i: ." Broadsword of the planes" ;i
82	i: swordtype ." , +4" 4 ego ;i
85	i: swordtype ." , +4 Defender" 8 ego ;i
87	i: swordtype ." , +5" 5 ego ;i
89	i: swordtype ." , +1 (cursed)" Neutral Good -align 2 ego ;i
95	i: swordtype ." , -2 (cursed)" Neutral Good -align 4 ego ;i
99	i: swordtype ." , Berserking +2 (cursed)" Lawful Good -align 4 ego ;i
;table

%table: III.G.2
1	i: ." Sun blade (bastard sword), +2, +4 vs. Evil"  Any Good +align 12 ego ;i
16	i: swordtype ." , anything" 10 ego ;i

	lookup: finalword
	1	i: ." Answerer" ;i
	2	i: ." Back-talker" ;i
	3	i: ." Concluder" ;i
	4	i: ." Last-quip" ;i
	5	i: ." Rebutter" ;i
	6	i: ." Replier" ;i
	7	i: ." Retorter" ;i
	8	i: ." Scather" ;i
	9	i: ." Squelcher" ;i
	;table
17	i: .' Broadsword, final word - "' 9 d  dup negate swordalignment !  finalword " 6 superego ;i
33	i: swordtype ."  of Dancing"  5 ego ;i
46	i: swordtype ." , +5, Defender" 10 ego ;i
62	i: swordtype ." , +6, Defender" 12 ego ;i
70	i: swordtype ." , +5, Holy Avenger" Lawful Good +align 10 ego ;i
85	i: swordtype ." , +6, Holy Avenger" Lawful Good +align 12 ego ;i
92	i: swordtype ."  of Life Stealing" Neutral Good -align 4 ego ;i
94	i: swordtype ." , +2, Nine Lives Stealer" Neutral Good -align 4 ego ;i
96	i: swordtype ."  of Sharpness" Chaotic Any +align 6 ego ;i
98	i: swordtype ." , Vorpal Blade" Lawful Any +align 6 ego ;i 
99	i: swordtype ." , of Wounding" 2 ego ;i
;table

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
87	i: ." Misc. weapon " cr ;i
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
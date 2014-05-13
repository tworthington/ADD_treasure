private:

create langtrack 100 cells allot

: -language
  dup 86 < if cells langtrack + -1 swap !
  else drop
  then
;

: alanguage
  begin
    languagetab ( n caddr len )
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
#primes cells allot

: primaries++ ( n -- ) dup if 2 swordego +! then  1 swap primaries +!  -1 primes? ! ;

: -primaries
  #primes times 0 i primaries ! iterate 0 primes? ! ;

variable extras?
18 constant #extras
#extras array extras
#extras cells allot
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
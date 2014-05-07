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

: .level ( n -- )
  ." L" .. ." : "
;

: under--? ( a x -- a-1 x flag)
  swap 1- tuck 0<>
;

: scroll  ( n lvxt tabxt -- )
  rot dup .numspells
  times  ( lvxt tabxt )
  	 over execute dup .level over execute
  	 ?.;
  iterate
  2drop
;

: muscroll ( n lv-xt ) ." Magical scroll " ['] muspell scroll ;
: clscroll ." Clerical scroll " ['] clericspell scroll ;
: illscroll ." Illusionist scroll " ['] illspell scroll ;
: drscroll ." Druidic scroll " ['] druidspell scroll ;

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

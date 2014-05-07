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

dtable: III.E.1
01	i: ." Alchemy Jug" ;i
03	i: ." Amulet of Inescapable Location (cursed)" ;i
05	i: ." Amulet of Life Protection" ;i
06	i: ." Amulet of the Planes" ;i
08	i: ." Amulet of Proof Against Detection and Location" ;i
12	i: ." Apparatus of Kwalish" ;i
14	i: ." Arrow of Direction" ;i
17	i: ." Artifact or Relic" ;i
18	i: ." Bag of " 3d4 . ." Beans" ;i
21	i: ." Bag of Devouring" ;i

	%table: bagofholding
	1	i: ." 15lb, 250lb limit, 30cuft" ;i
	31	i: ." 15lb, 500lb limit, 70cuft" ;i
	71	i: ." 35lb, 1000lb limit, 150cuft" ;i
	91	i: ." 60lb, 1500lb limit, 250cuft" ;i
	;table
22	i: ." Bag of Holding (" bagofholding ." )" ;i
27	i: ." Bag of Transmuting (cursed)" ;i

	dtable: bagoftricks
	1	i: ." Weasel type" ;i
	6	i: ." Rat type" ;i
	9	i: ." Jackel type" ;i
	;table
28	i: ." Bag of Tricks (" d10 bagoftricks ." )" ;i
30	i: ." Beaker of Plentiful Potions - " d4 1+ . ." doses of: "
	   d4 1+ times potions ?., iterate
	;i
32	i: ." Boat, Folding" ;i
33	i: ." Book of Exalted Deeds (C)" ;i

	: infiniteclericlevel  d10 dup 6 > if  drop d6 then ;
	: infinitemulevel  d12 dup 9 > if  drop d8 then  ;

	%table: infinitespellclass
	1	i: ." blank page" ;i
	31	i: ." cleric spell (" infiniteclericlevel dup .. ., clericspell ." )" ;i
	51	i: ." druid spell (" infiniteclericlevel dup .. ., druidspell ." )" ;i
	61	i: ." magic-user spell (" infinitemulevel dup .. ., muspell ." )" ;i
	96	i: ." illusionist spell (level " infiniteclericlevel dup .. ., illspell ." )" ;i
	;table
34	i: ." Book of Infinite Spells - " d8 22 + dup . ." pages: "
	   times
		infinitespellclass ?.,
	   iterate
	;i
35	i: ." Book of Vile Darkness (C)" ;i
36	i: ." Boots of Dancing" ;i
37	i: ." Boots of Elvenkind" ;i
43	i: ." Boots of Levitation" ;i
48	i: ." Boots of Speed" ;i
52	i: ." Boots of Striding and Springing" ;i
56	i: ." Bowl Commanding Water Elementals (M)" ;i
59	i: ." Bowl of Watery Death (M)" ;i

	%table: bracersofdefense
	1	i: 8 . ;i
	6	i: 7 . ;i
	16	i: 6 . ;i
	36	i: 5 . ;i
	51	i: 4 . ;i
	71	i: 3 . ;i
	86	i: 2 . ;i
	;table
60	i: ." Bracers of Defense, AC " bracersofdefense ;i
80	i: ." Bracers of Defenselessness" ;i
82	i: ." Brazier Commanding Fire Elementals (M)" ;i
85	i: ." Brazier of Sleep Smoke (M)" ;i
86	i: ." Broach of Shielding" d10 1 = if ."  (with gems)" then ;i
93	i: ." Broom of Animated Attack" ;i
94	i: ." Broom of Flying" ;i

	%table: bucknardspurse
	1	i: ." 26sp, 26ep, 26gp" ;i
	51	i: ." 26cp, 26ep, 26pp" ;i
	91	i: ." 26cp, 26ep, 26 gems" ;i
	;table
99	i: ." Bucknard's Everfull Purse (" bucknardspurse ." )" ;i
;table

%table: III.E.2
	%table: itemalignment
	1	i: ." LG" ;i
	11	i: ." NG" ;i
	21	i: ." CG" ;i
	31	i: ." CN" ;i
	41	i: ." CE" ;i
	51	i: ." NE" ;i
	61	i: ." LE" ;i
	71	i: ." LN" ;i
	81	i: ." N" ;i
	;table
01	i: ." Candle of Invocation (" itemalignment ." ) (C)" ;i

	%table: carpetofflying
	1	i: ." 3'x5', 1 person, 42" " ;i
	21	i: ." 4'x6', 2 persons, 36" " ;i
	56	i: ." 5'x7', 3 persons, 30" " ;i
	81	i: ." 6'x9', 4 persons, 23" " ;i
	;table
07	i: ." Carpet of Flying (" carpetofflying ." )" ;i
09	i: ." Censer Controlling Air Elementals (M)" ;i
11	i: ." Censer of Summoning Hostile Air Elementals (cursed) (M)" ;i
12	i: ." Chime of Opening, " d6 10 * 20 + . ." charges" ;i
14	i: ." Chime of Hunger (cursed)" ;i
15	i: ." Cloak of Displacement, " d4 1 = if ." small" else ." man-sized" then ;i
19	i: ." Cloak of Elvenkind, " d10 1 = if ." small" else ." man-sized" then ;i
28	i: ." Cloak of Manta Ray" ;i
31	i: ." Cloak of Poisonousness (cursed)" ;i
	%table: cloakofprotection
	1 	i: 1 . ;i
	36 	i: 2 . ;i
	66	i: 3 . ;i
	86	i: 4 . ;i
	96	i: 5 . ;i
	;table
33	i: ." Cloak of Protection, +" cloakofprotection ;i

	%table: crystalball
	1	i: ;i
	51	i: ." , with clairaudience" ;i
	76	i: ." , with ESP" ;i
	91	i: ." , with telepathy" ;i
	;table
56	i: ." Crystal Ball (M)" crystalball ;i
61	i: ." Crystal Hypnosis ball (cursed) (M)" ;i
64	i: ." Cube of Frost Resistance" ;i
62	i: ." Cube of Force" ;i
66	i: ." Cubic Gate" ;i
68	i: ." Daern's Instant Fortress" ;i
70	i: ." Decanter of Endless Water" ;i
73	i: ." Deck of Many Things, " d4 1 = if 22 else 13 then . ." plaques" ;i
77	i: ." Drums of Deafening" ;i
80	i: ." Dust of Appearance" ;i
86	i: ." Dust of Disappearance" ;i
78	i: ." Drums of Panic" ;i
92	i: ." Dust of Sneezing and Choking" ;i

	%table: efreetibottle
	1	i: ." (insane)" ;i
	11	i: ." (3 wishes only)" ;i
	21	i: ;i
	;table
93	i: ." Efreeti Bottle" efreetibottle ;i
94	i: ." Eversmoking Bottle" ;i
95	i: ." Eyes of Charming (M)" ;i
96	i: ." Eyes of the Eagle" ;i
98	i: ." Eyes of Minute Seeing" ;i
100	i: ." Eyes of " d4 1 = if ." (Basilisk) " then ." Petrification" ;i
;table

%table: III.E.3

	%table: figurineofwonderouspower
	1	i: ." ebony fly" ;i
	16	i: ." golden lions" ;i
	31	i: ." ivory goats" ;i

		%table: marbleelephant
		1	i: ." Asiatic" ;i
		51	i: ." African" ;i
		91	i: ." Mammoth" ;i
		94	i: ." Mastodon" ;i
		;table
	41	i: ." marble elephant (" marbleelephant ." )" ;i
	56	i: ." obsidian steed" ;i
	66	i: ." onyx dog" ;i
	86	i: ." serpentine owl" ;i
	;table
01	i: ." Figurine of Wondrous Power - " figurineofwonderouspower ;i
16	i: ." Flask of Curses" ;i
17	i: ." Gauntlets of Dexterity" ;i
19	i: ." Gauntlets of Fumbling" ;i
21	i: ." Gauntlets of Ogre Power (C,F,T)" ;i
23	i: ." Gauntlets of Swimming and Climbing (C,F,T)" ;i
26	i: ." Gem of Brightness" ;i
27	i: ." Gem of Seeing" ;i
28	i: ." Girdle of " d10 1 = if ." Androgyny " else ." Femininity/Masculinity " then ." (C,F,T)" ;i

	%table: girdleofgiantstrength
	1	i: ." Hill" ;i
	31	i: ." Stone" ;i
	51	i: ." Frost" ;i
	71	i: ." Fire" ;i
	86	i: ." Cloud" ;i
	96	i: ." Storm" ;i
	;table
29	i: ." Girdle of " girdleofgiantstrength ."  Giant Strength (C,F,T)" ;i
30	i: ." Helm of Brilliance" ;i
31	i: ." Helm of Comprehending Languages & Reading Magic" ;i
36	i: ." Helm of Opposite Alignment" ;i
38	i: ." Helm of Telepathy" ;i
40	i: ." Helm of Teleportation" ;i
41	i: ." Helm of Underwater Action" ;i
46	i: ." Horn of Blasting" ;i
47	i: ." Horn of Bubbles" ;i
49	i: ." Horn of Collapsing" ;i
50	i: ." Horn of the Tritons (C,F)" ;i

	dtable: hornofvalhalla
	1	i: ." Silver Horn of Valhalla" ;i
	9	i: ." Brass Horn of Valhalla (C,F,T)" ;i
	16	i: ." Bronze Horn of Valhalla (C,F)" ;i
	19	i: ." Iron Horn of Valhalla (F)" ;i
	;table
54	i: d20 hornofvalhalla ;i
61	i: ." Horseshoes of Speed" ;i
64	i: ." Horseshoes of a Zephyr" ;i
66	i: ." Incense of Meditation (C), " 2d4 . ." pieces" ;i
71	i: ." Incense of Obsession (C), " 2d4 . ." pieces" ;i

private:
	dtable: iounshape
	1	i: ." rhomboid" ;i
	3	i: ." sphere" ;i
	7	i: ." prism" ;i
	10	i: ." ellipsoid" ;i
	12	i: ." spindle" ;i
	;table

	15 array iounseen

	: cleariouns  15 times 0  i iounseen ! iterate ;

	\ return current state, set state to true
	: iounmark? ( n -- flag)   iounseen ( addr ) dup @ -1 rot ! ;  

	dtable: iounstones
	1	i: ." pale blue rhomboid (+1 str)" ;i
	2	i: ." scarlet and blue sphere (+1 int)" ;i
	3	i: ." incandescent blue sphere (+1 wis)" ;i
	4	i: ." deep red sphere (+1 dex)" ;i
	5	i: ." pink rhomboid (+1 con)" ;i
	6	i: ." pink and green sphere (+1 cha)" ;i
	7	i: ." pale green prism (+1 level)" ;i
	8	i: ." clear spindle (food & water)" ;i
	9	i: ." iridescent spindle (air)" ;i
	10	i: ." pearly white spindle (1hp/turn regeneration)" ;i
	11	i: ." pale lavender ellipsoid (absorbs " d4 10 * . ." levels of up to 4th)" ;i
	12	i: ." lavender and green ellipsoid (absorbs " 2d4 10 * . ." levels of up to 8th)" ;i
	13	i: ." vibrant purple prism (stores " 2d6 . ." spell levels)" ;i
	14	i: ." dusty rose prism (+1 protection)" ;i
	15	i: ." dull grey " 14 d iounshape ."  (+10 psi str, max 50)" ;i
	;table

	: pickioun d20 dup 15 < if 
		  	   dup iounmark? if  ( n ) drop 15  then
	  	   then 
		   iounstones
	;
public: 
72	i: d10 dup 1 = if drop ." Ioun Stone, " d20 iounstones else
	       dup . ." Ioun Stones: "
	       cleariouns
	       times  pickioun ?., iterate
	   then
	;i

	dtable: instrumentofthebards
	1	i: ." Fochlucan Bandore" ;i
	6	i: ." Mac-Fuirmidh Cittern" ;i
	10	i: ." Doss Lute" ;i
	13	i: ." Canaith Mandolin" ;i
	16	i: ." Cli Lyre" ;i
	18	i: ." Anstruth Harp" ;i
	20	i: ." Ollamh Harp" ;i
	;table
73	i: ." Instrument of the Bards - " d20 instrumentofthebards ;i

	%table: ironflask
	1	i: ." empty" ;i
	51	i: ." air elemental" ;i
	55	i: ." demon, type 1-111" ;i
	57	i: ." demon, type IV-VI" ;i
	58	i: ." devil, lesser" ;i
	60	i: ." devil, greater" ;i
	61	i: ." diinni" ;i
	66	i: ." earth elemental" ;i
	70	i: ." efreeti" ;i
	73	i: ." fire elemental" ;i
	77	i: ." invisible stalker" ;i
	82	i: ." mezzodaemon" ;i
	84	i: ." night hag" ;i
	86	i: ." nycadaemon" ;i
	87	i: ." rakshasa" ;i
	90	i: ." salamander" ;i
	94	i: ." water elemental" ;i
	98	i: ." wind walker" ;i
	100	i: ." xorn" ;i
	;table
79	i: ." Iron Flask (" ironflask ." )" ;i
81	i: ." Javelin of Lightning (F) x" d4 1+ . ;i
86	i: ." Javelin of Piercing (F) x" 2d4 . ;i
91	i: ." Jewel of Attacks (cursed)" ;i
92	i: ." Jewel of Flawlessness, " d10 10 * . ." facets" ;i
93	i: ." Keoghtom's Ointment x" d3 . ;i
;table

%table: III.E.4
1	i: ." Libram of Gainful Conjuration (M)" ;i
2	i: ." Libram of Ineffable Damnation (M)" ;i
3	i: ." Libram of Silver Magic (M)" ;i
4	i: ." Lyre of Building" ;i
5	i: ." Manual of Bodily Health" ;i
6	i: ." Manual of Gainful Exercise" ;i

	dtable: manualofgolems
	1	i: ." Clay (C)" ;i
	6	i: ." Flesh (M)" ;i
	18	i: ." Iron (M)" ;i
	19	i: ." Stone (M)" ;i
	;table
7	i: ." Manual of Golems - " d20 manualofgolems ;i
8	i: ." Manual of Puissant Skill at Arms (F)" ;i
9	i: ." Manual of Quickness of Action" ;i
10	i: ." Manual of Stealthy Pilfering (T)" ;i
11	i: ." Mattock of the Titans (F)" ;i
12	i: ." Maul of the Titans" ;i

	dtable: medallionofesp
	1	i: ." 30' range" ;i
	16	i: ." 30' range with empathy" ;i
	19	i: ." 60' range" ;i
	20	i: ." 90' range" ;i
	;table
13	i: ." Medallion of ESP, " d20 medallionofesp ;i
16	i: ." Medallion of Thought Projection" ;i
18	i: ." Mirror of Life Trapping, " d6 12 + . ." compartments (M)" ;i
19	i: ." Mirror of Mental Prowess" ;i
20	i: ." Mirror of Opposition" ;i
21	i: ." Necklace of Adaptation" ;i

	dtable: necklaceofmissiles
	1	i: ." 3 missiles: 3d6 x2, 5d6" ;i
	5	i: ." 5 missiles: 2d6 x2, 4d6 x2, 6d6" ;i
	9	i: ." 7 missiles: 3d6 x4, 5d6 x2, 7d6" ;i
	13      i: ." 9 missiles: 2d6 x4, 4d6 x2, 6d6 x2, 8d6" ;i
	17      i: ." 7 missiles: 3d6 x2, 5d6 x2, 7d6 x2, 9d6" ;i
	19      i: ." 9 missiles: 4d6 x4, 6d6 x2, 8d6 x2, 10d6" ;i
	20      i: ." 9 missiles: 3d6 x2, 5d6 x2, 7d6 x2, 9d6 x2, 11d6" ;i
	;table
24	i: ." Necklace of Missiles, " d20 necklaceofmissiles ;i

	dtable: specialprayerbeads
	1	i: ." bead of atonement" ;i
	6	i: ." bead of blessing" ;i
	11	i: ." bead of curing" ;i
	16	i: ." bead of karma" ;i
	18	i: ." bead of summoning" ;i
	19	i: ." bead of wind walking" ;i
	;table

28	i: ." Necklace of Prayer Beads (C): " 24 d6 + .
	   d10 6 > if ." fancy stones, " else ." semi-precious stones, " then
	   d4 2 + dup . ." special stones (" 
	   times d20 specialprayerbeads ?., iterate
	   ." )"
	;i
34	i: ." Necklace of Strangulation" ;i
36	i: ." Net of Entrapment (C,F,T)" ;i
39	i: ." Net of Snaring (C,F,T)" ;i
43	i: ." Nolzur's Marvelous Pigments, " d4 . ." pots" ;i

	%table: pearlofpower
	1	i: ." 1st" ;i
	26	i: ." 2nd" ;i
	46	i: ." 3rd" ;i
	61	i: ." 4th" ;i
	76	i: ." 5th" ;i
	86	i: ." 6th" ;i
	93	i: ." 7th" ;i
	97	i: ." 8th" ;i
	99	i: ." 9th" ;i
	100	i: ." 2 spells levels " d6 . ." and " d6 . ;i
	;table
45	i: ." Pearl of Power, "
	   d20 1 = if ." cursed, " then  pearlofpower
	   ."  (M)"
	;i
47	i: ." Pearl of Wisdom (C)" d20 1 = if ." , cursed" then ;i
49	i: ." Periapt of Foul Rotting" ;i
51	i: ." Periapt of Health" ;i

	dtable: periaptagainspoison
	1	i: 1 . ;i
	9	i: 2 . ;i
	15	i: 3 . ;i
	19	i: 4 . ;i
	;table
54	i: ." Periapt of Proof Against Poison, +" d20 periaptagainspoison ;i
61	i: ." Periapt of Wound Closure" ;i
65	i: ." Phylactery of Faithfulness (C)" ;i
71	i: ." Phylactery of Long Years (C)" ;i
75	i: ." Phylactery of Monstrous Attention (C)" ;i
77	i: ." Pipes of the Sewers" ;i
85	i: ." Portable Hole" ;i

	dtable: quallsfeathertoken
	1      i: ." Anchor" ;i
	5      i: ." Bird" ;i
	8      i: ." Fan" ;i
	11     i: ." Swan Boat" ;i
	14     i: ." Tree" ;i
	19     i: ." Whip" ;i
	;table
86	i: ." Quaal's Feather Token, " d20 quallsfeathertoken ;i
;table

%table: III.E.5
1	i: ." Misc magic table E.5" ;i
;table

%table: III.E.6
1	i: ." Misc magic table E.6" ;i
;table

%table: III.E.7
1	i: ." Misc magic table E.7" ;i
;table


%table: misc.magic
1	i: III.E.1 ;i
15	i: III.E.2 ;i
29	i: III.E.3 ;i
43	i: III.E.4 ;i
57	i: III.E.5 ;i
71	i: III.E.6 ;i
86	i: III.E.7 ;i
;table

private:

defer map-details

%table: III.magic
1	i: potions ;i
21	i: scrolls ;i
36	i: rings ;i
41	i: rod/staff/wand ;i
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
%table: III.E.special
1	i: ." Axe of the Dwarvish Lords" ;i
2	i: ." Baba Yaga’s Hut" ;i
3	i: ." Codex of the Infinite Planes" ;i

	dtable: crownofmight
	1	i: ." Evil" ;i
	7	i: ." Good" ;i
	15	i: ." Neutral" ;i
	;table
5	i: ." Crown of Might, " d20 crownofmight ;i
21	i: ." Crystal of the Ebon Flame" ;i
22	i: ." Cup and Talisman of Al’Akbar" ;i
23	i: ." Eye of Vecna" ;i
25	i: ." Hand of Vecna" ;i
26	i: ." Heward’s Mystical Organ" ;i
27	i: ." Horn of Change" ;i
28	i: ." Invulnerable Coat of Arnd" ;i
30	i: ." Iron Flask of Tuerny the Merciless" ;i
32	i: ." Jacinth of Inestimable Beauty" ;i
33	i: ." Johydee‘s Mask" ;i
34	i: ." Kuroth’s Quill" ;i
36	i: ." Mace of Cuthbert" ;i
38	i: ." Machine of Lum the Mad" ;i
39	i: ." Mighty Servant of Leuk-O" ;i

	dtable: orbofdragonkind
	1	i: ." Hatchling " ;i
	2	i: ." Wyrmkin" ;i
	3	i: ." Dragonette" ;i
	4	i: ." Dragon" ;i
	5	i: ." Great Serpent" ;i
	6	i: ." Firedrake" ;i
	7	i: ." Elder Wyrm" ;i
	8	i: ." Eternal Grand Dragon" ;i
	;table
41	i: ." Orb of the Dragonkind, Orb of the " d8 orbofdragonkind ;i

48	i: ." Orb of Might, " d20 crownofmight ;i
64	i: ." Queen Ehlissa’s Marvelous Nightingale" ;i
65	i: ." Recorder of Ye’Cind" ;i
67	i: ." Ring of Gaxx" ;i
69	i: ." Rod of Seven Parts, part " 7 d .. ;i
75	i: ." Sceptre of Might, " d20 crownofmight ;i
92	i: ." Sword of Kas" ;i
93	i: ." Teeth of Dahlver-Nar, tooth #" 32 d .. ;i
99	i: ." Throne of the Gods" ;i
100	i: ." Wand of Orcus" ;i
;table

%table: III.E.1
01	i: ." Alchemy Jug" ;i
03	i: ." Amulet of Inescapable Location (cursed)" ;i
05	i: ." Amulet of Life Protection" ;i
06	i: ." Amulet of the Planes" ;i
08	i: ." Amulet of Proof Against Detection and Location" ;i
12	i: ." Apparatus of Kwalish" ;i
14	i: ." Arrow of Direction" ;i
17	i: III.E.special ;i
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

	15 array iounseen 15 cells allot

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
45	i: ." Pearl of Power (M), "
	   d20 1 = if ." cursed, " then  pearlofpower
	   ."  (M)"
	;i
47	i: ." Pearl of Wisdom (C)" d20 1 = if ." , cursed" then ;i
49	i: ." Periapt of Foul Rotting" ;i
51	i: ." Periapt of Health" ;i

	dtable: periaptagainspoison
	1	i: 1 .. ;i
	9	i: 2 .. ;i
	15	i: 3 .. ;i
	19	i: 4 .. ;i
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
	%table: robeofarchmagi
	1	i: ." white" ;i
	46	i: ." grey" ;i
	76	i: ." black" ;i
	;table
1	i: ." Robe of the Archmagi (M), " robeofarchmagi ;i
2	i: ." Robe of Blending" ;i
9	i: ." Robe of Eyes (M)" ;i
10	i: ." Robe of Powerlessness (M)" ;i
11	i: ." Robe of Scintillating Colors (C,M)" ;i

	%table: robeofusefulitems
	1	i: ." bag of 100gp" ;i
	9	i: ." silver coffer ½'x½'x1' (500gp value)" ;i
	16	i: ." door, iron" ;i
	23	i: ." 10 gems, 100gp each" ;i
	31	i: ." ladder, wooden, 24' long" ;i
	45	i: ." mule with saddle bags" ;i
	52	i: ." pit, 10'x10'x10'" ;i
	60	i: ." potion of extra healing" ;i
	69	i: ." rowboat, 12' long" ;i
	76	i: 1 spellscroll d6 d6 ;i
	84	i: ." war dogs, pair" ;i
	91	i: ." window, 2'x4', max 2' deep" ;i
	97	i: robeofusefulitems .; robeofusefulitems ;i
	;table
12	i: ." Robe of Useful Items (M): "
	   4d4 times robeofusefulitems ?.; iterate
	;i
20	i: ." Rope of Climbing" ;i
26	i: ." Rope of Constriction" ;i
28	i: ." Rope of Entanglement" ;i
32	i: ." Rug of Smothering" ;i
33	i: ." Rug of Welcome (M)" ;i
34	i: ." Saw of Mighty Cutting (F)" ;i
35	i: ." Scarab of Death" ;i
36	i: ." Scarab of Enraging Enemies, " 18 d6 + . ." charges" ;i
39	i: ." Scarab of Insainty, " 8 d8 + . ." charges" ;i
41	i: ." Scarab of Protection"
	   d20 1 = if ." , cursed" d10 2 < if ." , 12 charges or 24 if uncursed" else ." , 12 charges" then
	   else ." , 12 charges" then
	;i
47	i: ." Spade of Colossal Excavation (F)" ;i
48	i: ." Sphere of Annihilation (M)" ;i
49	i: ." Stone of Controlling Earth Elementals" ;i
51	i: ." Stone of Good Luck (Luckstone)" ;i
53	i: ." Stone of Weight (Loadstone)" ;i
55	i: ." Talisman of Pure Good (C)" ;i
58	i: ." Talisman of the Sphere (M)" ;i
59	i: ." Talisman of Ultimate Evil (C)" ;i
61	i: ." Talisman of Zagy" ;i
67	i: ." Tome of Clear Thought" ;i
68	i: ." Tome of Leadership and Influence" ;i
69	i: ." Tome of Understanding" ;i
70	i: ." Trident of Fish Command (C,F,T), " 16 d4 + . ." charges" ;i
77	i: ." Trident of Submission (F)" 16 d4 + . ." charges"  ;i
79	i: ." Trident of Warning (C,F,T)"  18 d6 + . ." charges" ;i
84	i: ." Trident of Yearning (cursed)" ;i
86	i: ." Vacuous Grimoire" ;i
88	i: ." Well of Many Worlds" ;i
91	i: ." Wings of Flying" ;i
;table

%table: III.E.6
	%table: amuletversusundead
	1	i: 5 .. ;i
	31	i: 6 .. ;i
	56	i: 7 .. ;i
	76	i: 8 .. ;i
	91	i: 9 .. ;i
	;table
01	i: ." Amulet Versus Undead, " amuletversusundead ." th level" ;i
05	i: ." Anything Item" ;i
06	i: ." Beads of Force (x" d4 4 + .. ." )" ;i
08	i: ." Boccob’s Blessed Book (M)" ;i
15	i: ." Boots of the North" ;i

	lookup: bootsofvariedtracks
	1	i: ." basilisk" ;i	9	i: ." horse" ;i
	2	i: ." bear" ;i		10	i: d2 1 = if ." lion" else ." giant lynx" then ;i
	3	i: ." boar" ;i		11	i: ." mule" ;i
	4	i: ." bull" ;i		12	i: ." rabbit" ;i
	5	i: ." camel" ;i		13	i: ." stag" ;i
	6	i: ." dog" ;i		14	i: d2 1 = if ." tiger" else ." leopard" then ;i
	7	i: ." giant, hill" ;i	15	i: ." wolf" ;i
	8	i: ." goat" ;i	   	16	i: ." wyvern" ;i
	;table
	: picktrack ( flags -- flags)
	  begin
		16 d tuck  ( n f n )
		bt+set while  \ already taken, so scrap and try again
		       nip
 	  repeat
	  swap bootsofvariedtracks
	;
	: variedtracks ( n -- )
	  0 swap times
	    picktrack ?.,
	  iterate drop
	;
17	i: ." Boots of Varied Tracks: " 4 variedtracks ;i

	lookup: wingedboots
	1	i: ." 15" " ." , class A" ;i
	2	i: ." 18" " ." , class B" ;i
	3	i: ." 21" " ." , class C" ;i
	4	i: ." 24" " ." , class D" ;i
	;table
20	i: ." Boots, Winged (" d4 wingedboots ." )" ;i
21	i: ." Bracers of Archery (F)" ;i
25	i: ." Bracers of Brachiation" ;i
27	i: ." Chime of Interruption" ;i
29	i: ." Cloak of Arachnida" ;i
31	i: ." Cloak of the Bat" ;i
35	i: ." Cyclocone (M)" ;i

	%table: dartofhornets
	1	i: ." +1 to-hit x" 5d4 .. ;i
	41	i: ." +2 to-hit x" 4d4 .. ;i
	71	i: ." +3 to-hit x" 3d4 .. ;i
	91	i: ." +4 to-hit x" 2d4 .. ;i
	;table
37	i: ." Dart of the Hornets’ Nest, " dartofhornets ;i
41	i: ." Deck of Illusions" ;i
43	i: ." Dicerion of Light & Darkness (C)" ;i
45	i: ." Dust of Dryness, " 10 d10 + . ." pinches" ;i
48	i: ." Dust of Illusion, " 10 d10 + . ." pinches"  ;i
51	i: ." Dust of Tracelessness, " 12 d12 + . ." pinches"  ;i

	lookup: eggofdesire
	1	i: ." Black" ;i
	2	i: ." Bone" ;i
	3	i: ." Crystal" ;i
	4	i: ." Golden" ;i
	5	i: ." Scarlet" ;i
	;table
55	i: ." Egg of Desire, " 5 d eggofdesire ;i
57	i: ." Egg of Reason (" d10 7 < if ." Int)" else ." Wis)" then ;i
61	i: ." Egg of Shattering" ;i
63	i: ." Gem of Insight" ;i
66	i: ." Girdle of Dwarvenkind" ;i
69	i: ." Girdle of Many Pouches" ;i
77	i: ." Gloves of Missile Snaring" ;i
80	i: ." Gloves of Thievery" ;i
84	i: ." Hat of Difference" ;i
89	i: ." Hat of Disguise" ;i
96	i: ." Hat of Stupidity" ;i
;table

%table: III.E.7
1	i: ." Heward’s Handy Haversack" ;i
6	i: ." Horn of Fog" ;i
11	i: ." Horn of Goodness (Evil)" ;i
13	i: ." Iron Bands of Bilarro" ;i
15	i: ." Lens of Detection" ;i
19	i: ." Lens of Ultravision" ;i
22	i: ." Mantle of Celestian" ;i
24	i: ." Murlynd’s Spoon" ;i
28	i: ." Pearl of the Sirines" ;i
30	i: ." Philosopher’s Stone" ;i
32	i: ." Pouch of Accessibility" ;i
38	i: ." Prison of Zagyg (M)" ;i
39	i: ." Quiver of Ehlonna" ;i
41	i: ." Robe of Stars (M)" ;i
43	i: ." Robe of Vermin (M)" ;i

	%table: scarabvsgolems
	1	i: ." flesh" ;i
	31	i: ." clay" ;i
	56	i: ." stone" ;i
	76	i: ." iron" ;i
	86	i: ." flesh, clay, and wood" ;i
	96	i: ." any golem" ;i
	;table
49	i: ." Scarab Versus Golems (" scarabvsgolems ." )" ;i
51	i: ." Shadow Lanthorn" ;i
55	i: ." Sheet of Smallness" ;i
58	i: ." Shoes of Fharlanghn" ;i
60	i: ." Slippers of Kicking" ;i
65	i: ." Slippers of Spider Climbing" ;i
71	i: ." Sovereign Glue, " d10 . ." oz" ;i
73	i: ." Spoon of Stirring" ;i
78	i: ." Stone Horse, " d2 1 = if ." courser" else ." destrier" then ;i
82	i: ." Ultimate Solution" ;i
85	i: ." Wind Fan" ;i
89	i: ." Zagyg’s Flowing Flagon" ;i
	dtable: zagygsspellcomponent
	1	i: 2 ;i
	4	i: 3 ;i
	7	i: 4 ;i
	11	i: 5 ;i
	15	i: 6 ;i
	20	i: 7 ;i
	;table 
93	i: ." Zagyg’s Spell Component (" d20 zagygsspellcomponent . ." times/day)" ;i
;table
%table: III.A
	dtable: animalcontrolpotion
	1	i: ." mammal/marsupial" ;i
	5	i: ." avian" ;i
	9	i: ." reptile/amphibian" ;i
	13	i: ." fish" ;i
	16	i: ." mammal/marsupial/avian" ;i
	18	i: ." reptile/amphibian/fish" ;i
	20	i: ." all" ;i
	;table	
01	i: pot ." Animal Control (" d10 animalcontrolpotion ." )" ;i

04	i: pot ." Clairaudience" ;i
07	i: pot ." Clairvoyance" ;i
10	i: pot ." Climbing" ;i
13	i: pot ." Delusion (cursed)" ;i
16	i: pot ." Diminution" ;i

	dtable: dragoncontolpotion
	1	i: ." white" ;i
	3	i: ." black" ;i
	5	i: ." green" ;i
	8	i: ." blue" ;i
	10	i: ." red" ;i
	11	i: ." brass" ;i
	13	i: ." copper" ;i
	15	i: ." bronze" ;i
	16	i: ." silver" ;i
	17	i: ." gold" ;i
	18	i: ." evil, non-unique" ;i
	20	i: ." good, non-unique" ;i
	;table
19	i: pot ." Dragon Control (" d20 dragoncontolpotion ." )" ;i
21    	i: pot ." ESP " ;i
24	i: pot ." Extra-Healing" ;i
27	i: pot ." Fire Resistance" ;i
30	i: pot ." Flying" ;i
33	i: pot ." Gaseous Form" ;i

	dtable: giantcontrolpotion
	1	i: ." hill" ;i
	6	i: ." stone" ;i
	10	i: ." frost" ;i
	14	i: ." fire" ;i
	18	i: ." cloud" ;i
	20	i: ." storm" ;i
	;table
35	i: pot ." Giant Control (" d20 giantcontrolpotion ." )" ;i

	dtable: giantstrengthpotion
	1	i: ." hill" ;i
	7	i: ." stone" ;i
	11	i: ." frost" ;i
	15	i: ." fire" ;i
	18	i: ." cloud" ;i
	20	i: ." storm" ;i
	;table
37	i: pot ." Giant Strength (F) (" d20 giantstrengthpotion ." )" ;i
40	i: pot ." Growth" ;i
42	i: pot ." Healing" ;i
48	i: pot ." Heroism (F)" ;i

	dtable: humancontrolpotion
	1	i: ." dwarves" ;i
	3	i: ." elves/half-elves" ;i
	5	i: ." gnomes" ;i
	7	i: ." halflings" ;i
	9	i: ." half-orcs" ;i
	11	i: ." humans" ;i
	17	i: ." humanoids" ;i
	20	i: ." elves, half-elves, and humans" ;i
	;table
50	i: pot ." Human Control (" d20 humancontrolpotion ." )" ;i
52	i: pot ." Invisibility" ;i
55	i: pot ." Invulnerability (F)" ;i
58	i: pot ." Levitation" ;i
61	i: pot ." Longevity" ;i
64	i: ." Oil of Etherealness" ;i
67	i: ." Oil of Slipperiness" ;i
70	i: ." Philter of Love" ;i
73	i: ." Philter of Persuasiveness" ;i
76	i: pot ." Plant Control" ;i
79	i: pot ." Polymorph (self)" ;i

	dtable: poisonpotion
	1	i: ."  (XXXX, -4 to save)" ;i
	2	i: ."  (XXX, -3 to save)" ;i
	3	i: ."  (XX, -2 to save)" ;i
	4	i: ."  (X, -1 to save)" ;i
	5	i: ;i
	7	i: ."  (B, +1 to save)" ;i
	8	i: ."  (C, +2 to save)" ;i
	9	i: ."  (D, +3 to save)" ;i
	10	i: ."  (E, +4 to save)" ;i
	;table
82	i: ." Potion of Poison" d10 poisonpotion ;i
85	i: pot ." Speed" ;i
88	i: pot ." Super-Heroism (F)" ;i
91	i: pot ." Sweet Water" ;i
94	i: pot ." Treasure Finding" ;i

	$tab: undeadcontrolpotion
	$ ""
	$ "ghasts"
	$ "ghosts"
	$ "ghouls"
	$ "shadows"
	$ "skeletons"
	$ "spectres"
	$ "wights"
	$ "wraiths"
	$ "vampires"
	$ "zombies"
	;$tab	
97 	i: pot ." Undead Control (" d10 undeadcontrolpotion type ." )" ;i
98	i: pot ." Water Breathing" ;i
;table

%table: III.A.2
01	i: ." Elixir of Health" ;i
06	i: ." Elixir of Life" ;i
16	i: ." Elixir of Madness (cursed)" ;i
21	i: ." Elixir of Youth" ;i
26	i: pot ." Fire Breath" ;i
31	i: ." Oil of Acid Resistance" ;i
36	i: ." Oil of Disenchantment" ;i

	dtable: oilofelementalinvun
	1	i: ." air" ;i
	2	i: ." earth" ;i
	3	i: ." fire" ;i
	4	i: ." water" ;i
	;table
41	i: ." Oil of Elemental Invulnerability (" d4 oilofelementalinvun ." )" ;i
46	i: ." Oil of Fiery Burning" ;i
50	i: ." Oil of Fumbling (cursed)" ;i
56	i: ." Oil of Impact" ;i

	dtable: oilofsharpness
	1      i: ." +1" ;i
	3      i: ." +2" ;i
	6      i: ." +3" ;i
	12     i: ." +4" ;i
	17     i: ." +5" ;i
	20     i: ." +6" ;i
	;table
61	i: ." Oil of Sharpness (" d20 oilofsharpness ." )" ;i
66	i: ." Oil of Timelessness" ;i
71	i: ." Philter of Beauty" ;i
76	i: ." Philter of Glibness" ;i
81	i: ." Philter of Stammering & Stuttering (cursed)" ;i
86	i: pot ." Rainbow Hues" ;i
91	i: pot ." Ventriloquism" ;i
96	i: pot ." Vitality" ;i
;table

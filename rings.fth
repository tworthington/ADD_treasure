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

	: 7-levelsspellstoring  ( # xp )
	  swap times  ( xp )
	  	  d6 dup 6 = if drop d4 then
		  dup ." L" .. .:
		  over execute ?.;
               iterate drop
	;

	: 9-levelsspellstoring  ( # xp )
	  swap times  ( xp )
	  	  d8 dup 8 = if drop d6 then
		  dup ." L" .. .:
		  over execute ?.;
               iterate drop
	;

	: ringofspellstoring ( # -- )
	  ." spell storing (" 
	  d100 71 < if  
	        d10 1 = if ." illusionist) - " ['] illspell 7-levelsspellstoring
		      	else ." magic-user) - " ['] muspell 9-levelsspellstoring
			then
          else  \ cerical
          	d4 1 = if ." druidic) - " ['] druidspell 7-levelsspellstoring
		       else ." clerical) - " ['] clericspell 7-levelsspellstoring
		       then
	  then
	;
64	i: 
	  d4 1+ ringofspellstoring
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

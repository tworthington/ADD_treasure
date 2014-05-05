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
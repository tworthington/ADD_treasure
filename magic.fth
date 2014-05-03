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

private:

: III.magic
  s" Random Magic " $+
;

\ GEMS

: ,$
  [char] , char$+
  bl$
;

dtable: moneytreasure

1  i: 2d4 1000s s>$  s" cp, " $+
      d4 1+ 10 * 1000s s>$ s" sp" $+ ;i
3  i: 5d6 1000s s>$  s" ep" $+ ;i
6  i: 3d6 1000s s>$  s" gp" $+ ;i
11 i: 5d4 100 * s>$  s" pp" $+ ;i
13 i: d10 10 * dup s>$ s"  gems:" $+ nl$ .gems nl$ ;i
16 i: 5 10 roll  dup s>$ s"  jewels:" $+ nl$ .jewels ;i
18 i: 17 d  moneytreasure ,$  17 d  moneytreasure ,$ ;i
19 i: 17 d  moneytreasure ,$  17 d  moneytreasure ,$ 17 d  moneytreasure ;i
20 i: 1 moneytreasure ,$
      3 moneytreasure ,$
      6 moneytreasure ,$
      11 moneytreasure ,$
      13 moneytreasure ,$
      16 moneytreasure  ;i

;table

dtable: II.map
	1   i: s" False map to area" $+  ;i
	6   i: s" Map to monetary treasure " $+
	       d20 moneytreasure ;i
	71  i: s" Map to magic treasure" $+ ;i
	91  i: s" Map to combined hoard" $+ ;i
;table

dtable: distance
1      i: s"  located in labyrinth of caves found in/near lair, " $+ ;i
21     i: s"  located outdoors, " $+
       	  d4 4 + s>$ s"  miles distant, " $+ ;i
61     i: s"  located outdoors, " $+
       	  d4 10 * s>$ s"  miles distant, " $+ ;i
91     i: s"  located outdoors, " $+
       	  5 10 roll 10 * s>$ s"  miles distant, " $+ ;i
;table

dtable: location
       1      i: s" burried and unguarded" $+ ;i
       11     i: s" hidden in water" $+ ;i
       21     i: s" guarded in a lair" $+ ;i
       71     i: s" somewhere in a ruin" $+ ;i
       81     i: s" in a burial crypt" $+ ;i
       91     i: s" secreted in a town" $+ ;i
;table

: map-details
  d100 distance
  d100 location
;

dtable: I.map/magic
1 i: d100 II.map
     map-details ;i
11 i: III.magic ;i
;table

36 base !

lookup: magictype
A i:  3 times  I.map/magic  iterate  ;i

B i: s" b magic " $+ ;i

C i: 2 times  I.map/magic  iterate ;i

D i: s" d magic " $+ ;i
E i: s" e magic " $+ ;i
F i: s" f magic " $+ ;i
G i: s" g magic " $+ ;i
H i: s" h magic " $+ ;i

I i:  I.map/magic ;i

J i: s" j magic " $+ ;i
K i: s" k magic " $+ ;i
L i: s" l magic " $+ ;i
M i: s" m magic " $+ ;i
N i: s" n magic " $+ ;i
O i: s" o magic " $+ ;i
P i: s" p magic " $+ ;i
Q i: s" q magic " $+ ;i
R i: s" r magic " $+ ;i

S i: s" s magic " $+ ;i
T i: s" t magic " $+ ;i
U i: s" u magic " $+ ;i
V i: s" v magic " $+ ;i

W i: d100 II.map ;i

X i: s" x magic " $+ ;i
Y i: s" y magic " $+ ;i

Z i: 3 times  I.map/magic  iterate   ;i

;table
decimal

public:

: .magic 
  26 0 do
     i magictreasure @ 
     ?dup if
        times
	     	j 10 + magictype
	iterate
     then
  loop
;

;module
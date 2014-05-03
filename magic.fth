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
  ." Random Magic "
;

\ GEMS

: ,$
  [char] , emit
  space
;

dtable: moneytreasure

1  i: 2d4 1000s ..  ." cp, "
      d4 1+ 10 * 1000s .. ." sp" ;i
3  i: 5d6 1000s ..  ." ep" ;i
6  i: 3d6 1000s ..  ." gp" ;i
11 i: 5d4 100 * ..  ." pp" ;i
13 i: d10 10 * dup .. ."  gems:" cr .gems cr ;i
16 i: 5 10 roll  dup .. ."  jewels:" cr .jewels ;i
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
	1   i: ." False map to area"  ;i
	6   i: ." Map to monetary treasure "
	       d20 moneytreasure ;i
	71  i: ." Map to magic treasure" ;i
	91  i: ." Map to combined hoard" ;i
;table

dtable: distance
1      i: ."  located in labyrinth of caves found in/near lair, " ;i
21     i: ."  located outdoors, "
       	  d4 4 + .. ."  miles distant, " ;i
61     i: ."  located outdoors, "
       	  d4 10 * .. ."  miles distant, " ;i
91     i: ."  located outdoors, "
       	  5 10 roll 10 * .. ."  miles distant, " ;i
;table

dtable: location
       1      i: ." burried and unguarded" ;i
       11     i: ." hidden in water" ;i
       21     i: ." in a lair with guard" ;i
       71     i: ." somewhere in a ruin" ;i
       81     i: ." in a burial crypt" ;i
       91     i: ." secreted in a town" ;i
;table

: map-details
  d100 distance
  d100 location cr
;

dtable: I.map/magic
1 i: d100 II.map
     map-details ;i

11 i: III.magic ;i

;table

36 base !

lookup: magictype
A i:  3 times  I.map/magic  iterate  ;i

B i: ." b magic " ;i

C i: 2 times  I.map/magic  iterate ;i

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

W i: d100 II.map ;i

X i: ." x magic " ;i
Y i: ." y magic " ;i

Z i: 3 times  I.map/magic  iterate   ;i

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
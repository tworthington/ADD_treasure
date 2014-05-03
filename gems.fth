module: GEMS

: gp ( gp -- sp ) 20 * ;
: gp, gp , ;

: .gpsp ( sp -- )
  20 /mod ( sp gp)
  ?dup if s>d <# #s #> type ." gp" then
  ?dup if s>d <# #s #> type ." sp" then
;

create values ( sp )
1 , 5 , 10 , 20 , 5 gp, 
10 gp, 50 gp, 100 gp, 500 gp, 1000 gp, 5000 gp,
10000 gp, 25000 gp, 50000 gp, 100000 gp, 250000 gp, 500000 gp, 1000000 gp,


public:
$tab: gemtype
      $ "Dummy" $ "Dummy" $ "Dummy" $ "Dummy" $ "Dummy"
      $ "Ornimental stone"
      $ "Semi-precious stone"
      $ "Fancy stone"
      $ "Fancy precious stone"
      $ "Gem stone"
      $ "Jewel stone"
;$tab

private:

5 constant ornimental
6 constant semi-precious
7 constant fancy
8 constant fancy+
9 constant gemstone
10 constant gemstone+

17 constant maxval

: base+ ( n1 modifier -- n2)
  + 0 max
  maxval min
;

: base++  1 base+ ;
: base-- -1 base+ ;

: base ( -- n )
  d100
  dup 26 < if drop ornimental exit then
  dup 51 < if drop semi-precious exit then
  dup 71 < if drop fancy exit then
  dup 91 < if drop fancy+ exit then
  100 <	   if gemstone exit then
  gemstone+
;

: base>value ( n -- value)
  cells values + @
;

: doublebase ( n -- value)
  base>value 2* ;

\ is n >= l AND =< h ?
: >=< ( n l h -- flag)
  rot tuck ( l n h n )
  1- >     ( l n fh )
  -rot     ( fh l n )
  1+ <
  and
;

\ If going down in value, maximum of 5 shifts
\ with appraise having started with one, hence "4"
: poor ( base depth -- value)
  tuck 4 > if
        base>value 
  else
	9 d 1+  >r
  	r@ 2 = if doublebase then
	r@ 3 = if base>value d6 10 * 100 + 100 */ then
	r@ 4 8 >=<  if  base>value then
	r@ 9 = if base>value d4 -10 * 100 + 100 */ then
	r> 10 = if base-- over 1+ recurse then
  then
  nip
;

\ maximum of 7 boosts, as above
: good ( base depth -- value)
  tuck 6 > if
       base>value
  else
	d8  >r
	r@ 1 = if base++ over 1+ recurse then
	r@ 2 = if doublebase then
	r@ 3 = if base>value d6 10 * 100 + 100 */ then
	r> 3 > if base>value then
  then
  nip
;

: appraise ( base -- base value)
  dup d10 >r 
  r@ 1 = if base++ 1 good then
  r@ 2 = if doublebase then
  r@ 3 = if base>value  d6 10 * 100 + 100  */ then  \ +10-60%
  r@ 4 8 >=< if base>value then
  r@ 9 = if base>value  d4 -10 * 100 + 100  */ then \ -10-40%
  r> 10 = if base-- 1 poor then
;

public:

: newgem ( -- base value)
  base appraise
;

: .gems ( n -- )
  times
      newgem
      swap gemtype $+ bl char$+
      20 /mod ?dup  if  s>$ s" gp " $+  then
      ?dup  if s>$  s" sp " $+  then
      nl$
   iterate
;

private:

lookup: jval ( n -- value)
	1 i: d10 100 * ;i
	2 i: 2d6 100 * ;i
	3 i: 3d6 100 * ;i
	4 i: 5 6 roll 100 * ;i
	5 i: d6 1000 * ;i
	6 i: 2d4 1000 * ;i
	7 i: 2d6 1000 * ;i
;table

lookup: jade,coral,plat
	1 i: s" jade" ;i
	2 i: s" coral" ;i
	3 i: s" platinum" ;i
;table

lookup: jtext ( n -- caddr len)
	1 i: d6 4 < if s" ivory" else s" wrought silver" then ;i
	2 i: s" wrought silver and gold" ;i
	3 i: s" wrought gold" ;i
	4 i: d3 jade,coral,plat ;i
	5 i: s" silver with gems" ;i
	6 i: s" gold with gems" ;i
	7 i: s" platinum with gems" ;i
;table

8 array jmax
      0 , 1000 , 1200 , 1800 , 3000 , 6000 , 8000 , 12000 ,

dtable: jbase
	1   i: 1 ;i
	11  i: 2 ;i
	21  i: 3 ;i
	41  i: 4 ;i
	51  i: 5 ;i
	71  i: 6 ;i
	91  i: 7 ;i
;table

\ true if item is already max value and
\ so needs to go up one level
: improve? ( base value -- base value flag)
  over jmax @ over =
;

: appraise ( base1 -- base2 value )
  dup
  jval  ( base value )
  d10 1 = if s" + " $+
      improve? if
      	drop 1+ 7 min recurse
      else
	drop dup jmax @
      then
  then
;

: boostgem ( -- bonus )
  5000
  begin ( bonus )
  	s" ! " $+
  	dup 640000 <  d6 1 = and
	while 2*
  repeat
;

: gems? ( value base -- value2 flag)
  5 < if
    0
  else
    d8 1 = if
       boostgem +
       -1
    else
	0
    then
  then
;

: jewel ( -- base value gem?)
  d100 jbase  ( base )
  appraise  ( base value )
  over gems?
;

: test 10 times jewel if ." exceptional " then . jtext type cr iterate ;

public:
: .jewels ( n -- )
  times
	jewel
	-rot s>$ s" gp, " $+
	jtext $+ ( gem?)
	if s"  *exceptional gem*" $+ then
	nl$
  iterate
;

;module

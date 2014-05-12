#! /usr/local/bin/forth

decimal

: ['] ' state @ if lit then ; immediate

: $delimit
  char parse   ( caddr len)
;

: digression ( <word> <char>file<char> -- )
  bl word find nip
  $delimit     ( flag caddr len)
  rot if  2drop  else included then
;

: ." postpone s" postpone type ; immediate

: .' [char] ' parse
  state @ if postpone 2literal then postpone type
; immediate

: $constant ( addr len <name> -- )
  create
        dup ,  here swap dup 1+ allot zmove
  does>
        count
;

\ bit test and set/clear, b=bitflags, n=bit to test

: btest ( b n -- flag)  1 swap lshift and 0<> ;

: bt+set ( b n -- b flag)
  2dup btest -rot ( f b n )
  1 swap lshift or swap
;

: bt+clear ( b n b flag -- b flag)
  2dup btest -rot
  1 swap lshift not and swap
;

: binary 2 base ! ;

create $pad  65540 allot
: <$  ( -- )
  0 $pad !
;

: $>  $pad count ;

\ Will this fit into $pad?
: $check ( caddr len -- caddr len|throw -1)
  dup $pad @ + 65535 not and if -1 throw then
;

: $+ ( caddr len --)
  $check
  dup>r
  $pad count +
  swap move
  r> $pad +!
;

: char$+  ( char -- )
  pad !
  pad 1 $+
;

: s>$
  s>d <# #s #> $+
;

: .. s>d <# #s #> type ;

: defer
  create 0 ,
does>
  @ execute
;

: >pfa
  >pf @
;

: is ( xt <name> -- )
  >pfa ' swap !
;

: .,
  [char] , emit
  space
;

: .;
  [char] ; emit
  space
;

: .:
  [char] : emit space ;

: ?., i 0<> if ., then ;

: ?.; i 0<> if .; then ;

: " [char] " emit ;

requires MODULES
digression read "read.fth"
digression dice "dice.fth"

digression table: "table.fth"

module: treasure

: 1000s 1000 * ;

: variables: times variable iterate ;

8 variables: cp sp ep gp pp gem jewel magical

digression GEMS "gems.fth"

digression MAGIC "magic.fth"

: 2variable
  create 0 , 0 ,
;

2variable factor

: reset
  0 cp !
  0 sp !
  0 ep !
  0 gp !
  0 pp !
  0 gem !
  0 jewel !
  0 magical !
  1 1 factor 2!
  clearmagic
;

reset

\ output n without trailing space

: .report
  cp @ ?dup if .. ." cp " then
  sp @ ?dup if .. ." sp " then
  ep @ ?dup if .. ." ep " then
  gp @ ?dup if .. ." gp " then
  pp @ ?dup if .. ." pp " then
  gem @ ?dup if cr .. ."  gems: " cr gem @ .gems then
  jewel @ ?dup if cr  .. ."  jewels: " cr  jewel @ .jewels  then
  magical @ if .magic then
;

: copper 1000s cp +! ;
: silver 1000s sp +! ;
: electrum 1000s ep +! ;
: gold 1000s gp +! ;
: platinum 100 * pp +! ;
: gems gem +!  ;
: jewels jewel +! ;

\ n is the index of TT (0=A, 1=B etc.)
: magic++ ( n -- n )
  1 swap magictreasure +!
  1 magical !
;

: >factor
  2dup > if 2drop 120 100 then swap factor 2!
;

: factor*  factor 2@ */ ;

\ TT consists of a list of pairs:
\ %chance, xt for generating result
\ when called, runs down the pairs and rolls chance and calls xt

: rollTTs  ( n addr --- text$ len)
  8 times  ( addr )
      dup>r
      @
      d100 factor* < -if r@ cell+ @ execute then
      r> cell+ cell+
  iterate drop
;

variable thisTT
: (tt1) ( <name> %0 code0; %1 code1;...%7 code7; -- )
  create
  here thisTT !
  does>
    rollTTs
;

: compileTTs ( col0 len0 col1 len1...col7 len7)
  8 times
    <$ s" :noname " $+ $+ s"  ; " $+ $>
    evaluate
    thisTT @ i 2* 1+ cells+ !
  iterate
;

\ track which treasure type we're doing, so that the right magic can
\ be called the right number of times
variable thistype

: TT:
  (tt1)
  8 times
    0. bl word count >number 2drop d>s ,
    0 ,
    [char] ; parse
  iterate
  compileTTs
  1 thistype +!
;

: magic
  thistype @ lit
  postpone magic++
; immediate

0 thistype !

TT: A 25 d6 copper ; 30 d6 silver ; 35 d6 electrum ; 40 d10 gold ; 25 d4 platinum ; 60 4d10 gems ; 50 3 10 roll jewels ; 30 magic ;
TT: B 50 d8 copper ; 25 d6 silver ; 25 d4 electrum ; 25 d3 gold ; 0 ; 30 d8 gems ; 20 d4 jewels ; 10 magic ;
TT: C 20 d12 copper ; 30 d6 silver ; 10 d4 electrum ; 0 ; 0 ; 25 d6 gems ; 20 d3 jewels ; 10 magic ;
TT: D 10 d8 copper ; 15 d12 silver ; 15 d6 electrum ; 50 d6 gold ; 0 ; 30 d10 gems ; 25 d6 jewels ; 15 magic ;
TT: E 5 d10 copper ; 25 d12 silver ; 25 d6 electrum ; 25 d8 gold ; 0 ; 15 d12 gems ; 10 d8 jewels ; 25 magic ;
TT: F 0 ; 10 d20 silver ; 15 d12 electrum ; 40 d10 gold ; 35 d8 platinum ; 20 3d10 gems ; 10 d10 jewels ; 30 magic ;
TT: G 0 ; 0 ; 0 ; 50 d4 10 * gold ; 50 d20 platinum ; 30 5 4 roll gems ; 25 d10 jewels ; 35 magic ;
TT: H
    25 5 6 roll copper ;
    40 d100 silver ;
    40 d4 10 * electrum ;
    55 d6 10 * gold ;
    25 5 10 roll platinum ;
    50 d100 gems ;
    50 d4 10 * jewels ;
    15 magic ;
TT: I 0 ; 0 ; 0 ; 0 ; 30 3d6 platinum ; 55 2d10 gems ; 50 d12 jewels ; 15 magic ;
TT: J 100 3 8 roll cp +! ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ; 0 ;
TT: K 0 ; 100 3d6 sp +! ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ;
TT: L 0 ; 0 ; 100 2d6 ep +! ; 0 ;  0 ; 0 ; 0 ; 0 ;
TT: M 0 ; 0 ; 0 ; 100 2 4 roll gp +! ; 0 ;  0 ; 0 ; 0 ;
TT: N 0 ; 0 ; 0 ; 0 ; 100 d6 pp +! ; 0 ;  0 ; 0 ;
TT: O 25 d4 copper ; 20 d3 silver ;  0 ; 0 ; 0 ; 0 ; 0 ; 0 ;
TT: P 0 ; 30 d6 silver ; 25 d2 electrum ; 0 ; 0 ; 0 ; 0 ; 0 ;
TT: Q 0 ; 0 ;  0 ; 0 ; 0 ; 0 ; 50 d4 gems ; 0 ;
: Qx5 Q Q Q Q Q ;
: Qx10 Qx5 Qx5 ;
TT: R 0 ; 0 ; 0 ; 40 2 4 roll gold ; 50 d6 10 * platinum ; 55 4 8 roll gems ; 45 d12 jewels ; 0 ;
TT: S 0 ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ; 40 magic ;
TT: T 0 ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ; 40 magic ;
TT: U 0 ; 0 ;  0 ; 0 ; 0 ; 90 d8 10 * gems ; 80 5 6 roll jewels ; 70 magic ;
TT: V 0 ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ; 85 magic ;
TT: W 0 ; 0 ;  0 ; 60 5 6 roll gold ; 15 d8 platinum ; 60 d6 10 * gems ; 50 5 8 roll jewels ; 55 magic ;
TT: X 0 ; 0 ;  0 ; 0 ; 0 ; 0 ; 0 ; 60 magic ;
TT: Y 0 ; 0 ;  0 ; 70 2d6 gold ; 0 ; 0 ; 0 ; 0 ;
TT: Z
    20 d3 copper ;
    25 d4 silver ;
    25 d4 electrum ;
    30 d4 gold ;
    30 d6 platinum ;
    55 d6 10 * gems ;
    50 5 6 roll jewels ;
    50 magic ;


;module
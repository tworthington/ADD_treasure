\ define file handle

s" /dev/urandom" open/ro dup 0< throw constant rand

: d ( s -- n )
  2 here rand read drop
  here w@ swap mod 1+
;

variable (seed)
4 (seed) rand read drop

: NewRandom ( -- u )
    (seed) @
    dup 0= or 
    dup 13 lshift xor  
    dup 17 rshift xor
    dup 5 lshift xor   
    dup (seed) ! ; 

: d NewRandom swap mod abs 1+ ;

: d100 100 d ;
: d20 20 d ;
: d12 12 d ;
: d10 10 d ;
: d8 8 d ;
: d6 6 d ;
: d4 4 d ;
: d3 3 d ;
: d2 2 d ;

: roll ( n s -- tot)
  0 rot times ( s 0 )
    over d +  ( s 0+rand )
  iterate
  nip
;

: roll+ ( n s bonus -= tot )
  >r roll r> + ;

: 2d4 2 4 roll ;
: 3d4 3 4 roll ;
: 4d4 4 4 roll ;
: 5d4 5 4 roll ;
: 6d4 6 4 roll ;

: 2d6 2 6 roll ;
: 3d6 3 6 roll ;
: 4d6 4 6 roll ;
: 5d6 5 6 roll ;
: 6d6 6 6 roll ;

: 2d8 2 8 roll ;
: 3d8 3 8 roll ;

: 2d10 2 10 roll ;
: 3d10 3 10 roll ;
: 4d10 4 10 roll ;

1 constant dice

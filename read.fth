\ read-only open
: open/ro ( caddr len - handle|eflag )
  drop 0 swap 2 5 linux
;

: read ( len addr handle -- count|flag )
  3 3 linux
;

: close ( handle -- flag )  1 6 linux ;
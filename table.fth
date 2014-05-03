requires ERRORS

\ A table is:  #lastentry test-xt
\ An entry is: matcher previous xt

: >xt [ 2 cells ] literal + ;
: >link cell+ ;

\ search the links for n as long as xt returns true.
: (table) ( n nextlink test-xt)
  >r
  begin
	?dup -if  rdrop . s" Not found " type -1 throw then
	2dup @ r@ execute while
	>link @
  repeat
  rdrop
  nip
  >xt @ execute
;

: fn@ cell+ @ ;

: table: ( xt <name> -- baseaddr prevdummy)
  create here  0 ,
  swap ,
  0
does> ( n addr)
  dup
  @  ( n addr last )
  swap
  fn@
  (table)
;

: extend: ( <tableName> -- baseaddr prev)
  ' >pf @  ( baseaddr)
  dup @
;

: i: ( previous match -- previous xt/colon-sys)
  here >r
  , , 0 ,
  r>
  :noname
;

: ;i  ( previous xt/colon-sys -- )
  postpone ;  ( previous xt )
  over >xt !
; immediate


: ;table ( baseaddr last )
  swap !
;


: dtable:  [ ' < ] literal table: ;

: lookup: [ ' <> ] literal table: ;

dtable: classify
	 1   i: s" Rubbish " type ;i
	 5   i: s" OK " type ;i
	 100 i: s" Jackpot! " type ;i
;table

lookup: .square
1 i: 1 . ;i
2 i: 4 . ;i
3 i: 9 . ;i
20 i: 400 . ;i
;table

s" array index exceeded " error: arraybounds
s" negative array index " error: arrayneg

: 0bounds? ( n max -- )
  over 0< arrayneg avoid
  < arraybounds assert
;

\ zero indexed array
: array  ( maxindex -- )
  create ,
  does> ( n addr -- x)
  	2dup @ 0bounds?
	swap 1+ \ skip bounds entry
	cells +
;
requires ERRORS

\ A table is:  #lastentry test-xt
\ An entry is: match# previous xt

: >xt [ 2 cells ] literal + ;
: >link cell+ ;
: >match ;

: previous@ ( addr -- addr2 flag ) >link @ ;

\ search the links for n as long as xt returns true.
: (table) ( n thisentry test-xt)
  >r
  begin
	?dup -if  rdrop . s" Not found " type -1 throw then
	2dup @ r@ execute while
    previous@
  repeat
  rdrop
  nip
  >xt @ execute
;

: fn@ cell+ @ ;

: (prep-tab) ( n addr -- n nextlink test-xt)
  dup
  @  ( n addr last )
  swap
  fn@
;

: table: ( xt <name> -- baseaddr prevdummy)
  create here  0 ,
  swap ,
  0
does> ( n addr)
  (prep-tab) (table)
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

: e: dup >r
  i:
  r> lit
;

: 0: 0 i: ;

: ;i  ( previous xt/colon-sys -- )
  postpone ;  ( previous xt )
  over >xt !
; immediate

: ;e postpone ;i ; immediate

: ;table ( baseaddr last )
  swap !
;

: (autocount) ( last -- n)
  0 swap
  begin
        ?dup while
        swap 1+ swap previous@
  repeat
;

\ Update table with sequencial match numbers
: ;auto ( baseaddr last )
  2dup ;table
  dup (autocount)   ( last #entries)
  times
        i 1+ over >match !
        previous@
  iterate
  2drop
;

: #entries ( <tablename> -- )
  ' >pf @ @
  (autocount)
  state @ if  lit  then
; immediate

: dtable:  [ ' < ] literal table: ;

: lookup: [ ' <> ] literal table: ;

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

\ string tables
: $delimit
  char parse   ( caddr len)
;

s" String table out of range" error: $tabrange

: $tab: ( <name> -- addr)
  create here 0 ,
  does> ( index addr -- caddr len)

    2dup @   ( index addr index #entries)
    - 0<  $tabrange assert  ( index addr )

    cell+ swap ( addr+ index )
    times
	count + 1+ \ skip zbyte
    iterate
    count
;

\ Allocate space for cell count and zbyte
: $space ( len -- )
  cell+ 1+ allot
;

: $place ( caddr len addr -- )
  over $space
  2dup !  \ store len
  cell+ swap zmove
;

: $ ( addr <char>string<char> -- addr )
  $delimit
  here  $place
  1 over +!  \ count strings
;

: ;$tab ( addr -- )
  drop
;

: (pick1)  ( pfa -- ??? )
  2@ ( xt last )
  dup (autocount)  ( xt last n )
  d  -rot swap (table)
;

: pick1 ( <name> --  ??? )
  ' >pf @
  state @ if
 	lit postpone (pick1)
  else
	(pick1)
  then
; immediate
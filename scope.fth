: public:
  get-order  ( wids n )
  2 pick set-current
  drops
;

: private:
  definitions
;

variable globalwid
forth-wid globalwid !

: global:
  globalwid @ set-current
;

: >global
  get-order
  over globalwid !
  drops
;
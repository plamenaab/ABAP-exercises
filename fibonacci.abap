REPORT zusr_02_fibonacci.

TYPES: BEGIN OF lty_s_fibreihe,
         stelle TYPE i,
         erg    TYPE i,
       END OF lty_s_fibreihe.

* 0 1 1 2 3 5 8

DATA: gv_fib1     TYPE i,
      gv_fib2     TYPE i,
      gv_erg      TYPE i,
      gt_fibreihe TYPE TABLE OF lty_s_fibreihe,
      wa_fib      TYPE lty_s_fibreihe.


gv_fib1 = 1.
gv_fib2 = 1.


DO 44 TIMES.


  gv_erg = gv_fib1 + gv_fib2.

  wa_fib-stelle = sy-index.
  wa_fib-erg = gv_erg.

  APPEND wa_fib TO gt_fibreihe.


  gv_fib1 = gv_fib2.
  gv_fib2 = gv_erg.


  WRITE: gv_erg, '|'.

ENDDO.

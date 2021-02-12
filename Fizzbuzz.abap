REPORT ZUSR_02_FIZZBUZZ.

DATA: lv_ergebnis TYPE i VALUE 1.

DO 100 TIMES.
  IF lv_ergebnis MOD 3 = AND lv_ergebnis MOD 5 = 0.
    WRITE: 'FizzBuzz', /.
  ELSEIF lv_ergebnis MOD 3 =  0.
    WRITE: 'Fizz', /.
  ELSEIF lv_ergebnis MOD 5 =  0.
    WRITE: 'Buzz', /.
  ELSE.
    WRITE: lv_ergebnis, /.
  ENDIF.
  lv_ergebnis = lv_ergebnis + 1.
ENDDO.

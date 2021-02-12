REPORT ZUSR_02_KONTROLLSTRUKTUREN."Verarbeitungsblock 1

PARAMETERS:
*             pa_name  TYPE string,
*            pa_name2 TYPE string,
            pa_alter TYPE i.
DATA:  lv_i     TYPE i.



* jünger 19 - Schüler
* jünger 23 - Student
* Mitarbeiter



*IF pa_alter < 19 AND pa_alter > 7.
*  WRITE: 'Schüler'.
*
*
*ELSEIF pa_alter < 23 OR pa_name EQ 'HANS'.
*
*  WRITE: 'Student'.
*
*ELSE.
*
*
*  WRITE: 'Mitarbeiter'.

*ENDIF.



CASE pa_alter. " 1.1
  WHEN 19 OR 20.
    WRITE: 'Schüler'.

  WHEN 24  OR 21.

    WRITE: 'Student'.


  WHEN OTHERS.
    WRITE: 'Mitarbeiter'.



ENDCASE.



DO 5 TIMES.

  IF lv_i = 80.
    CONTINUE.

  ENDIF.


  lv_i = lv_i + pa_alter.

ENDDO.

*CHECK lv_i > 80. " 1

IF lv_i > 60.


  WHILE lv_i > 70 ."1.3

    IF lv_i > 120.
      EXIT.
    ENDIF.

*  CHECK lv_i = 100.

    lv_i = lv_i + pa_alter.

  ENDWHILE.

ENDIF.


WRITE: lv_i.

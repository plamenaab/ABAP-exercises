REPORT ZUSR_02_RECHNER LINE-SIZE 50.

*einstellige Zahl- aus nur eine Ziffer bestehend
DATA gv_ergebnis TYPE i.

*Der Benutzer muss den Parametern einen Wert angeben
PARAMETERS: pa_oper1 TYPE i,
            pa_zeich TYPE c LENGTH 1,
            pa_oper2 TYPE i.

IF ( pa_zeich = '+' OR
    pa_zeich = '-' OR
    pa_zeich = '*' OR
    pa_zeich = '/').

  CASE pa_zeich.

    WHEN '+'.
      gv_ergebnis = pa_oper1 + pa_oper2.
    WHEN '-'.
      gv_ergebnis = pa_oper1 - pa_oper2.
    WHEN '*'.
      gv_ergebnis = pa_oper1 * pa_oper2.
    WHEN '/'.
      gv_ergebnis = pa_oper1 / pa_oper2.

      IF pa_oper2 = 0.
        RAISE nulldivision.
      ELSE.
        gv_ergebnis = pa_oper1 / pa_oper2.
      ENDIF.
    WHEN OTHERS.
  ENDCASE.

  WRITE:/ 'Das Ergebnis betraegt: ', pa_oper1,  pa_zeich , pa_oper2 , '=', gv_ergebnis.
  ULINE.

ENDIF.
 

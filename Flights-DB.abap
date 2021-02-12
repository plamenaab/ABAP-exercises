REPORT zusr_02_fluege.


*Eine Interne Tabelle "it_fluege" und einen Arbeitsbereich (Struktur) "is_flug" erstellen
DATA: is_flug  TYPE spfli,
      it_fluege TYPE TABLE OF spfli.

PARAMETERS: p_ges TYPE spfli-carrid.

*die Daten aus der Datenbanktabelle SPFLI ausgelesen werden

*SELECT * FROM spfli INTO TABLE it_fluege WHERE carrid = p_ges.

CALL FUNCTION 'Z_USR02_GET_FLUEGE'
  EXPORTING
    carrid = p_ges
 IMPORTING
   LISTE  =  it_fluege
  .



*Erfolgsprüfung sy-subrc =/ 0?

*IF sy-subrc <> 0.
*WRITE: 'FEHLER  aufgetreten!'.
*ENDIF.

*die Flüge aus der internen Tabelle ausgegeben werden.LOOP-Schleife, die in jeder Iteration eine Zeile der internen Tabelle in den
*Arbeitsbereich ls_flug speichert
IF sy-subrc = 0.
  LOOP AT  it_fluege INTO is_flug.
    WRITE: is_flug-connid,
           is_flug-cityfrom,
           is_flug-countryfr,
           is_flug-cityto,
           is_flug-countryto,/.
  ENDLOOP.

ELSE.

  WRITE: 'FEHLER  aufgetreten!'.

ENDIF.

*über die Bindestrich-Notation auf die Elemente connid, cityfrom,
*countryfr, cityto und countryto zugreifen



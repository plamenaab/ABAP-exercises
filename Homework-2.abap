REPORT zusr_02_zaufgabe.

*einen Strukturtyp mit diesen Eigenschaften definieren
TYPES: BEGIN OF gt_s_test,
         carrid   TYPE s_carr_id,
         cityfrom TYPE s_from_cit,
         fltime   TYPE spfli-fltime,
         cityto   TYPE spfli-cityto,
       END OF gt_s_test.


*Parameter mit demselben Datentyp von carrid definieren
PARAMETERS: pa_carr TYPE s_carr_id.
*interne Tabelle muss auf den neu definierten Datentyp typisiert werden
DATA: gt_test TYPE STANDARD TABLE OF gt_s_test,
      gs_test TYPE gt_s_test.
*alle Datensätze von der Tabelle spfli zu selektieren, die mit demselben carrid sind, das ihr in eurem Parameter eingegeben habt
SELECT * FROM spfli INTO CORRESPONDING FIELDS OF TABLE gt_test WHERE carrid = pa_carr.
*Prüft, ob das Auslesen erfolgreich war. Wenn das nicht der Fall ist, gebt eine beliebte Fehlermeldung aus.Andernfalls musst ihr die Inhalte ausgeben.
IF sy-subrc <> 0.
WRITE: 'Ein Fehler scheint aufgetreten zu sein'.
ENDIF.
LOOP AT gt_test INTO gs_test.
    WRITE: gs_test-carrid,
           gs_test-cityfrom,
           gs_test-fltime,
           gs_test-cityto, /.
ENDLOOP.


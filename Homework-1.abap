REPORT zusr_02_academy_aufgabe1.

*Struktur: Mitarbeiter mit : Id ( Länge = 1 ), Name , Alter
*eine standarte + eine sortierte
TYPES: BEGIN OF str_mitarbeiter,
         id    TYPE i,
         name  TYPE string,
         alter TYPE i,
       END OF str_mitarbeiter.


DATA: gs_mitarbeiter  TYPE str_mitarbeiter,
      gt_mitarbeiter  TYPE TABLE OF str_mitarbeiter,
      gt_mitarbeiter2 TYPE SORTED TABLE OF str_mitarbeiter WITH UNIQUE KEY id.

*1) Inhalte in einer Tabelle speichern
gs_mitarbeiter-id = '1'.
gs_mitarbeiter-name = 'Boyan'.
gs_mitarbeiter-alter = '31'.

INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-id = '2'.
gs_mitarbeiter-name = 'Aylin'.
gs_mitarbeiter-alter = '24'.

INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-id = '3'.
gs_mitarbeiter-name = 'Alper'.
gs_mitarbeiter-alter = '22'.

INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter.
CLEAR gs_mitarbeiter.



*2) Einen Datensatz auslesen, name auf UPPER CASE übersetzen und die Tabelle modifizieren
READ TABLE gt_mitarbeiter INDEX 1 INTO gs_mitarbeiter.

TRANSLATE gs_mitarbeiter-name TO UPPER CASE.

MODIFY gt_mitarbeiter FROM gs_mitarbeiter INDEX 1.

*3) Inhalte von einer Tabelle in zweiter Tabelle speichern
INSERT LINES OF gt_mitarbeiter INTO TABLE gt_mitarbeiter2.



*4)Die Inhalte der ersten Tabelle löschen

*CLEAR gt_mitarbeiter.
*FREE gt_mitarbeiter.

*DELETE TABLE gt_mitarbeiter. - geht nicht


*ТУК ИЗТРИВАШ САМО ПЪРВИЯ РЕД НА ТАБЛИЦАТА-С БОЯН
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter.

  DELETE TABLE gt_mitarbeiter FROM gs_mitarbeiter.

ENDLOOP.


*5)Die Inhalte der zwei Tabellen ausgeben falls sy-tabix = 1, das Alter von Boyan auf 30 setzen

LOOP AT gt_mitarbeiter2 INTO gs_mitarbeiter.

  IF sy-tabix = 1.

    gs_mitarbeiter-alter = 30.

    MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter.
* exit, защото искаме да променим само един датензац (този с Боян), а не всичките и трябва да излезем от лооп-а.
    EXIT.

  ENDIF.

ENDLOOP.

WRITE: 'asd'.

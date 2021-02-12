REPORT zusr_02_studenten LINE-SIZE 50.


*drei Studenten erzeugen, füge diese in die Tabelle hinzu, lösche einen Student, Loope über die Tabelle und gib die verbliebenen Studenten aus

TYPES: BEGIN OF gt_s_studenten,
         vorname        TYPE string,
         nachname       TYPE string,
         matrikelnm(5) TYPE n,
         studienfach    TYPE string,
         semester       TYPE i,
       END OF gt_s_studenten.

DATA: gs_studenten TYPE gt_s_studenten,
      gt_studenten TYPE SORTED TABLE OF gt_s_studenten WITH UNIQUE KEY matrikelnm.

gs_studenten-vorname = 'Plamena'.
gs_studenten-nachname = 'Baksheva'.
gs_studenten-matrikelnm = '12345'.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semester = '4'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.


gs_studenten-vorname = 'Milen'.
gs_studenten-nachname = 'Ivanov'.
gs_studenten-matrikelnm = '12344'.
gs_studenten-studienfach = 'Informatik'.
gs_studenten-semester = '3'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.


gs_studenten-vorname = 'Elena'.
gs_studenten-nachname = 'Petrova'.
gs_studenten-matrikelnm = '12343'.
gs_studenten-studienfach = 'Mechatronik'.
gs_studenten-semester = '1'.
INSERT gs_studenten INTO TABLE gt_studenten.
CLEAR gs_studenten.

*MODIFY TABLE gt_studenten FROM gs_studenten.

CLEAR gs_studenten.

DELETE gt_studenten INDEX 3.

LOOP AT gt_studenten INTO gs_studenten.
  WRITE: 'Name: ', gs_studenten-nachname, /
       'Vorname: ' , gs_studenten-vorname, /
       'Matrikelnmikelnummer: ' , gs_studenten-matrikelnm, /
       'Studienfach: ' , gs_studenten-studienfach,/.
  CLEAR gs_studenten.
ENDLOOP.

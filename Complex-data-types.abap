REPORT zusr_02_komplexe_datentypen.


TYPES: BEGIN OF lty_s_mitarbeiter,

         pernr    TYPE i,
         vorname  TYPE string,
         nachname TYPE string,
         alter    TYPE i,


       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.




DATA: gs_mitarbeiter TYPE lty_s_mitarbeiter,
      gt_mitarbeiter TYPE lty_t_mitarbeiter.


DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.


gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Plamena'.
gs_mitarbeiter-nachname = 'Baksheva'.
gs_mitarbeiter-alter = 22.

**********************************************************************
* Einfügen von Datensätzen
**********************************************************************

*append gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2 .
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Milen'.
gs_mitarbeiter-nachname = 'Ivanov'.
gs_mitarbeiter-alter = 22.

*append gs_mitarbeiter TO gt_mitarbeiter2.

INSERT gs_mitarbeiter INTO table gt_mitarbeiter2 .
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 3.
gs_mitarbeiter-vorname = 'Elena'.
gs_mitarbeiter-nachname = 'Petrova'.
gs_mitarbeiter-alter = 23.


INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.


APPEND LINES OF gt_mitarbeiter2  TO 3 TO gt_mitarbeiter.
INSERT LINES OF gt_mitarbeiter2 FROM 1  INTO TABLE gt_mitarbeiter.
*********************************************************************
* Auslesen von Datensätzen
**********************************************************************

*READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
*READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
*READ   TABLE gt_mitarbeiter2 WITH KEY vorname = 'Alper' into gs_mitarbeiter.

**********************************************************************
* Verändern von Datensätzen
**********************************************************************
*Wenn Primärschlüssel vorhanden ist.
MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter .
*MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. " Wenn kein Primärschlüssel vorhanden ist oder wenn er nicht verwendet werden soll

**********************************************************************
*Löschen von Datensätzen
**********************************************************************

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. " Sucht Zeile auf Basis des Primärschlüssels und löscht
DELETE gt_mitarbeiter2 INDEX 2.

WRITE gs_mitarbeiter-vorname.
*
**WRITE: gs_mitarbeiter-vorname,
**/, gs_mitarbeiter-id,
**/, gs_mitarbeiter-alter LEFT-JUSTIFIED.

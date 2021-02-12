REPORT ZUSR_02_ZEICHENARTIGE.


DATA: gv_char     TYPE c LENGTH 10 VALUE 'Hallo',
      gv_numc(10) TYPE n VALUE '1998',
      gv_string   TYPE string VALUE 'Hallo0000001998',
      gv_zahl1    TYPE p DECIMALS 2 VALUE '3.14',
      gv_konv     TYPE string.


WRITE: gv_char,
gv_numc,
gv_string.

* gv_string = gv_string + gv_zahl1.
WRITE: /, 'ZAHL:', gv_zahl1.
gv_konv

CONCATENATE gv_char gv_numc INTO gv_string.
*WRITE / gv_string. "Hallo0000001998
WRITE: / 'CONCATENATE:', gv_string.

**********************************************************************
* Suchen in Zeichenketten
**********************************************************************

Find ALL OCCURRENCES OF 'HALLO'IN gv_string MATCH COUNT DATA (lv_cnt).
search
WRITE: / lv_cnt.
WRITE: /, TEXT-001.

IF sy-subrc = 0 .

  write gv_string.

ENDIF.

**********************************************************************
*Ersetzen von Zeichen in Zeichenketten
**********************************************************************

REPLACE 'Hallo'in gv_string with '&&&'.

**********************************************************************
* Zerlegen von Zeichenketten
**********************************************************************

data: gv_vorname Type string,
      gv_nachname TYPE string,
      gv_ganzer_name TYPE string Value 'Muster Mustermann Mustermannof',
      gv_familienname TYPE string.

split gv_ganzer_name at ' ' into gv_vorname gv_nachname gv_familienname.

IF sy-subrc = 0 .

  write: 'Split: ',  /, gv_vorname,
  gv_nachname.

ENDIF.

**********************************************************************
* Verdichtung von Zeichenketten
**********************************************************************

data: gv_condense type string value ' Mister Mustermann '.
CONDENSE gv_condense NO-GAPS.
IF sy-subrc = 0 .

  write: 'CONDENSE: ', /, gv_condense.
  gv_nachname.

ENDIF.

**********************************************************************
* Umwandeln von Zeichenketten (gross und klein Schreibung
**********************************************************************

translate gv_condense to UPPER CASE.
IF sy-subrc = 0 .

  write: 'Translate: ',/, gv_condense.
  gv_nachname.

ENDIF.

write: text-002.

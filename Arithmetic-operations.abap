REPORT zusr_02_mathe LINE-SIZE 50.

DATA: gv_zahl1  TYPE i VALUE 2,
      gv_zahl2  TYPE i VALUE 3,
      gv_erg    TYPE p DECIMALS 2,
      gv_asd    TYPE c,
      gv_konv1  TYPE i VALUE 5,
      gv_konv2  TYPE string VALUE '123',
      gv_double TYPE p DECIMALS 2 VALUE '3.14'.

gv_erg = gv_zahl1 / gv_zahl2. "6/3=2
WRITE:/, 'Division: ', gv_erg.
gv_erg = gv_zahl1 MOD gv_zahl2. "6/3=2, REST=0
WRITE:/, 'Restwertdivision:', gv_erg.
gv_erg = gv_zahl1 ** gv_double.
WRITE:/, 'Potenzierung: ', gv_erg.



*CONSTANTS gv_konst type i VALUE 5.
*gv_zahl2 = 5.
*gv_erg = gv_zahl1 + gv_zahl2.
*
*write gv_erg.
*uline.
*gv_erg = gv_zahl1 - gv_zahl2.
*write: /, gv_erg.
*uline.
*gv_erg = gv_zahl1 * gv_zahl2.
*
*write: /, gv_erg.
*uline.
*gv_erg = gv_zahl1 / gv_zahl2.
*
*write: /, gv_erg.

REPORT zusr_02_datenbank.


TYPES: BEGIN OF gt_s_test,
         fldate   TYPE sflight-fldate,
         seatsmax TYPE s_seatsmax,
         seatsocc TYPE sflight-seatsocc,
       END OF gt_s_test.


DATA: gt_spfli    TYPE TABLE OF spfli,
      gs_spfli    TYPE spfli,
      gv_fldate   TYPE sflight-fldate,
      gv_seatsmax TYPE s_seatsmax,
      gv_seatsocc TYPE sflight-seatsocc,
      gv_test     TYPE gt_s_test.

*SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid = 'LH'

*SELECT SINGLE * FROM spfli INTO gs_spfli WHERE carrid = 'LH'.


SELECT SINGLE seatsocc seatsmax  fldate
  FROM sflight
  INTO CORRESPONDING FIELDS OF gv_test
  WHERE carrid = 'LH'
  AND connid = 0401.

WRITE: gv_test-fldate,
gv_test-seatsmax,
gv_test-seatsocc.

IF sy-subrc <> 0.

  WRITE: 'Fehler'.

ENDIF.


*LOOP AT g
t_spfli INTO gs_spfli.
*
*
WRITE: gs_spfli-carrid,
*

  gs_spfl

*WRITE: gs_spfli-carrid,
*        gs_spfli-connid,
*        gs_spfli-cityfrom,
*        gs_spfli-cityto,
*        gs_spfli-fltime, /.
*
*ENDLOOP.

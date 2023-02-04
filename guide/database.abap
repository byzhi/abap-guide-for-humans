*&---------------------------------------------------------------------*
*& Report  Z_DATABASE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

* # ABAP Dictionary

* https://help.sap.com/saphelp_nwes72/helpdata/en/cf/21ea0b446011d189700000e8322d00/frameset.htm
* use the ABAP Dictionary to create and manage data definitions (metadata).

* 'se11'

* database table: spfli
* https://www.sapdatasheet.org/abap/tabl/spfli.html

* show table contects
* utilities -> table contects -> display

REPORT  Z_DATABASE.

* select * from table
DATA: wa_scarr TYPE scarr.

SELECT SINGLE *
FROM scarr
INTO wa_scarr.

WRITE: wa_scarr-carrid, wa_scarr-carrname, wa_scarr-currcode.

* select single
TYPES: BEGIN OF ty_spfli,
  carrid TYPE spfli-carrid,
  connid  TYPE spfli-connid,
  countryfr TYPE spfli-countryfr,
  countryto TYPE spfli-countryto,
  cityfrom TYPE spfli-cityfrom,
  cityto TYPE spfli-cityto,
END OF ty_spfli.

DATA wa_spfli TYPE ty_spfli.

SELECT SINGLE carrid connid countryfr countryto cityfrom cityto
FROM spfli
INTO CORRESPONDING FIELDS OF wa_spfli
WHERE carrid = 'AA' AND connid = '0017'.

* if result
IF sy-subrc = 0.
  WRITE: wa_spfli-carrid, wa_spfli-connid, wa_spfli-countryfr, wa_spfli-countryto, wa_spfli-cityfrom,  wa_spfli-cityto, wa_spfli-cityto.
* if no result
ELSE.
  WRITE: 'no result.'.
ENDIF.

* select multi
DATA wa_spfli2 TYPE spfli.

SELECT *
FROM spfli
INTO wa_spfli2.
  WRITE: / wa_spfli2-carrid, wa_spfli2-connid, wa_spfli2-cityfrom, wa_spfli2-cityto.
ENDSELECT.
*&---------------------------------------------------------------------*
*& Report  Z_SELECTIONSCREEN
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_SELECTIONSCREEN.

DATA it_spfli TYPE TABLE OF spfli.
DATA wa_spfli TYPE spfli.

PARAMETERS pa_cid TYPE spfli-carrid.

* Change parameters text
* Goto > Text Elements > Selection Texts

SELECT * FROM spfli
INTO TABLE it_spfli
WHERE carrid = pa_cid.

LOOP AT it_spfli INTO wa_spfli.
  WRITE: wa_spfli-carrid, wa_spfli-connid, wa_spfli-countryfr, wa_spfli-countryto, wa_spfli-cityfrom,  wa_spfli-cityto, wa_spfli-cityto.
ENDLOOP.
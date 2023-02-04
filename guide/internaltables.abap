*&---------------------------------------------------------------------*
*& Report  Z_INTERNALTABLES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_INTERNALTABLES.

* # Internal Tables
* https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abennested_internal_tables_abexa.htm

* Internal tables are an important feature of the ABAP language.
* ABAP does not support arrays; the only way to define a multi-element data object is to use an internal table.

* # Table Type
* ## Standard tables
* Index access is the quickest possible access.

* ## Sorted tables
* Sorted tables are particularly useful for partially sequential processing in a LOOP if you specify the beginning of the table key in the WHEREcondition.

* ## Hashed tables
* Like database tables, hashed tables always have a unique key. Hashed tables are useful if you want to construct and use an internal table which resembles a database table or for processing large amounts of data.

* example 1
* structure
DATA wa_scarr TYPE scarr.

* internal table
DATA it_scarr TYPE TABLE OF scarr.

* sql into internal table
SELECT *
INTO CORRESPONDING FIELDS OF TABLE it_scarr
FROM scarr.

IF sy-subrc = 0.
* loop to structure
  LOOP AT it_scarr INTO wa_scarr.

    WRITE: / wa_scarr-carrid, wa_Scarr-carrname, wa_scarr-currcode.

  ENDLOOP.

ELSE.
  WRITE: 'not found'.
ENDIF.

* example 2
TYPES: BEGIN OF ty_sales,
  customerid(3) TYPE n,
  productid(3) TYPE n,
  orderid(3) TYPE n,
  customername(10) TYPE C,
  amount TYPE I,
END OF ty_sales.

DATA it_sales TYPE STANDARD TABLE OF ty_sales WITH KEY customerid productid orderid.
DATA wa_sales TYPE ty_sales.

wa_sales-customerid = '001'.
wa_sales-productid = '001'.
wa_sales-orderid = '001'.
wa_sales-customername = 'Apple'.
wa_sales-amount = 10.
APPEND wa_sales TO it_sales.

wa_sales-customerid = '002'.
wa_sales-productid = '002'.
wa_sales-orderid = '001'.
wa_sales-customername = 'Google'.
wa_sales-amount = 10.
APPEND wa_sales TO it_sales.

wa_sales-customerid = '003'.
wa_sales-productid = '002'.
wa_sales-orderid = '001'.
wa_sales-customername = 'Amazon'.
wa_sales-amount = 10.
APPEND wa_sales TO it_sales.

wa_sales-customerid = '002'.
wa_sales-productid = '001'.
wa_sales-orderid = '001'.
wa_sales-customername = 'Google'.
wa_sales-amount = 10.
APPEND wa_sales TO it_sales.

* slow
*LOOP AT it_sales INTO wa_sales.
*IF wa_sales-customerid = '001'.
*  wa_sales-customername = 'Apple China'.
*  MODIFY it_sales FROM wa_sales.
*ENDIF.
*ENDLOOP.

* fast
LOOP AT it_sales INTO wa_sales WHERE customerid = '001'.
  wa_sales-customername = 'Apple CN'.
  MODIFY it_sales FROM wa_sales.
ENDLOOP.

LOOP AT it_sales INTO wa_sales.
  WRITE: / wa_sales-customerid, wa_sales-productid, wa_sales-orderid, wa_sales-customername, wa_sales-amount.
ENDLOOP.
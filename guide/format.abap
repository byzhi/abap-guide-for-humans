*&---------------------------------------------------------------------*
*& Report  Z_FORMAT
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_FORMAT LINE-SIZE 45.

* example 1
DATA: BEGIN OF LINE,
  land(3)  TYPE C,
  name(10) TYPE C,
  age      TYPE I,
  weight   TYPE p DECIMALS 2,
END OF LINE.

DATA itab LIKE SORTED TABLE OF LINE
      WITH NON-UNIQUE KEY land name age weight.

LINE-land = 'G'.   LINE-name   = 'Hans'.
LINE-age  = 20.    LINE-weight = '80.00'.
INSERT LINE INTO TABLE itab.

LINE-land = 'USA'. LINE-name   = 'Nancy'.
LINE-age  = 35.    LINE-weight = '45.00'.
INSERT LINE INTO TABLE itab.

LINE-land = 'USA'. LINE-name   = 'Howard'.
LINE-age  = 40.    LINE-weight = '95.00'.
INSERT LINE INTO TABLE itab.

LINE-land = 'GB'.  LINE-name   = 'Jenny'.
LINE-age  = 18.    LINE-weight = '50.00'.
INSERT LINE INTO TABLE itab.

LINE-land = 'F'.   LINE-name   = 'Michele'.
LINE-age  = 30.    LINE-weight = '60.00'.
INSERT LINE INTO TABLE itab.

LINE-land = 'G'.   LINE-name   = 'Karl'.
LINE-age  = 60.    LINE-weight = '75.00'.
INSERT LINE INTO TABLE itab.

ULINE.
FORMAT COLOR COL_HEADING.
WRITE: / sy-vline, AT 2(6) 'land',

* Goto > Text Elements > Text symbols
* Goto > Translation
sy-vline, AT 13(10) 'name'(001),
sy-vline, AT 28(6) 'age',
sy-vline, AT 38(6) 'weight',
AT 45 sy-vline.
ULINE.

FORMAT RESET.
LOOP AT itab INTO LINE.
  WRITE: / sy-vline, AT 2(6) LINE-land LEFT-JUSTIFIED,
  sy-vline, AT 13(10) LINE-name COLOR COL_KEY LEFT-JUSTIFIED,
  sy-vline, AT 28(6) LINE-age LEFT-JUSTIFIED,
  sy-vline, AT 38(6) LINE-weight LEFT-JUSTIFIED,
* REPORT  Z_1_4_INTERNALTABLES LINE-SIZE 45(36 = 38 + 6 + 1).
  sy-vline.
ENDLOOP.
ULINE.
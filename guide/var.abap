*&---------------------------------------------------------------------*
*& Report  Z_VAR
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

* Predefined ABAP Types

* https://help.sap.com/doc/abapdocu_750_index_htm/7.50/en-US/abenbuilt_in_types_complete.htm

* # Data Types
* c- Text fields with a fixed number of characters. 1 to 262,143
* n- Numeric text fields with a fixed number of digits. 1 to 262,143
* string- Text strings with any number of characters. 

* ## Numeric Types
* b- 0 to 255
* s- -32,768 to +32,767
* i- Integer numbers with a length of 4 or 8 bytes. -2,147,483,648 to +2,147,483,647
* p- Packed numbers in BCD (Binary Coded Decimals) format.
* f- Binary floating point numbers. -1.7976931348623157E+308 and -2.2250738585072014E-308; +2.2250738585072014E-308 and +1.7976931348623157E+308

* ## Byte-Like Types
* x- Byte fields with a fixed number of bytes. 00 to FF
* xstring- Byte strings with any number of bytes.

* ## Date Types and Time Types
* d- Date fields with length 8 containing a date in YYYYMMDD format.
* t- Time fields with length 6 containing a time in HHMMSS format. Calculations interpret a time as the number of seconds since midnight.


REPORT  Z_VAR.

DATA: i1 TYPE I.
i1 = 1234567890.
WRITE: i1.

* LIKE
DATA d1 TYPE d.
d1 = '20190101'.

DATA d2 LIKE d1.
d2 = sy-datum.
WRITE: d1, d2.

* MOVE
DATA t1 TYPE t.
DATA t2 TYPE t.
MOVE '123456' TO t1.
t2 = sy-uzeit.
WRITE: t1, t2.

* p
* total: 2 * 10 - 1 = 19
* decimals: 2
* int: 19 - 2 = 17
DATA p1(10) TYPE p DECIMALS 2.

* TYPES
TYPES: BEGIN OF ty_date,
  year(4) TYPE n,
  month(2) TYPE n,
  day(2) TYPE n,
END OF ty_date.

DATA d3 TYPE ty_date.
d3-year = 1995.
d3-month = 03.
d3-day = 15.
WRITE: d3-year, '-', d3-month, '-', d3-day.

* MOVE-CORRESPONDING
WRITE: / '---'.
TYPES: BEGIN OF ty_person,
  name(10) TYPE C,
  mobile(8) TYPE n,
  birth_date TYPE ty_date,
END OF ty_person.

TYPES: BEGIN OF ty_person_2,
  name(10) TYPE C,
  mobile(8) TYPE n,
  year(4) TYPE n,
END OF ty_person_2.

DATA: wa_person TYPE ty_person.

wa_person-name = 'BILL'.
wa_person-mobile = 12345678.
wa_person-birth_date-year = 1970.

DATA: wa_person_2 TYPE ty_person_2.

MOVE-CORRESPONDING wa_person TO wa_person_2.
MOVE-CORRESPONDING wa_person-birth_date TO wa_person_2.

WRITE: wa_person_2-name,wa_person_2-mobile,wa_person_2-year.
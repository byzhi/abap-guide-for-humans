*&---------------------------------------------------------------------*
*& Report  Z_INCLUDE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_INCLUDE.

* Ctrl + Shift + F5
* Under 'Includes' folder

* example 1
* Z_INCLUDE_DEF, Z_INCLUDE_MAIN, Z_INCLUDE_SUB are all under 'Includes' folder.

INCLUDE Z_INCLUDE_DEF.
INCLUDE Z_INCLUDE_MAIN.
INCLUDE Z_INCLUDE_SUB.

*&---------------------------------------------------------------------*
*&  Include           Z_INCLUDE_DEF
*&---------------------------------------------------------------------*

DATA: num_1 TYPE I,
      num_2 TYPE I,
      num_sum TYPE I.

*&---------------------------------------------------------------------*
*&  Include           Z_INCLUDE_MAIN
*&---------------------------------------------------------------------*

num_1 = 10.
num_2 = 20.

PERFORM add USING num_1 num_2 CHANGING num_sum.

*&---------------------------------------------------------------------*
*&  Include           Z_INCLUDE_SUB
*&---------------------------------------------------------------------*

FORM add
USING VALUE(v1) TYPE ANY
      VALUE(v2) TYPE ANY
CHANGING VALUE(r_mul) TYPE ANY.
  r_mul = v1 + v2.
  WRITE r_mul.
ENDFORM.
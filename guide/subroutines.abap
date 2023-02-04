*&---------------------------------------------------------------------*
*& Report  Z_SUBROUTINES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_SUBROUTINES.

* https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm

* Subroutines were mainly used for the local modularization of programs, however, they can also be called externally.
* Their functions are implemented between the statements FORM and ENDFORM.
* A subroutine is declared immediately when implemented.
* Subroutines should no longer be created in new programs

* example 1(Passing Parameters by Reference)
DATA: num_1 TYPE I,
      num_2 TYPE I,
      num_sum TYPE I.

num_1 = 10.
num_2 = 20.
PERFORM ADD USING num_1 num_2 CHANGING num_sum. "actual parameters num1, num2

FORM ADD
USING v_1 TYPE I
      v_2 TYPE I
CHANGING v_sum TYPE I.
  v_sum = v_1 + v_2.
  WRITE: v_sum.
ENDFORM.

* example 2(Output Parameters)
DATA: num_3 TYPE I,
      num_4 TYPE I,
      num_mul TYPE I.

START-OF-SELECTION.
num_3 = 30.
num_4 = 40.
PERFORM multip USING num_3 num_4 CHANGING num_mul.

FORM multip
USING VALUE(v1) TYPE ANY
      VALUE(v2) TYPE ANY
CHANGING VALUE(r_mul) TYPE ANY.
  r_mul = v1 * v2.
  WRITE r_mul.
ENDFORM.

* example 3(Passing Structures)
TYPES: BEGIN OF people,
  name(10)   TYPE C,
  age(2)     TYPE n,
  COUNTRY(3) TYPE C,
END OF people.

DATA who TYPE people.

START-OF-SELECTION.
who-name = 'A'. who-age = '10'. who-COUNTRY = 'JPN'.
PERFORM CHANGE-people CHANGING who.

WRITE: / who-name, who-age, who-COUNTRY.

FORM CHANGE-people
CHANGING VALUE(v) TYPE people.
  WRITE: / v-name, v-age, v-COUNTRY.
  v-name = 'B'.
  v-age = '60'.
  v-COUNTRY = 'USA'.
ENDFORM.

* example 4(Passing Internal Tables)
DATA: BEGIN OF tb,
  col_1 TYPE I,
  col_2 TYPE I,
END OF tb.

START-OF-SELECTION.
DATA it_tb LIKE STANDARD TABLE OF tb.

* the subroutines fill and out each have one formal parameter defined as an internal table.
* An internal table without header line is passed to the subroutines.
PERFORM fill CHANGING it_tb.
PERFORM out USING it_tb.

FORM fill CHANGING f_it_tb LIKE it_tb.
  DATA d_tb LIKE LINE OF f_it_tb.
  DO 3 TIMES.
    d_tb-col_1 = sy-INDEX.
    d_tb-col_2 = sy-INDEX ** 2.
    APPEND d_tb TO f_it_tb.
  ENDDO.
ENDFORM.

FORM out USING VALUE(v) LIKE it_tb.
  DATA d_tb LIKE LINE OF v.
  LOOP AT v INTO d_tb.
    WRITE: / d_tb-col_1, d_tb-col_2.
  ENDLOOP.
ENDFORM.

* example 5(TABLES parameter)
TYPES: BEGIN OF ty,
  col_1 TYPE I,
  col_2 TYPE I,
END OF ty.
  
START-OF-SELECTION.

DATA: a_tb TYPE STANDARD TABLE OF ty WITH HEADER LINE,
      b_tb TYPE STANDARD TABLE OF ty.

PERFORM fill_2 TABLES a_tb.

MOVE a_tb[] TO b_tb.

PERFORM out_2 TABLES b_tb.

FORM fill_2 TABLES v LIKE a_tb[].
  DO 3 TIMES.
    v-col_1 = sy-INDEX.
    v-col_2 = sy-INDEX ** 2.
    APPEND v.
  ENDDO.
ENDFORM.
 
FORM out_2 TABLES v LIKE b_tb.
  LOOP AT v.
    WRITE: / v-col_1, v-col_2.
  ENDLOOP.
ENDFORM.
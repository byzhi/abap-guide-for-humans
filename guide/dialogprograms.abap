*&---------------------------------------------------------------------*
*& Report  Z_DIALOGPROGRAMS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

* # Dialog Programs

* Screens call dialog modules in the associated ABAP program from their flow logic.
* Programs that are partially or wholly dialog-driven cannot be executed in the background.

* Adding a Screen
* Step 1 − right-click on the program name and select the options Create → Screen.
* Step 2 - Enter a screen number except 0 or 1000

* Screen Layout
* Step 1 − Click the layout button.
* Step 2 − Do something

* Creating Transaction:
* Step 1: To add the transaction to the dialog program, right click on the program and select Create -> Transaction like below.
* Step 2: Enter the transaction code
* Step 3: Enter the program name, screen number to link to the transaction and check the option ‘GUI for Windows’ and click on Save button.

REPORT  Z_DIALOGPROGRAMS.

* example 1
TABLES spfli. "which means but can not use DATA spfli TYPE spfli.

PARAMETERS p_carrid TYPE spfli-carrid.
PARAMETERS p_connid TYPE spfli-connid.

CALL SCREEN 100.

*&---------------------------------------------------------------------*
*&      Module  EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*

* double click 'EXIT' in 'Flow Logic'
* Activate both 'Screen' and 'Main'

MODULE EXIT INPUT.

  LEAVE TO SCREEN 0.

ENDMODULE.                 " EXIT  INPUT

INCLUDE Z_DIALOGPROGRAMS_100_PBO.

*&---------------------------------------------------------------------*
*&      Flow Logic
*&---------------------------------------------------------------------*
PROCESS BEFORE OUTPUT.
* MODULE STATUS_0100.
*
MODULE get_data. " New Inclue

PROCESS AFTER INPUT.
* MODULE USER_COMMAND_0100.

MODULE EXIT.

*----------------------------------------------------------------------*
***INCLUDE Z_DIALOGPROGRAMS_100_PBO .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  get_data  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_data OUTPUT.

SELECT SINGLE * FROM spfli
INTO spfli
WHERE carrid = p_carrid
AND connid = p_connid.

ENDMODULE.                 " get_data  OUTPUT
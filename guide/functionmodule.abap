*&---------------------------------------------------------------------*
*& Report  Z_FUNCTIONMODULE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_FUNCTIONMODULE.

* Function modules are procedures that are defined in special ABAP programs only.
* Function modules allow you to encapsulate and reuse global functions in the SAP System. They are managed in a central function library.
* Unlike subroutines, you do not define function modules in the source code of your program. 

* example 1
* click 'spell' to see the structure.
DATA result LIKE spell.

PARAMETERS num TYPE I.

* click 'Pattern' button, input 'spell_amount'.

CALL FUNCTION 'SPELL_AMOUNT'
EXPORTING
  AMOUNT          = num
  CURRENCY        = ' '
  FILLER          = ' '
  LANGUAGE        = SY-LANGU
IMPORTING
  IN_WORDS        = result
EXCEPTIONS
  NOT_FOUND       = 1
  TOO_LARGE       = 2
  OTHERS          = 3
  .
IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  WRITE: '', SY-SUBRC.
ELSE.
  WRITE: 'Result is:', result-word. " add '-word.' because must be a character-type field.
ENDIF.

* input 123
* Result is:
* ONE HUNDRED TWENTY-THRE

* example 2
*&---------------------------------------------------------------------*
*& Report  Z_FUNCTIONMODULE_2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_FUNCTIONMODULE_2.

INCLUDE Z_FM_DEF.
INCLUDE Z_FM_MAIN.
INCLUDE Z_FM_SUB.

*&---------------------------------------------------------------------*
*&  Include           Z_FM_DEF
*&---------------------------------------------------------------------*

DATA it_spfli TYPE TABLE OF spfli.

*&---------------------------------------------------------------------*
*&  Include           Z_FM_MAIN
*&---------------------------------------------------------------------*

START-OF-SELECTION.

PERFORM get_data.
PERFORM show_data.

*&---------------------------------------------------------------------*
*&  Include           Z_FM_SUB
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  get_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM get_data .
  SELECT * FROM spfli
  INTO TABLE it_spfli.
ENDFORM.                    " get_data

*&---------------------------------------------------------------------*
*&      Form  show_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM show_data .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
  EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                =
*   I_BUFFER_ACTIVE                   =
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
    I_STRUCTURE_NAME                  = 'SPFLI'
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT_LVC                     =
*   IT_FIELDCAT_LVC                   =
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS_LVC             =
*   IT_SORT_LVC                       =
*   IT_FILTER_LVC                     =
*   IT_HYPERLINK                      =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT_LVC                      =
*   IS_REPREP_ID_LVC                  =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 =
*   I_HTML_HEIGHT_END                 =
*   IT_EXCEPT_QINFO_LVC               =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    T_OUTTAB                          = it_spfli
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
    .
  IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

ENDFORM.                    " show_data
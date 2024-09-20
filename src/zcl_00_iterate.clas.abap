CLASS zcl_00_iterate DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_iterate IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    CONSTANTS counter TYPE i VALUE 20.

    DATA numbers TYPE TABLE OF i.
    DATA output  TYPE TABLE OF string.

    DO counter TIMES.
      IF sy-index = 1.
        APPEND 0 TO numbers.
      ELSEIF sy-index = 2.
        APPEND 1 TO numbers.
      ELSE.
        APPEND numbers[ sy-index - 1 ] + numbers[ sy-index - 2 ] TO numbers.
      ENDIF.
    ENDDO.

    LOOP AT numbers INTO FINAL(number).
      APPEND |{ sy-tabix WIDTH = 14 ALIGN = LEFT }; { number WIDTH = 10 ALIGN = RIGHT }| TO output.
    ENDLOOP.

    out->write( output ).
  ENDMETHOD.
ENDCLASS.

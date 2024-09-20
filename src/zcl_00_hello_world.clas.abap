CLASS zcl_00_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_00_hello_world IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Ausgabe
    out->write( 'Hello World' ). " Ausgabe
  ENDMETHOD.
ENDCLASS.

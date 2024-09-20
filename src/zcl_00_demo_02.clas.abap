CLASS zcl_00_demo_02 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_02 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA result TYPE p LENGTH 16 DECIMALS 10.

    " Arithmetic Operators
    result = 5 + 3.
    out->write( result ).
    result = 5 - 3.
    out->write( result ).
    result = 5 * 3.
    out->write( result ).
    result = 5 / 3.
    out->write( result ).
    result = 5 DIV 3.
    out->write( result ).
    result = 5 MOD 3.
    out->write( result ).
    result = 5 ** 3.
    out->write( result ).

    " Inkrementieren / Dekrementieren
    CLEAR result.
    result = result + 1.
    result += 1.
    out->write( result ).
    result = result - 1.
    result -= 1.
    out->write( result ).

    " Arithmetic Expressions
    result = abs( -4 ).
    out->write( result ).
    result = round( val = '55.875'
                    dec = 2 ).
    out->write( result ).
  ENDMETHOD.
ENDCLASS.

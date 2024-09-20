CLASS zcl_00_compute DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_compute IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA number1  TYPE i.
    DATA number2  TYPE i.
    DATA operator TYPE c LENGTH 1. " DATA operator.
    DATA result   TYPE p LENGTH 16 DECIMALS 2.

    number1 = -8.
    number2 = 3.
    operator = '/'.

    IF operator <> '+' AND operator <> '-' AND operator <> '*' AND operator <> '/'.
      out->write( |Invalid operator: { operator }| ).
      RETURN.
    ENDIF.

    IF operator = '/' AND number2 IS INITIAL. " AND number2 = 0.
      out->write( |Division by Zero| ).
      RETURN.
    ENDIF.

    CASE operator.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        result = number1 / number2.
    ENDCASE.

    FINAL(output) = |{ number1 } { operator } { number2 } = { result }|.

    out->write( output ).
  ENDMETHOD.
ENDCLASS.

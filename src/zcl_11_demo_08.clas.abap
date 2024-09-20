CLASS zcl_11_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_11_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZI_11_ConnectionWithCarrier
      FIELDS *
      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(connections).

    out->write( connections ).
  ENDMETHOD.
ENDCLASS.

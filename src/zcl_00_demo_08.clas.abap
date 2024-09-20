CLASS zcl_00_demo_08 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZI_99_ConnectionWithCarrier
      FIELDS CarrierId, ConnectionId, AirportFromId, AirportToId, \_Flights-flight_date
      WHERE CarrierId = 'LH'
      INTO TABLE @FINAL(flights).
    IF sy-subrc <> 0.
      out->write( 'no data' ).
    ENDIF.

    out->write( flights ).
  ENDMETHOD.
ENDCLASS.

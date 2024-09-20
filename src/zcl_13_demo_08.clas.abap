CLASS zcl_13_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from ZI_13_ConnectionWithCarrier
  fields carrierid, ConnectionId, AirportFromId,AirportToId, \_flights-flight_date
  where carrierid = 'LH'
  into table @data(flights).

  out->write( flights ).

  ENDMETHOD.
ENDCLASS.

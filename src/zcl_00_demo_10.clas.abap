CLASS zcl_00_demo_10 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flight,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
             flight_price  TYPE /dmo/flight_price,
             currency_code TYPE /dmo/currency_code,
           END OF ty_flight.

    DATA flight TYPE z00_flight.

    SELECT SINGLE FROM /dmo/flight
      FIELDS carrier_id, connection_id, flight_date, price, currency_code
      WHERE carrier_id = 'LH'
*      INTO @DATA(flight). " Inline Deklaration
*      INTO CORRESPONDING FIELDS OF @flight. " Kopieren namensgleicher Komponenten
      INTO @flight. " Angabe einer passender Zielvariablen bzw. die Angabe passender Komponenten

    out->write( flight ).
  ENDMETHOD.
ENDCLASS.

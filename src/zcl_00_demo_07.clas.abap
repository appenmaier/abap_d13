CLASS zcl_00_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " SELECT <Spalte 1>, <Spalte 2>, ...
    "   FROM <Datenbankquelle>
    "   WHERE <Bedingung>

    DATA carrier_id    TYPE /dmo/carrier_id VALUE 'LH'.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA flight_price  TYPE /dmo/flight_price.
    DATA flight        TYPE /dmo/flight.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA flight_prices TYPE TABLE OF /dmo/flight_price.
    DATA flights       TYPE TABLE OF /dmo/flight.

    " Lesender Zugriff auf einen Datensatz
    SELECT SINGLE FROM /dmo/flight
      FIELDS price
      WHERE carrier_id = @carrier_id AND connection_id = '0405' AND flight_date = '20240707'
      INTO @flight_price. " INTO @DATA(flight_price).
    IF sy-subrc <> 0.
      out->write( 'nix gefunden' ).
    ENDIF.

    SELECT SINGLE FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = @carrier_id AND connection_id = '0400' AND flight_date = '20240707'
      INTO @flight. " @DATA(flight).

    " Lesender Zugriff auf mehrere Datensätze
    SELECT FROM /dmo/flight
      FIELDS price
      WHERE carrier_id = @carrier_id
      INTO TABLE @flight_prices. " INTO TABLE @DATA(flight_prices).

    SELECT FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @flights.

    out->write( flight ).
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.

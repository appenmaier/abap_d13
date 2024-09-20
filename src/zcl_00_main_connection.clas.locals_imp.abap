CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA connection_counter TYPE i READ-ONLY.

    CLASS-METHODS class_constructor.

    METHODS get_output
      RETURNING VALUE(output) TYPE string_table.

    METHODS constructor
      IMPORTING carrier_id    TYPE /dmo/carrier_id
                connection_id TYPE /dmo/connection_id
      RAISING   cx_abap_invalid_value.

  PRIVATE SECTION.
    TYPES: BEGIN OF st_details,
             DepartureAirport   TYPE /dmo/airport_from_id,
             DestinationAirport TYPE /dmo/airport_to_id,
             AirlineName        TYPE /dmo/carrier_name,
           END OF st_details.

    TYPES: BEGIN OF st_airport,
             AirportID TYPE /dmo/airport_id,
             Name      TYPE /dmo/airport_name,
           END OF st_airport.

    TYPES tt_airports TYPE TABLE OF st_airport.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA details       TYPE st_details.

    CLASS-DATA airports TYPE tt_airports.

ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.
  METHOD class_constructor.
    SELECT FROM /DMO/I_Airport
      FIELDS AirportID, Name
      INTO TABLE @airports.
  ENDMETHOD.

  METHOD get_output.
    FINAL(departure) = airports[ airportid = details-DepartureAirport ].
    FINAL(destination) = airports[ airportid = details-DestinationAirport ].

    APPEND |Carrier ID: { carrier_id }| TO output.
    APPEND |Connection ID: { connection_id }| TO output.
    APPEND |Departure Airport: { departure-airportid } { departure-name }| TO output.
    APPEND |Destination Airport: { destination-airportid } { destination-name }| TO output.
    APPEND |Carrier Name: { details-AirlineName }| TO output.
  ENDMETHOD.

  METHOD constructor.
    IF carrier_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'carrier_id' ).
    ENDIF.

    IF connection_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'connection_id' ).
    ENDIF.

    SELECT SINGLE FROM /DMO/I_Connection
      FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
      WHERE AirlineID = @carrier_id AND ConnectionID = @connection_id
      INTO @details.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.

    me->carrier_id    = carrier_id.
    me->connection_id = connection_id.
    connection_counter += 1.
  ENDMETHOD.
ENDCLASS.

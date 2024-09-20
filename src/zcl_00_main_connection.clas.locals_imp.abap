CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA connection_counter TYPE i READ-ONLY.

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

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA details       TYPE st_details.

ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.
  METHOD get_output.
    APPEND |Carrier ID: { carrier_id }| TO output.
    APPEND |Connection ID: { connection_id }| TO output.
    APPEND |Airport From ID: { details-DepartureAirport }| TO output.
    APPEND |Airport To ID: { details-DestinationAirport }| TO output.
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

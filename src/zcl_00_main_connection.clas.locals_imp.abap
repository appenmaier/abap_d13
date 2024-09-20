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
    DATA carrier_id      TYPE /dmo/carrier_id.
    DATA connection_id   TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id   TYPE /dmo/airport_to_id.

ENDCLASS.


CLASS lcl_connection IMPLEMENTATION.
  METHOD get_output.
    APPEND |Carrier ID: { carrier_id }| TO output.
    APPEND |Connection ID: { connection_id }| TO output.
    APPEND |Airport From ID: { airport_from_id }| TO output.
    APPEND |Airport To ID: { airport_to_id }| TO output.
  ENDMETHOD.

  METHOD constructor.
    IF carrier_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'carrier_id' ).
    ENDIF.

    IF connection_id IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = 'connection_id' ).
    ENDIF.

    SELECT SINGLE FROM /dmo/connection
      FIELDS airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO ( @airport_from_id, @airport_to_id ).
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.

    me->carrier_id    = carrier_id.
    me->connection_id = connection_id.
    connection_counter += 1.
  ENDMETHOD.
ENDCLASS.

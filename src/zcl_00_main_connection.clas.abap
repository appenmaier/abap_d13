CLASS zcl_00_main_connection DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_connection IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    TRY.
        connection = NEW lcl_connection( carrier_id    = 'LH'
                                         connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO DATA(x).
    ENDTRY.

    TRY.
        connection = NEW lcl_connection( carrier_id    = 'LH'
                                         connection_id = '0401' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO x.
    ENDTRY.

    TRY.
        connection = NEW lcl_connection( carrier_id    = 'UA'
                                         connection_id = '1537' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO x.
    ENDTRY.

    TRY.
        connection = NEW lcl_connection( carrier_id    = 'UA'
                                         connection_id = '0000' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

    out->write( lcl_connection=>connection_counter ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_00_main_vehicle DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_vehicle IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO lcl_vehicle. " Vehicle vehicle;
    DATA vehicles TYPE TABLE OF REF TO lcl_vehicle.                      " List<Vehicle> vehicles = new ArrayList<>();

    vehicle = NEW #( make  = 'Porsche'
                     model = '911' ). " vehicle = new Vehicle("Porsche", "911");
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Audi'
                     model = 'A4' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Opel'
                     model = 'Zafira Life' ).
    APPEND vehicle TO vehicles.

    LOOP AT vehicles INTO vehicle.
      out->write( vehicle->to_string( ) ).
      out->write( |Hersteller: { vehicle->make }| ).
    ENDLOOP.

    vehicles[ 1 ]->accelerate( 50 ).
    TRY.
        vehicles[ 1 ]->brake( ).
        vehicles[ 2 ]->brake( 150 ).
      CATCH cx_abap_invalid_value INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( vehicles ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_00_demo_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA flight_date TYPE /dmo/flight_date VALUE '20240917'.
    DATA carrier_id  TYPE /dmo/carrier_id  VALUE 'LH'.

    "-----
    " Verzweigungen
    "-----
    " Logische Operatoren: AND, OR, NOT
    " Vergleichsoperatoren: <, <=, >, >=, =, <>
    IF ( flight_date >= '20240101' AND flight_date < '20250101' ) OR carrier_id <> 'AA'.
      out->write( 'IF 1 erfüllt' ).
    ELSE.
      out->write( 'IF 1 nicht erfüllt' ).
    ENDIF.

    IF flight_date BETWEEN '20240101' AND '20241231'.
      out->write( 'IF 2 erfüllt' ).
    ENDIF.

    carrier_id = ' '.
    IF carrier_id IS INITIAL. " carrier_id = ''.
      out->write( 'IF 3 erfüllt' ).
    ENDIF.

    out->write( COND #( WHEN flight_date BETWEEN '20240101' AND '20241231'
                        THEN 'COND erfüllt'
                        ELSE 'COND nicht erfüllt' ) ).

    "-----
    " Fallunterscheidungen
    "-----
    carrier_id = 'lH'.
    CASE carrier_id.
      WHEN 'lh' OR 'lH' OR 'Lh' OR 'LH'.
        out->write( 'Lufthansa' ).
      WHEN 'aa' OR 'Aa' OR 'aA' OR 'AA'.
        out->write( 'American Airlines' ).
      WHEN OTHERS.
        out->write( carrier_id ).
    ENDCASE.

    out->write( SWITCH #( carrier_id
                          WHEN 'lh' OR 'lH' OR 'Lh' OR 'LH' THEN 'Lufthansa'
                          WHEN 'aa' OR 'Aa' OR 'aA' OR 'AA' THEN 'American Airlines'
                          ELSE                                   carrier_id ) ).
  ENDMETHOD.
ENDCLASS.

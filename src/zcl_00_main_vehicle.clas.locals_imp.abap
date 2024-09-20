"! <strong>Fahrzeug</strong>
CLASS lcl_vehicle DEFINITION.

  PUBLIC SECTION.
    "! Hersteller
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    " public void accelerate(int value) { speedInKmh += value; }
    "! Beschleunigt das Fahrzeug um den eingehenden Wert
    "! @parameter value | eingehender Wert (Default: 50)
    METHODS accelerate
      IMPORTING !value TYPE i DEFAULT 50.

    " public void brake(int value) throws InvalidValueException {
    "   if (value > speedInKmh) {
    "     throw new InvalidValueException();
    "   }
    "
    "   speedInkmh -= value;
    " }
    "! Bremst das Fahrzeug um den eingehenden Wert ab
    "! @parameter value | eingehender Wert (Default: 50)
    "! @raising cx_abap_invalid_value | eingehender Wert zu hoch
    METHODS brake
      IMPORTING !value TYPE i DEFAULT 50
      RAISING   cx_abap_invalid_value.

    " public String toString() { return make + ", " + model + ", " + speedInKmh + "kmh"; }
    METHODS to_string
      RETURNING VALUE(dummy) TYPE string.

    " public Vehicle(String make, String model) { this.make = make; this.model = model; }
    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    CLASS-METHODS class_constructor.

    " public String getMake() { return make; }
    METHODS get_make
      RETURNING VALUE(make) TYPE string.

ENDCLASS.


CLASS lcl_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD to_string.
    dummy = |{ make } { model } ({ speed_in_kmh }kmh)|.
    " return |{ make } { model } ({ speed_in_kmh }kmh)|.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.
  ENDMETHOD.

  METHOD get_make.
    make = me->make.
*    RETURN me->make.
  ENDMETHOD.

  METHOD class_constructor.

  ENDMETHOD.
ENDCLASS.

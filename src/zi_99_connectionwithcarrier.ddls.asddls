@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection with Carrier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_99_ConnectionWithCarrier
  as select from /dmo/connection as Connection
  association [1..1] to /dmo/carrier as _Carrier on  Connection.carrier_id = _Carrier.carrier_id
  association [0..*] to /dmo/flight  as _Flights on  Connection.carrier_id    = _Flights.carrier_id
                                                 and Connection.connection_id = _Flights.connection_id
{
  key Connection.carrier_id      as CarrierId,
  key Connection.connection_id   as ConnectionId,
      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,

      _Carrier,
      _Flights
}

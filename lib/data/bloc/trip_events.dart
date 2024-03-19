abstract class TripsEvent {}

class FindTripsEvent extends TripsEvent {
  final String departurePlace;
  final String destinationPlace;
  final String departureDate;
  FindTripsEvent(
      {required this.departureDate,
      required this.departurePlace,
      required this.destinationPlace});
}

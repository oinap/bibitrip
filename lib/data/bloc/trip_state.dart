abstract class TripsState {}

class TripsInitialState extends TripsState {}

class TripsLoadingState extends TripsState {}

class TripsSuccessState extends TripsState {
  final List<Map<String, dynamic>> tripDetails;
  TripsSuccessState({required this.tripDetails});
}

class TripsErrorState extends TripsState {
  final String errorMessage;
  TripsErrorState({required this.errorMessage});
}

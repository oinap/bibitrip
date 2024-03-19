import 'package:bibitrip_hometask/data/bloc/trip_events.dart';
import 'package:bibitrip_hometask/data/bloc/trip_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  TripsBloc() : super(TripsInitialState()) {
    on<FindTripsEvent>(_onFindTrips);
  }
  Future<void> _onFindTrips(
      FindTripsEvent event, Emitter<TripsState> emit) async {
    emit(TripsLoadingState());
    final dio = Dio();
    List<Map<String, dynamic>> tripsDetails = [];
    Response response;
    try {
      response = await dio.get(
          'https://bibiptrip.com/api/avibus/search_trips_cities/?departure_city=${event.departurePlace}&destination_city=${event.destinationPlace}&date=${event.departureDate}');

      for (var trip in response.data['trips']) {
        Map<String, dynamic> detail = {
          'Duration': trip['Duration'],
          'DepartureTime': trip['DepartureTime'],
          'ArrivalTime': trip['ArrivalTime'],
          'PassengerFareCost': trip['PassengerFareCost'],
          'FreeSeatsAmount': trip['FreeSeatsAmount'],
          'Model': trip['Bus']['Model'], // Assuming 'Model' is under 'Bus'
          'StatusPrint': trip['StatusPrint'],
        };
        tripsDetails.add(detail);
      }
      emit(TripsSuccessState(tripDetails: tripsDetails));
    } catch (error) {
      emit(TripsErrorState(errorMessage: error.toString()));
    }
  }
}

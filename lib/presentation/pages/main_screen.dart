import 'package:bibitrip_hometask/data/bloc/trip_bloc.dart';
import 'package:bibitrip_hometask/data/bloc/trip_events.dart';
import 'package:bibitrip_hometask/data/bloc/trip_state.dart';

import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';
import 'package:bibitrip_hometask/presentation/ui_components/date_picker.dart';
import 'package:bibitrip_hometask/presentation/ui_components/search_text_field.dart';
import 'package:bibitrip_hometask/presentation/ui_components/trip_card.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _departureDate;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Поиск Поездок',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.filter_alt_rounded))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: Image.asset(
                  'assets/images/trip.png',
                  height: 150,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      width: screenWidth * 0.7,
                      child: SearchTextField(
                        controller: _fromController,
                        hintText: 'Откуда',
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: screenWidth * 0.7,
                      child: SearchTextField(
                        controller: _toController,
                        hintText: 'Куда',
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
              onPressed: () async {
                DateTime? selectedDate = await selectDate(context);
                setState(() {
                  _departureDate = selectedDate;
                });
              },
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.date_range),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _departureDate == null
                        ? 'Выбрать дату'
                        : DateFormat('dd.MM.yyyy').format(_departureDate!),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CupertinoButton(
                color: brandColor,
                onPressed: () {
                  // show alert if date is not selected

                  if (_departureDate == null) {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => const CupertinoAlertDialog(
                              content: Text('Выберите Дату Поездки'),
                            ));
                  } else {
                    //dispatch findtripsevent
                    context.read<TripsBloc>().add(FindTripsEvent(
                        departureDate:
                            DateFormat('yyyy-MM-dd').format(_departureDate!),
                        departurePlace: _fromController.text,
                        destinationPlace: _toController.text));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Найти',
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              height: 300,
              width: screenWidth,
              color: dimmerColor,
              padding: const EdgeInsets.all(20),
              child:
                  BlocBuilder<TripsBloc, TripsState>(builder: (context, state) {
                if (state is TripsInitialState) {
                  return SizedBox(
                    height: 300,
                    width: screenWidth,
                  );
                } else if (state is TripsLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is TripsSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      //on refresh dispatch bloc event again
                      context.read<TripsBloc>().add(FindTripsEvent(
                          departureDate:
                              DateFormat('yyyy-MM-dd').format(_departureDate!),
                          departurePlace: _fromController.text,
                          destinationPlace: _toController.text));
                    },
                    child: ListView.builder(
                        itemCount: state.tripDetails.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> trip = state.tripDetails[index];

// calculate how many days pass between departure and arrival
                          int duration =
                              int.parse(trip['ArrivalTime']!.substring(8, 10)) -
                                  int.parse(
                                      trip['DepartureTime']!.substring(8, 10));
                          return
                              // return cards with info on all trips
                              Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TripCard(
                                screenWidth: screenWidth,
                                arrivalTime:
                                    trip['ArrivalTime']!.substring(11, 16),
                                availableSeats:
                                    trip['FreeSeatsAmount']!.toString(),
                                days: duration.toString(),
                                departureTime:
                                    trip['DepartureTime']!.substring(11, 16),
                                price: trip['PassengerFareCost']!.toString(),
                                route:
                                    '${_fromController.text} → ${_toController.text}'),
                          );
                        }),
                  );
                } else if (state is TripsErrorState) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const Text('Unexpected state');
                }
              }),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fromController.dispose();
    _toController.dispose();
  }
}

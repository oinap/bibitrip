import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final double screenWidth;
  final String departureTime;
  final String arrivalTime;
  final String route;
  final String days;
  final String availableSeats;
  final String price;
  const TripCard(
      {required this.screenWidth,
      required this.arrivalTime,
      required this.availableSeats,
      required this.days,
      required this.departureTime,
      required this.price,
      required this.route,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 130,
        width: screenWidth * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  departureTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  route,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  arrivalTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  // if the arrival is on the same do not show that 0 days have past
                  days == '0' ? '' : ' +$daysд',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.blueGrey.shade900),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'осталось $availableSeats мест',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 12),
                ),
                const SizedBox(
                  width: 100,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: brandColor),
                  child: Text(
                    '$price₽',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

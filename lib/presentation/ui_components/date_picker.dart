import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Initial date to show
    firstDate: DateTime(2000), // Earliest allowable date
    lastDate: DateTime(2025), // Latest allowable date
  );
  if (picked != null) {
    // Use the picked date
    return picked;
  } else {
    return null;
  }
}

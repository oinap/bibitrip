import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// constant colors and styles
const Color brandColor = Color.fromRGBO(36, 187, 156, 1);
Color plainColor = Colors.blueGrey.shade900;
const Color dimColor = Color.fromRGBO(244, 244, 244, 1);
const Color dimmerColor = Color.fromRGBO(240, 240, 240, 1);

// define app theme
ThemeData appTheme = ThemeData(
    useMaterial3: true,
    primaryColor: brandColor,
    textTheme: TextTheme(
        displayLarge:
            GoogleFonts.lato(color: Colors.blueGrey.shade800, fontSize: 20),
        displayMedium: GoogleFonts.kumbhSans(color: Colors.white, fontSize: 25),
        bodyMedium: GoogleFonts.lato(
            color: Colors.blueGrey.shade900,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontStyle: FontStyle.italic)),
    buttonTheme: ButtonThemeData(
        buttonColor: brandColor, disabledColor: Colors.blueGrey.shade200),
    toggleButtonsTheme: ToggleButtonsThemeData(
        borderColor: brandColor,
        borderWidth: 2,
        selectedBorderColor: brandColor,
        borderRadius: BorderRadius.circular(40),
        textStyle:
            GoogleFonts.lato(color: Colors.blueGrey.shade800, fontSize: 15),
        color: plainColor,
        selectedColor: Colors.white,
        fillColor: brandColor));

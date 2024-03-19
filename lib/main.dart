import 'package:bibitrip_hometask/presentation/pages/splash_screen.dart';
import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const BibiSplashScreen());
  }
}

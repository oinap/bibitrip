import 'package:bibitrip_hometask/presentation/pages/auth_screen.dart';
import 'package:flutter/material.dart';

class BibiSplashScreen extends StatefulWidget {
  const BibiSplashScreen({super.key});

  @override
  State<BibiSplashScreen> createState() => _BibiSplashScreenState();
}

class _BibiSplashScreenState extends State<BibiSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Wait for 1 second
    await Future.delayed(const Duration(seconds: 1));
    // Navigate to the main screen
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(97, 182, 171, 1),
      body: Center(
        child: Image.asset('assets/images/splash_screen_bibitrip.png'),
      ),
    );
  }
}

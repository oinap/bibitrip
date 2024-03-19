import 'package:bibitrip_hometask/data/bloc/trip_bloc.dart';
import 'package:bibitrip_hometask/domain/url_launch.dart';
import 'package:bibitrip_hometask/presentation/pages/main_screen.dart';
import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';
import 'package:bibitrip_hometask/presentation/ui_components/login_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // to expand the column width
            SizedBox(
              height: 80,
              width: screenWidth,
            ),
            SizedBox(
                width: screenWidth * 0.7,
                child: Image.asset('assets/images/BibiTrip.png')),
            SizedBox(
                width: screenWidth * 0.4,
                child: Image.asset('assets/images/car.png')),
            const SizedBox(
              height: 60,
            ),
            const LoginTextField(
              hintText: 'Login',
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const LoginTextField(
              hintText: 'Password',
              isPassword: true,
            ),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton(
                color: brandColor,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => BlocProvider<TripsBloc>(
                            create: (context) => TripsBloc(),
                            child: const MainScreen(),
                          ))));
                },
                child: Text('Get Started',
                    style: Theme.of(context).textTheme.displayMedium)),
            const SizedBox(
              height: 100,
            ),
            IconButton(
              onPressed: () {
                willLaunchUrl('https://www.google.com');
              },
              icon: Text('Terms and Conditions',
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            IconButton(
                onPressed: () {
                  willLaunchUrl('https://www.youtube.com');
                },
                icon: Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.displayLarge,
                ))
          ]),
    );
  }
}

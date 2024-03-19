import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String hintText;

  final bool isPassword;

  final double screenWidth;
  const LoginTextField({
    super.key,
    required this.isPassword,
    required this.hintText,
    this.screenWidth = 400,
  });

  @override
  State<LoginTextField> createState() => _LoginTestFieldState();
}

class _LoginTestFieldState extends State<LoginTextField> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.1),
      child: TextField(
        obscureText: _obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: brandColor, width: 2),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: widget.isPassword
                ? const Icon(Icons.password)
                : const Icon(Icons.email),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: _obscureText == false
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))
                : const SizedBox()),
      ),
    );
  }
}

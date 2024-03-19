import 'package:bibitrip_hometask/presentation/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final dynamic controller;
  const SearchTextField(
      {required this.hintText, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: hintText,
      padding: const EdgeInsets.all(20),
      suffix: const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.my_location,
          color: brandColor,
        ),
      ),
      decoration: BoxDecoration(
          color: dimColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}

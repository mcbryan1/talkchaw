import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF713ffe);
const kPrimaryTextColor = Color(0xFF4e4f4e);
const kSecondaryTextColor = Color(0xFFc9c8c8);
const kPrimaryDarkColor = Color(0xFF0b0056);
const kBackgroundColor = Color(0xFFfafafa);
const kAppBgColorDark = Colors.black;
const kAppBgColorLight = Colors.white;

// Next Screen
void nextScreen(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

// Next Screen Replacement
void nextScreenReplace(context, screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

// Input Decoration

const textInputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryDarkColor, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

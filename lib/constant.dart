import 'package:flutter/material.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

const kPrimaryColor = Color.fromARGB(255, 0, 160, 172);
const kPrimaryTextColor = Color(0xFF4e4f4e);
const kSecondaryTextColor = Color(0xFFc9c8c8);
const kPrimaryDarkColor = Color(0xFF00666D);
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
    borderSide: BorderSide(color: kPrimaryTextColor, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
);

// Snackbar

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: TalkChawText(
        text: message,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Okay',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

void showSnackbarWithoutAction(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: TalkChawText(
        text: message,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}
// Loading


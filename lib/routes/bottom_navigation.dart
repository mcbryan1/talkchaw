// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/screens/major_screens/calls/calls.dart';
import 'package:talkchaw/screens/major_screens/chats/chats.dart';
import 'package:talkchaw/screens/major_screens/connect/connect.dart';
import 'package:talkchaw/screens/major_screens/settings/settings.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Connect(),
    const Calls(),
    const Chats(),
    const Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        iconSize: 30,
        // Check the theme of the app
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryDarkColor,
        selectedItemColor: kPrimaryColor,
        selectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              // background color and radius

              decoration: BoxDecoration(
                color: _currentIndex == 0 ? kPrimaryColor : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                Icons.public,
                color: _currentIndex == 0
                    ? Colors.white
                    : const Color.fromARGB(255, 97, 93, 93),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              // background color and radius

              decoration: BoxDecoration(
                color: _currentIndex == 1 ? kPrimaryColor : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(Icons.phone,
                  // Change colors based on index
                  color: _currentIndex == 1
                      ? Colors.white
                      : const Color.fromARGB(255, 97, 93, 93)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              // background color and radius

              decoration: BoxDecoration(
                color: _currentIndex == 2 ? kPrimaryColor : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(Icons.message_rounded,
                  color: _currentIndex == 2
                      ? Colors.white
                      : const Color.fromARGB(255, 97, 93, 93)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _currentIndex == 3 ? kPrimaryColor : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                Icons.settings,
                color: _currentIndex == 3
                    ? Colors.white
                    : const Color.fromARGB(255, 97, 93, 93),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

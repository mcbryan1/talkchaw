import 'package:flutter/material.dart';
import 'package:talkchaw/routes/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BottomNavigation());
  }
}

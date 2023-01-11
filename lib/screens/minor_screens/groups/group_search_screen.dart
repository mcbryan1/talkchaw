import 'package:flutter/material.dart';

class GroupSearchScreen extends StatelessWidget {
  const GroupSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Search Screen"),
      ),
      body: const Center(child: Text("Group Search Screen")),
    );
  }
}

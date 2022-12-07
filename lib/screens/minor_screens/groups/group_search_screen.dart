import 'package:flutter/material.dart';

class GroupSearchScreen extends StatelessWidget {
  const GroupSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Search Screen"),
      ),
      body: Container(
        child: Center(child: Text("Group Search Screen")),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GroupChatScreen extends StatelessWidget {
  final String groupName;
  final String groupDescription;
  final String groupId;
  final String firstName;
  final String lastName;
  final String createdAt;

  const GroupChatScreen({
    Key? key,
    required this.groupName,
    required this.groupDescription,
    required this.groupId,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: Container(
        child: Text("Group Chat Screen"),
      ),
    );
  }
}

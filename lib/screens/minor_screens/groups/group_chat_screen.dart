import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/screens/minor_screens/groups/group_info_screen.dart';
import 'package:talkchaw/services/database_service.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class GroupChatScreen extends StatefulWidget {
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
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  String admin = "";
  Stream<QuerySnapshot>? chats;

  @override
  void initState() {
    getChatAndAdmin();
    super.initState();
  }

  getChatAndAdmin() {
    DatabaseService().getChats(widget.groupId).then((value) {
      setState(() {
        chats = value;
      });
    });

    DatabaseService().getGroupAdmin(widget.groupId).then((value) {
      setState(() {
        admin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kAppBgColorDark
            : kBackgroundColor,
        elevation: 0.0,
        title: TalkChawText(
          text: widget.groupName,
          fontSize: 28,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : kPrimaryDarkColor,
          fontWeight: FontWeight.w400,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : kPrimaryDarkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Group Info
          IconButton(
            icon: Icon(
              Icons.info,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : kPrimaryDarkColor,
            ),
            onPressed: () {
              nextScreen(
                  context,
                  GroupInfoScreen(
                    groupId: widget.groupId,
                    groupName: widget.groupName,
                    groupDescription: widget.groupDescription,
                    createdAt: widget.createdAt,
                    adminName: admin,
                  ));
            },
          ),
        ],
      ),
      body: const Text("Group Chat Screen"),
    );
  }
}

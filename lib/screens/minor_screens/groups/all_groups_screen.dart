import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/screens/major_screens/groups/widget/all_groups_tile.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class AllGroupsScreen extends StatelessWidget {
  const AllGroupsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _groups =
        FirebaseFirestore.instance.collection('groups');

    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kAppBgColorDark
            : kBackgroundColor,
        elevation: 0.0,
        title: TalkChawText(
          text: 'All Groups',
          fontSize: 35,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : kPrimaryDarkColor,
          fontWeight: FontWeight.w300,
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
      ),
      body: Container(
        decoration: BoxDecoration(
          // Color based on theme
          color: Theme.of(context).brightness == Brightness.dark
              ? kAppBgColorDark
              : kBackgroundColor,
        ),
        child: StreamBuilder(
          stream: _groups.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return AllGroupsTile(
                  groupName: data['groupName'],
                  groupDescription: data['groupDescription'],
                  groupId: data['groupId'],
                  // createdAt: data['createdAt'].toString(),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

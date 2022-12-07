// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/helpers/helper.dart';
import 'package:talkchaw/screens/major_screens/groups/widget/group_tile.dart';
import 'package:talkchaw/services/auth_service.dart';
import 'package:talkchaw/services/database_service.dart';
import 'package:talkchaw/widgets/appbar/talk_chaw_appbar.dart';
import 'package:talkchaw/widgets/button/loading_button.dart';
import 'package:talkchaw/widgets/button/talk_chaw_button.dart';
import 'package:talkchaw/widgets/empty/empty.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  String firstName = "";
  String lastName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;
  String groupName = "";
  String groupDescription = "";
  // Created At
  String createdAt = "";
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await HelperFunctions.getUserFirstNameSharedPreference()
        .then((value) => setState(() {
              firstName = value!;
            }));
    await HelperFunctions.getUserLastNameSharedPreference()
        .then((value) => setState(() {
              lastName = value!;
            }));
    await HelperFunctions.getUserEmailSharedPreference()
        .then((value) => setState(() {
              email = value!;
            }));

    // Getting list of groups from db
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  // String Manipulation
  String getId(String response) {
    return response.substring(0, response.indexOf("_"));
  }

  String getName(String response) {
    return response.substring(response.indexOf("_") + 1, response.indexOf("-"));
  }

  String getDescription(String response) {
    return response.substring(response.indexOf("-") + 1);
  }

  String getCreatedAt(String response) {
    // Get response after _ and - and before /
    return response.substring(
      response.indexOf("/") + 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get size of screen
    return Scaffold(
      appBar: const TalkChawAppbar(
        title: 'Groups',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      backgroundColor: kPrimaryDarkColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FloatingActionButton(
          onPressed: () {
            popUpDialog(context);
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 15, left: 8, right: 8),
        child: Container(
          decoration: BoxDecoration(
            // Color based on theme
            color: Theme.of(context).brightness == Brightness.dark
                ? kAppBgColorDark
                : kAppBgColorLight,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: groupList(),
        ),
      ),
    );
  }

  groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        // If data is fetching
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: kPrimaryDarkColor,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryDarkColor),
            ),
          );
        } else {
          // If there are no groups
          if (snapshot.data['groups'] == null) {
            return Center(
                child: Empty(
              text:
                  'You are not a member of any group yet. Join a group by tapping on the search icon or create a new one by tapping on the add button',
            ));
          } else {
            // If there are no groups
            if (snapshot.data['groups'].length == 0) {
              return Center(
                child: Empty(
                  text:
                      'You are not a member of any group yet. Join a group by tapping on the search icon or create a new one by tapping on the add button',
                ),
              );
            } else {
              // If there are groups
              return ListView.builder(
                  itemCount: snapshot.data['groups'].length,
                  itemBuilder: ((context, index) {
                    // Reverse index
                    int reverseIndex =
                        snapshot.data['groups'].length - index - 1;
                    return GroupTile(
                        groupName:
                            getName(snapshot.data['groups'][reverseIndex]),
                        groupDescription: getDescription(
                            snapshot.data['groups'][reverseIndex]),
                        groupId: getId(snapshot.data['groups'][reverseIndex]),
                        createdAt:
                            getCreatedAt(snapshot.data['groups'][reverseIndex]),
                        firstName: snapshot.data['firstName'],
                        lastName: snapshot.data['lastName']);
                  }));
            }
          }
        }
      },
    );
  }

  popUpDialog(BuildContext context) {
    // Show a bottom SHeet
    showBottomSheet(
        context: context,
        builder: (context) {
          // Get size of screen
          Size size = MediaQuery.of(context).size;
          return StatefulBuilder(
            builder: ((context, setState) {
              return Container(
                height: size.height * 0.45,
                color: kPrimaryDarkColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TalkChawText(
                          text: 'Create a new group',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter group name';
                            }
                            return null;
                          },
                          style: const TextStyle(height: 1.5),
                          decoration: textInputDecoration.copyWith(
                            labelText: 'Group name',
                          ),
                          onChanged: (value) {
                            setState(() {
                              groupName = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter group description';
                            }
                            return null;
                          },
                          style: const TextStyle(height: 1.5),
                          decoration: textInputDecoration.copyWith(
                            labelText: 'Group description',
                          ),
                          onChanged: (value) {
                            setState(() {
                              groupDescription = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        isLoading == true
                            ? const LoadingButton()
                            : TalkChawButton(
                                borderRadius: 5,
                                text: 'Create Group',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    // Create a new group
                                    await DatabaseService(
                                            uid: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .createGroup(
                                          groupName,
                                          groupDescription,
                                          firstName,
                                          lastName,
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                          DateTime.now(),
                                        )
                                        .whenComplete(() => {
                                              setState(() {
                                                isLoading = false;
                                              })
                                            });
                                    Navigator.pop(context);
                                    showSnackbar(context, Colors.green,
                                        'Group Created Successfully');
                                  }
                                })
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}

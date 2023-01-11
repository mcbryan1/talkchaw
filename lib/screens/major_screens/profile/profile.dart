// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/helpers/helper.dart';
import 'package:talkchaw/screens/major_screens/auth/login.dart';
import 'package:talkchaw/screens/major_screens/profile/components/profile_info.dart';
import 'package:talkchaw/services/auth_service.dart';
import 'package:talkchaw/widgets/appbar/talk_chaw_appbar.dart';
import 'package:talkchaw/widgets/line/line.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String initials = '';
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    getUserData();
    // getInitials();
  }

  getUserData() async {
    await HelperFunctions.getUserFirstNameSharedPreference().then((value) => {
          setState(() {
            firstName = value!;
          })
        });

    await HelperFunctions.getUserLastNameSharedPreference().then((value) => {
          setState(() {
            lastName = value!;
          })
        });

    await HelperFunctions.getUserEmailSharedPreference().then((value) => {
          setState(() {
            email = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const TalkChawAppbar(title: 'Profile'),
      backgroundColor: kPrimaryDarkColor,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile image
                const SizedBox(height: 20),
                Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kPrimaryTextColor
                            : kPrimaryDarkColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        // Display the initials

                        child: Image.network(
                          "https://ui-avatars.com/api/?rounded=true&name=$firstName&size=${size.width * 0.41}",
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                // Profile name

                ProfileInfo(
                  title: 'First Name:',
                  value: firstName,
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                // Line
                const Line(),
                const SizedBox(height: 20),
                ProfileInfo(
                  title: 'Last Name:',
                  value: lastName,
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                const Line(),
                const SizedBox(height: 20),
                ProfileInfo(
                  title: 'Email:',
                  value: email,
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                const Line(),
                const SizedBox(height: 20),
                ProfileInfo(
                  title: 'Logout',
                  value: '',
                  titleColor: Colors.red,
                  iconColor: Colors.red,
                  icon: Icons.logout,
                  onTap: () {
                    // show alert dialog
                    logoutMethod(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logoutMethod(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TalkChawText(
            text: 'Logout',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: const TalkChawText(
            text: 'Are you sure you want to logout?',
            fontSize: 16,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const TalkChawText(
                text: 'Cancel',
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            TextButton(
              onPressed: () async {
                await authService.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false);
              },
              child: const TalkChawText(
                text: 'Logout',
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}

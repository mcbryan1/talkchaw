import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/services/auth_service.dart';
import 'package:talkchaw/widgets/appbar/talk_chaw_appbar.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TalkChawText(
                  text: 'Profile',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    authService.signOut();
                  },
                  child: const Text('Sign Out'),
                ),

                // const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    authService.deleteAccount();
                  },
                  child: const Text('Delete Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/appbar/chat_appbar.dart';
import 'package:talkchaw/widgets/input/talk_chaw_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: ChatAppbar(
        title: 'Chat',
      ),
      // Chat screen
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 40, 40, 40)
                          : kBackgroundColor,
                    ),
                    child: SingleChildScrollView())),
            // Chat input
            Container(
              padding: const EdgeInsets.all(8),
              color: kPrimaryDarkColor,
              height: 110,
              width: double.infinity,
              child: TalkChawInputField(
                height: 110,
                hintText: 'Search Chats',
                icon: Icons.search_sharp,
                iconColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : const Color.fromARGB(255, 182, 182, 182),
                // borderRadius: const BorderRadius.all(Radius.circular(30)),
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

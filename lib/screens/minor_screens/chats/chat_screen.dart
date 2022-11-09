import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/appbar/chat_appbar.dart';
import 'package:talkchaw/widgets/input/talk_chaw_input.dart';

class ChatScreen extends StatelessWidget {
  final Map<String, dynamic> chat;
  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: ChatAppbar(
        title: chat['name'],
        avatar: chat['avatar'],
        isOnline: chat['isOnline'],
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
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Flexible(
                      child: TalkChawInputField(
                        height: 90,
                        hintText: 'Type Here',
                        borderRadius: BorderRadius.circular(50),
                        iconColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : const Color.fromARGB(255, 182, 182, 182),
                        // borderRadius: const BorderRadius.all(Radius.circular(30)),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

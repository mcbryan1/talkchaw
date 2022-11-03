import 'package:flutter/material.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TalkChawText(text: 'Chats'),
      ),
    );
  }
}

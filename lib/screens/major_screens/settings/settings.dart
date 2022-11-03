import 'package:flutter/material.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TalkChawText(text: 'Settings'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TalkChawText(text: 'Connect'),
      ),
    );
  }
}

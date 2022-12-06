import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Empty extends StatelessWidget {
  String? text;
  Empty({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty.png',
          height: 300,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TalkChawText(
            text: text ?? 'No data found',
            fontSize: 20,
            color: kPrimaryTextColor,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

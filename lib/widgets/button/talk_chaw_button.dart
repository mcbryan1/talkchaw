import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class TalkChawButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final Color color;
  final Color textColor;
  final InteractiveInkFeatureFactory? factory;

  const TalkChawButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height = 60,
      this.factory,
      this.color = kPrimaryColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        // Add border radius

        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height / 2),
                  side: const BorderSide(color: kPrimaryColor))),
          splashFactory: factory,
          // Add Shadow
          shadowColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: TalkChawText(
          text: text,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

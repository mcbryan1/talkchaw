import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class ProfileInfo extends StatelessWidget {
  String title;
  String value;
  IconData icon;
  IconData? trailingIcon;
  VoidCallback? onTap;
  Color? titleColor;
  Color? iconColor;
  ProfileInfo(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      this.trailingIcon,
      this.onTap,
      this.titleColor,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor ??
                (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : kPrimaryDarkColor),
          ),
          const SizedBox(width: 10),
          TalkChawText(
            text: title,
            color: titleColor ??
                (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : kPrimaryDarkColor),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(width: 5),
          TalkChawText(
            text: value,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : kPrimaryDarkColor,
            fontSize: 16,
            // fontWeight: FontWeight.w500,
          ),
          if (trailingIcon != null)
            Icon(
              trailingIcon,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : kPrimaryDarkColor,
            ),
        ],
      ),
    );
  }
}

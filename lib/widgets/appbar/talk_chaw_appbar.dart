import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class TalkChawAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TalkChawAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: AppBar(
        // Remove back icon
        automaticallyImplyLeading: false,
        title: TalkChawText(
          text: title,
          fontSize: 35,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : kPrimaryDarkColor,
          fontWeight: FontWeight.w300,
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kAppBgColorDark
            : kBackgroundColor,
        elevation: 0.0,
        // centerTitle: true,
      ),
    );
  }
}

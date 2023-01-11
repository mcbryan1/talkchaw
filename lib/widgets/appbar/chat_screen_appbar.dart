import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class ChatScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? groupName;
  final String? groupDescription;
  final String? groupId;
  final String? firstName;
  final String? lastName;
  final String? createdAt;

  const ChatScreenAppbar({
    Key? key,
    this.groupName,
    this.groupDescription,
    this.groupId,
    this.firstName,
    this.lastName,
    this.createdAt,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kAppBgColorDark
          : kBackgroundColor,
      elevation: 0.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TalkChawText(
            text: groupName!,
            fontSize: 28,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : kPrimaryDarkColor,
            fontWeight: FontWeight.w400,
          ),
          TalkChawText(
            text: "Admin: $firstName$lastName",
            fontSize: 14,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : kPrimaryDarkColor,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : kPrimaryDarkColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        // Group Info

        // IconButton(
        //   icon: Icon(
        //     Icons.info,
        //     color: Theme.of(context).brightness == Brightness.dark
        //         ? Colors.white
        //         : kPrimaryDarkColor,
        //   ),
        //   onPressed: () {
        //     nextScreen(context, GroupInfoScreen(
        //       groupId: groupId!,
        //       groupName: groupName!,
        //       groupDescription: groupDescription!,
        //       createdAt: createdAt!,
        //       adminName: ,
        //     ));
        //   },
        // ),
      ],
    );
  }
}

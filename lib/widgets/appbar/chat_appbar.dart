import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const ChatAppbar({Key? key, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: AppBar(
        leading:
            // Back button
            Platform.isIOS
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey,
                    onPressed: () => Navigator.pop(context),
                  )
                : IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.grey,
                    onPressed: () => Navigator.pop(context),
                  ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/man1.png'),
            ),
            // Green container showing online at bottom right
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(50)),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TalkChawText(
                  text: title!,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : kPrimaryTextColor,
                ),
                const TalkChawText(
                  text: 'Active now',
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Call button
          IconButton(
            icon: const Icon(Icons.call),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey,
            onPressed: () {},
          ),
          // Video call button
          IconButton(
            icon: const Icon(Icons.videocam),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey,
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 40, 40, 40)
            : kBackgroundColor,
        elevation: 0.0,
        // centerTitle: true,
      ),
    );
  }
}

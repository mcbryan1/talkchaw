import 'package:flutter/material.dart';
import 'package:talkchaw/screens/minor_screens/chats/chat_screen.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class ChatCard extends StatelessWidget {
  String name;
  String lastMessage;
  String time;
  String avatar;
  bool isOnline;
  bool isGroup;
  bool hasUnreadMessage;
  String? unreadMessageCount;
  ChatCard(
      {Key? key,
      required this.name,
      required this.lastMessage,
      required this.time,
      required this.avatar,
      required this.isOnline,
      required this.isGroup,
      required this.hasUnreadMessage,
      this.unreadMessageCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Chat Screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 40, 40, 40)
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              height: 60,
              width: 65,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 40, 40, 40)
                    : const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(40),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
              ),
            ),
            isGroup
                ? Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 40, 40, 40)
                          : const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.group,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      size: 15,
                    ),
                  )
                : Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: isOnline ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
            // Group icon

            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TalkChawText(
                    text: name,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TalkChawText(
                    text: lastMessage,
                    fontSize: 13,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: const Color.fromARGB(255, 150, 150, 150),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TalkChawText(
                    text: time,
                    fontSize: 13,
                    color: const Color.fromARGB(255, 150, 150, 150)),
                const SizedBox(
                  height: 5,
                ),
                hasUnreadMessage
                    ? Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: TalkChawText(
                          text: unreadMessageCount!,
                          color: Colors.white,
                        )))
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

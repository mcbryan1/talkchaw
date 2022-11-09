import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/screens/minor_screens/chats/chat_screen.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class ChatCard extends StatelessWidget {
  final Map<String, dynamic> chat;
  // Messages

  ChatCard({
    Key? key,
    required this.chat,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = chat['lastMessageTime'] as Timestamp;
    final DateTime dateTime = timestamp.toDate();
    // Convert dateTime to 24 hour format
    final String time = dateTime.hour > 12
        ? '${dateTime.hour - 12}:${dateTime.minute} PM'
        : '${dateTime.hour}:${dateTime.minute} AM';
    return GestureDetector(
      onTap: () {
        // Navigate to Chat Screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      chat: chat,
                    )));
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
                backgroundImage: NetworkImage(chat['avatar']),
              ),
            ),
            chat['isGroup']
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
                        color: chat['isOnline']
                            ? Colors.green
                            : Colors.transparent,
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
                    text: chat['name'],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TalkChawText(
                    text: chat['lastMessage'],
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
                  // Convert dateTime to 24hours format
                  text: time,
                  fontSize: 13,
                  color: const Color.fromARGB(255, 150, 150, 150),
                ),
                const SizedBox(
                  height: 5,
                ),
                chat['unreadMessages'] > 0
                    ? Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: TalkChawText(
                          text: chat['unreadMessages'].toString(),
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

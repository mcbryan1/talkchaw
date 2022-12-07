import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/screens/minor_screens/groups/group_chat_screen.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';
import 'package:intl/intl.dart';

class AllGroupsTile extends StatelessWidget {
  final String groupName;
  final String groupDescription;
  final String groupId;

  // final String createdAt;

  const AllGroupsTile({
    Key? key,
    required this.groupName,
    required this.groupDescription,
    required this.groupId,
    // required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format Date and time from createdAt
    // final DateTime dateTime = DateTime.parse(createdAt);
    // final DateFormat dateFormat = DateFormat('dd MMMM, yyyy');
    // final String formattedDate = dateFormat.format(dateTime);
    return GestureDetector(
      onTap: () {
        // nextScreen(
        //     context,
        //     GroupChatScreen(
        //         groupName: groupName,
        //         groupDescription: groupDescription,
        //         groupId: groupId,

        //         createdAt: createdAt));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A1A1A)
                : const Color(0xFFE6E6E6),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: TalkChawText(
                        text: groupName[0].toUpperCase(),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 14,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TalkChawText(
                          text: groupName,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TalkChawText(
                          text: groupDescription,
                          fontSize: 13,
                          color: Colors.grey,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(
                width: 10,
              ),
              // Created At

              GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const TalkChawText(
                    text: 'Join',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

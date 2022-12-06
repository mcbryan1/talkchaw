import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class GroupTile extends StatelessWidget {
  final String groupName;
  final String groupDescription;
  final String groupId;
  final String firstName;
  final String lastName;

  const GroupTile({
    Key? key,
    required this.groupName,
    required this.groupDescription,
    required this.groupId,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                width: 10,
              ),
              Column(
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
                    text: "Admin: $firstName $lastName",
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}

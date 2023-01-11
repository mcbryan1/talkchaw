import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class GroupInfoScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String groupDescription;
  final String adminName;
  final String createdAt;

  const GroupInfoScreen({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.groupDescription,
    required this.adminName,
    required this.createdAt,
  }) : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  void initState() {
    getMembers();
    super.initState();
  }

  getMembers() async {}

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(widget.createdAt);
    final DateFormat dateFormat = DateFormat('dd MMMM, yyyy');
    final String formattedDate = dateFormat.format(dateTime);
    final String formattedTime = DateFormat.jm().format(dateTime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kAppBgColorDark
            : kBackgroundColor,
        elevation: 0.0,
        title: TalkChawText(
          text: 'Group Info',
          fontSize: 28,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : kPrimaryDarkColor,
          fontWeight: FontWeight.w400,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : kPrimaryDarkColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TalkChawText(
                          text: widget.groupName.split(' ').length > 1
                              ? '${widget.groupName.split(' ')[0][0].toUpperCase()}${widget.groupName.split(' ')[1][0].toUpperCase()}'
                              : widget.groupName.split(' ')[0][0].toUpperCase(),
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TalkChawText(
                            text: widget.groupName,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : kPrimaryDarkColor,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TalkChawText(
                            text: 'Created on $formattedDate @ $formattedTime',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : kPrimaryDarkColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TalkChawText(
                            text: 'Admin: ${widget.adminName}',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : kPrimaryDarkColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TalkChawText(
                    text: 'Group Description',
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TalkChawText(
                    text: widget.groupDescription,
                    // fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

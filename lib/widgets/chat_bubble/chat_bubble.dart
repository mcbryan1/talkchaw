import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String? text;
  final bool? isSender;
  final String? time;
  final bool? hasRead;
  final bool? showAvatar;
  final String? avatar;
  final bool? isOnline;

  const ChatBubble(
      {Key? key,
      this.text,
      this.isSender,
      this.time,
      this.hasRead,
      this.showAvatar,
      this.avatar,
      this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment:
            isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (showAvatar!)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(avatar!),
                  ),
                  // Green container showing online at bottom right
                  isOnline == true
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                        )
                      : Container(),
                ],
              ),
            ),
          // Chat bubble
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSender!
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft: isSender!
                      ? const Radius.circular(30)
                      : const Radius.circular(0),
                  bottomRight: isSender!
                      ? const Radius.circular(0)
                      : const Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      if (hasRead!)
                        const Icon(
                          Icons.done_all,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 16,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

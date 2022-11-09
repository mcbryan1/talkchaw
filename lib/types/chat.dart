import 'package:talkchaw/types/message.dart';

class Chat {
  final String id;
  final String name;
  final String avatar;
  final bool isGroup;
  final bool isOnline;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadMessages;
  final List<Message> messages;

  Chat({
    required this.id,
    required this.name,
    required this.avatar,
    required this.isGroup,
    required this.isOnline,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadMessages,
    required this.messages,
  });
}

import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/screens/major_screens/chats/widgets/chat_card.dart';
import 'package:talkchaw/widgets/appbar/talk_chaw_appbar.dart';
import 'package:talkchaw/widgets/input/talk_chaw_input.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create A list of Chat Cards
    List<ChatCard> chatCards = [
      ChatCard(
        name: 'Mike Will ',
        lastMessage: 'Hello, how are you doing?',
        time: '12:50',
        avatar:
            'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        isOnline: true,
        isGroup: false,
        hasUnreadMessage: true,
        unreadMessageCount: '5',
      ),
      ChatCard(
          name: 'Michaella Simpson',
          lastMessage: "I'll be visiting tomorrow. Yay!!!",
          time: '12:23',
          avatar:
              'https://plus.unsplash.com/premium_photo-1661281434999-01f7de9098e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          isOnline: true,
          isGroup: false,
          hasUnreadMessage: false),
      ChatCard(
          name: 'Celestina McBryan',
          lastMessage: 'Hey there, can you teach me Flutter?',
          time: '12:00',
          avatar:
              'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbnxlbnwwfHwwfHw%3D&w=1000&q=80',
          isOnline: false,
          isGroup: false,
          hasUnreadMessage: true,
          unreadMessageCount: '1'),
      ChatCard(
        name: 'Flutteristas',
        lastMessage: "Guys, there's an upcoming webinar. Who will attend",
        time: '11:50',
        avatar:
            'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zmx1dHRlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isOnline: false,
        isGroup: true,
        hasUnreadMessage: true,
        unreadMessageCount: '73',
      ),
      ChatCard(
        name: 'Tiktokers',
        lastMessage: 'Hey, I have a question about how to change my dp',
        time: '11:50',
        avatar:
            'https://images.unsplash.com/photo-1611605698323-b1e99cfd37ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZsdXR0ZXIlMjBpY29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        isOnline: false,
        isGroup: true,
        hasUnreadMessage: true,
        unreadMessageCount: '99',
      ),
      ChatCard(
        name: 'Weezy Naana',
        lastMessage: 'You go come work today?',
        time: '11:17',
        avatar:
            'https://images.unsplash.com/photo-1657214059212-104dac959c56?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MTV8fHBlcnNvbnxlbnwwfHwwfHw%3D&w=1000&q=80',
        isOnline: true,
        isGroup: false,
        hasUnreadMessage: true,
        unreadMessageCount: '7',
      ),
      ChatCard(
        name: 'Kwame',
        lastMessage: 'I have a question about the project',
        time: '11:11',
        avatar:
            'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zmx1dHRlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isOnline: true,
        isGroup: false,
        hasUnreadMessage: true,
        unreadMessageCount: '99',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const TalkChawAppbar(title: 'Chats'),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            // showModalBottomSheet(
            //     context: context, builder: (context) => const AddReport());
          },
          child: const Icon(
            Icons.note_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: kPrimaryDarkColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 15, left: 8, right: 8),
        child: Container(
          // height: double.infinity,
          decoration: BoxDecoration(
            // Color based on theme
            color: Theme.of(context).brightness == Brightness.dark
                ? kAppBgColorDark
                : kBackgroundColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TalkChawInputField(
                  hintText: 'Search Chats',
                  icon: Icons.search_sharp,
                  iconColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color.fromARGB(255, 182, 182, 182),
                  // borderRadius: const BorderRadius.all(Radius.circular(30)),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: chatCards.isNotEmpty
                      ? ListView.builder(
                          itemCount: chatCards.length,
                          itemBuilder: (context, index) {
                            return chatCards[index];
                          })
                      : Center(
                          child: Image.asset(
                            'assets/images/blank.png',
                            height: 500,
                            width: 500,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

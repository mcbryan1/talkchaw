import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/screens/major_screens/chats/widgets/chat_card.dart';
import 'package:talkchaw/widgets/appbar/talk_chaw_appbar.dart';
import 'package:talkchaw/widgets/input/talk_chaw_input.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final CollectionReference _chats =
      FirebaseFirestore.instance.collection('chats');
  @override
  Widget build(BuildContext context) {
    // Create A list of Chat Cards

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
                  child: StreamBuilder(
                    stream: _chats.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ChatCard(
                            chat: data,
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

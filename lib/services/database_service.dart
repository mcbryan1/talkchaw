// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  final CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');

  // Create a chat

  // Save the Userdata
  Future saveUserData(
    String firstName,
    String lastName,
    String email,
  ) async {
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'groups': [],
      'image': '',
      "uid": uid
    });
  }

  // Get the User Data
  Future getUserData(String email) async {
    QuerySnapshot snapshot = await userCollection
        .where(
          'email',
          isEqualTo: email,
        )
        .get();
    return snapshot;
  }

  // Get user groups
  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  // Create a group
  Future createGroup(String groupName, String groupDescription,
      String firstName, String lastName, String id, DateTime createdAt) async {
    DocumentReference groupDocumentReference = await groupsCollection.add({
      'groupName': groupName,
      'groupDescription': groupDescription,
      'groupIcon': "",
      'members': [],
      'groupId': "",
      'admin': "$firstName $lastName",
      'recentMessage': "",
      'recentMessageSender': "",
      'recentMessageTime': "",
      'createdAt': createdAt,
    });
    // Uodate the members
    await groupDocumentReference.update({
      'members': FieldValue.arrayUnion(["${uid} ${firstName} ${lastName}"]),
      'groupId': groupDocumentReference.id,
    });

    // Update the user groups
    DocumentReference userDocumentRefence = userCollection.doc(uid);
    await userDocumentRefence.update({
      'groups': FieldValue.arrayUnion([
        "${groupDocumentReference.id}_${groupName}-${groupDescription}/${createdAt}"
      ]),
    });
  }

  // Getting the chats
  getChats(String groupId) async {
    return groupsCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time", descending: true)
        .snapshots();
  }

  // Get group admin
  Future getGroupAdmin(String groupId) async {
    DocumentReference adminDocumentReference = groupsCollection.doc(groupId);
    DocumentSnapshot adminDocumentSnapshot = await adminDocumentReference.get();
    return adminDocumentSnapshot['admin'];
  }
}

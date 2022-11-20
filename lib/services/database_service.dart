import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference groupsCOlllection =
      FirebaseFirestore.instance.collection('groups');

  // Update the Userdata
  Future updateUserData(
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
}

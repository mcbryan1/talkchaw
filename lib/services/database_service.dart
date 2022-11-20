import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference groupsCOlllection =
      FirebaseFirestore.instance.collection('groups');

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
}

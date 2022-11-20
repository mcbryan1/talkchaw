// Create a signin function that picks name, phone number and image and upload to firebase

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkchaw/helpers/helper.dart';
import 'package:talkchaw/services/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Login
  Future logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (error) {
      return error.message;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Sign Up

  Future signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        // Call our database service to update the user data

        await DatabaseService(uid: user.uid)
            .saveUserData(firstName, lastName, email);

        return true;
      }
    } on FirebaseAuthException catch (error) {
      return error.message;
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      //   return e.code;
      // } else if (e.code == 'email-already-in-use') {

      //   print('The account already exists for that email.');
      // }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedIn(false);
      await HelperFunctions.saveUserFirstName('');
      await HelperFunctions.saveUserLastName('');
      await HelperFunctions.saveUserEmail('');
      return await firebaseAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Delete Account
  Future deleteAccount() async {
    try {
      await HelperFunctions.saveUserLoggedIn(false);
      await HelperFunctions.saveUserFirstName('');
      await HelperFunctions.saveUserLastName('');
      await HelperFunctions.saveUserEmail('');

      await firebaseAuth.currentUser!.delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

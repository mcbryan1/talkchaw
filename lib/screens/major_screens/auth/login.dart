// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/helpers/helper.dart';
import 'package:talkchaw/screens/major_screens/auth/signup.dart';
import 'package:talkchaw/screens/major_screens/home.dart';
import 'package:talkchaw/services/auth_service.dart';
import 'package:talkchaw/services/database_service.dart';
import 'package:talkchaw/widgets/button/loading_button.dart';
import 'package:talkchaw/widgets/button/talk_chaw_button.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  // Show Password
  bool showPassword = false;
  // Email
  String email = '';
  // Password
  String password = '';
  // Loading
  bool isLoading = false;
  // Auth Service
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            // Logo
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Title
            const SizedBox(
              height: 50,
            ),
            const TalkChawText(
              text: 'Welcome Back',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            const TalkChawText(
              text: 'Login now to connect to the world',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 50,
            ),
            // Form
            Form(
              key: formKey,
              child: Column(
                children: [
                  // Email
                  TextFormField(
                    validator: (value) {
                      return RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value!)
                          ? null
                          : 'Please enter a valid email';
                    },
                    // Height
                    style: const TextStyle(height: 1.5),
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Password
                  TextFormField(
                    validator: (value) {
                      return value!.length < 8
                          ? 'Password Should Be More Than 8 Characters'
                          : null;
                    },
                    style: const TextStyle(height: 1.5),
                    obscureText: !showPassword,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: showPassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility))),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Login Button
                  isLoading
                      ? const LoadingButton()
                      : TalkChawButton(
                          borderRadius: 5,
                          text: 'Login',
                          onPressed: () {
                            login();
                          }),

                  const SizedBox(
                    height: 20,
                  ),

                  Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: kPrimaryTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              nextScreen(context, const Signup());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // Login
  void login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .logIn(email: email, password: password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .getUserData(email);

          // Save Snashot to Share preferences
          await HelperFunctions.saveUserLoggedIn(true);
          await HelperFunctions.saveUserEmail(email);
          await HelperFunctions.saveUserFirstName(
              snapshot.docs[0].get('firstName'));
          await HelperFunctions.saveUserLastName(
              snapshot.docs[0].get('lastName'));
          // Navigate to home screen
          nextScreenReplace(context, const HomeScreen());
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}

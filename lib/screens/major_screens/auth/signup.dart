// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkchaw/constant.dart';
import 'package:talkchaw/helpers/helper.dart';
import 'package:talkchaw/screens/major_screens/auth/login.dart';
import 'package:talkchaw/screens/major_screens/home.dart';
import 'package:talkchaw/services/auth_service.dart';
import 'package:talkchaw/widgets/button/loading_button.dart';
import 'package:talkchaw/widgets/button/talk_chaw_button.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  // Show Password
  bool showPassword = false;
  // First Name
  String firstName = '';
  // Last Name
  String lastName = '';
  // Email
  String email = '';
  // Password
  String password = '';
  // Confirm Password
  String confirmPassword = '';
  // isLoading
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
              height: 50,
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
              height: 30,
            ),
            const TalkChawText(
              text: 'Register Here',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            const TalkChawText(
              text: 'Create your account now to chat and explore the world',
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
                  // First Name
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'First Name is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                    decoration: textInputDecoration.copyWith(
                      labelText: 'First Name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Last Name
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last Name is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Last Name',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    height: 20,
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
                    height: 20,
                  ),
                  // Confirm Password
                  TextFormField(
                    validator: (value) {
                      return value != password
                          ? 'Password Does Not Match'
                          : null;
                    },
                    style: const TextStyle(height: 1.5),
                    obscureText: !showPassword,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Confirm Password',
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
                        confirmPassword = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Signup Button
                  isLoading
                      ? const LoadingButton()
                      : TalkChawButton(
                          borderRadius: 5,
                          text: 'Signup',
                          onPressed: () {
                            register();
                          }),

                  const SizedBox(
                    height: 20,
                  ),

                  Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: kPrimaryTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              nextScreenReplace(context, const Login());
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

  // Signup
  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUp(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password)
          .then((value) async {
        if (value == true) {
          // Save info in shared preferences
          await HelperFunctions.saveUserLoggedIn(true);
          await HelperFunctions.saveUserEmail(email);
          await HelperFunctions.saveUserFirstName(firstName);
          await HelperFunctions.saveUserLastName(lastName);

          // Navigate to home screen
          nextScreenReplace(context, const HomeScreen());
          showSnackbarWithoutAction(context, Colors.green,
              'Registration Successful, Welcome $firstName');
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

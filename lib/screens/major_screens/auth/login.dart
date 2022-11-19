// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';
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
              fontSize: 20,
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
                  TalkChawButton(
                      borderRadius: 5,
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('Validated');
                        }
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  // Register Button
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:talkchaw/constants.dart';
import 'package:talkchaw/widgets/button/talk_chaw_button.dart';
import 'package:talkchaw/widgets/text/talk_chaw_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // Full background
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.png'),
                        fit: BoxFit.cover)),
                child: // Column
                    Column(children: [
                  // Top padding
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          // Set border width, color and radius
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/man1.png'),
                              ),
                              color: kPrimaryDarkColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(100))),
                        ),
                        const Spacer(),
                        Container(
                          width: 200,
                          height: 200,
                          // Set border width, color and radius
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/girl2.png'),
                              ),
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                  100)), // Set border width, color and radius
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          // Set border width, color and radius
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/girl1.png'),
                              ),
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                  100)), // Set border width, color and radius
                        ),
                        const Spacer(),
                        Container(
                          width: 200,
                          height: 200,
                          // Set border width, color and radius
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/man2.png'),
                              ),
                              color: kPrimaryDarkColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const TalkChawText(
                            text:
                                'Enjoy the new experience of chating with global friends',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryTextColor,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TalkChawText(
                            text: 'Connect people arround the world for free',
                            fontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TalkChawButton(
                              text: 'Get Started',
                              onPressed: null,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TalkChawText(
                                text: 'Powered by',
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Image.asset(
                                'assets/images/logo.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const TalkChawText(
                                text: 'TalkChaw',
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ]),
                  ))
                ])));
  }
}

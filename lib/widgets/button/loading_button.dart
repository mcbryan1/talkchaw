import 'package:flutter/material.dart';
import 'package:talkchaw/constant.dart';

class LoadingButton extends StatelessWidget {
  final double height;
  final Color color;

  const LoadingButton({Key? key, this.height = 60, this.color = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}

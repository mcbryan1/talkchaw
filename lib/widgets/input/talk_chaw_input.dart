import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkchaw/constants.dart';

class TalkChawInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final Color? iconColor;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixIconTap;
  final IconData? suffixIcon;
  final int? maxLength;
  final BorderRadius? borderRadius;
  final double? height;
  final int? maxLines;
  final bool? readOnly;
  final String? initialValue;

  const TalkChawInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.iconColor,
    this.onSuffixIconTap,
    this.suffixIcon,
    this.maxLength,
    this.borderRadius,
    this.height,
    this.maxLines,
    this.readOnly = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      height: height ?? 60,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(68, 138, 120, 120)
            : const Color.fromARGB(255, 230, 230, 230),
        borderRadius: borderRadius ?? BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 253, 253, 253)
              : kPrimaryTextColor,
          // color: kPrimaryColor,
        ),
        readOnly: readOnly ?? false,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        cursorColor: iconColor ?? kPrimaryColor,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              onSuffixIconTap;
            },
            child: Icon(
              suffixIcon,
              color: iconColor ?? kPrimaryColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: kPrimaryTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w300),
          icon: icon != null
              ? Icon(
                  icon,
                  color: iconColor,
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

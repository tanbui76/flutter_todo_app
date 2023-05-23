import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 20,
        right: 30,
      ),
      child: TextField(
          style: const TextStyle(color: Colors.white),
          obscureText: obscureText!,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.white,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
          )),
    );
  }
}

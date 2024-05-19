import 'package:flutter/material.dart';

class LoginTextBox extends StatelessWidget {
  const LoginTextBox({super.key, required this.textBoxText, required this.controller});
  final String textBoxText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label:  Text(
            textBoxText,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.white
        ),
        hintText: "Enter $textBoxText",
        hintStyle: const TextStyle(
          color: Colors.amber
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber
          )
        )
      ),
    );
  }
}

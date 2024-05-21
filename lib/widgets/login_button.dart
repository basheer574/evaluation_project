import 'package:camera/camera.dart';
import 'package:evaluation_project/screens/face_detection.dart';
import 'package:evaluation_project/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/firebase_auth.dart';

class LoginButton extends StatefulWidget {
  LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController,});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  late String? errorMessage = '';

  final errorSnackBar =
      const SnackBar(content: Text("Failed connecting to firebase"));

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FaceDetection()));
    } on FirebaseAuthException catch (exception) {
      if (exception.message == "user-not-found") {
        setState(() {
          wrongEmailMessage();
        });
      } else if (exception.message == "wrong-password") {
        setState(() {
          wrongPasswordMessage();
        });
      }
    }
  }

  void wrongEmailMessage() {
    SnackBar snackBar = const SnackBar(content: Text("Incorrect Email"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void wrongPasswordMessage() {
    SnackBar snackBar = const SnackBar(content: Text("Incorrect Password"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    signInWithEmailAndPassword();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

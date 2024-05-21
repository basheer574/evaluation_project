import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
            child: Text(
          "You Signed In!, if you want to sign out, \n click the button below.",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        )),
        Center(
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signUserOut();
            },
          ),
        ),
      ],
    );
  }
}

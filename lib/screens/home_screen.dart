import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //sign user out
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.logout),
        onPressed: (){
          signUserOut();
        },
      ),
    );
  }
}

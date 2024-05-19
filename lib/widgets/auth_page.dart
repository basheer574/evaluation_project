import 'package:evaluation_project/screens/home_screen.dart';
import 'package:evaluation_project/screens/login_screen.dart';
import 'package:evaluation_project/widgets/custom_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      childWidget: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user is logged in
          if(snapshot.hasData){
            return const HomeScreen();
          }
          //user is not Logged in
          else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}

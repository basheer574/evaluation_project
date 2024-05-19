import 'package:evaluation_project/widgets/custom_scaffold.dart';
import 'package:evaluation_project/widgets/login_button.dart';
import 'package:evaluation_project/widgets/login_textbox.dart';
import 'package:evaluation_project/widgets/welcome_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        childWidget: Column(
      children: [
        const WelcomeText(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: LoginTextBox(
                    textBoxText: "Email",
                    controller: emailController,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: LoginTextBox(
                    textBoxText: "Password",
                    controller: passwordController,
                  )),
            ],
          ),
        ),
        LoginButton(
            emailController: emailController,
            passwordController: passwordController)
      ],
    ));
  }
}

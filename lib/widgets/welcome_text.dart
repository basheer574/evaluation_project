import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 40.0
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Welcome Back, Admin! \n",
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

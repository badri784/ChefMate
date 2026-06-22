import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/routing/routes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
              text: 'Sign Up',
              style: const TextStyle(
                color: Color(0xffB02F00),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushnamed(Routes.signUpScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}

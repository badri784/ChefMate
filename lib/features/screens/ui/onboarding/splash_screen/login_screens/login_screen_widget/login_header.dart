import 'package:flutter/material.dart';
import 'package:food_app/core/theme/font_weight.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back,',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Sign in to continue your culinary journey.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeightManger.fontWeightNormal,
          ),
        ),
      ],
    );
  }
}

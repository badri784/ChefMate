import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import '../../../../../../../core/helpers/font_weght.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/image/Overlay+Border+OverlayBlur.png',
            width: 70,
            height: 70,
          ),
        ),
        verticalSpace(20),
        const Text(
          'Welco`me to\nCulinaryShare',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        verticalSpace(10),
        Text(
          'Discover, cook, and share the \nworlds finest recipes with a global \ncommunity.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}

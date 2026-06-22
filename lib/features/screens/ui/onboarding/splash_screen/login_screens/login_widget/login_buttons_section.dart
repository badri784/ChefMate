import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/helpers/font_weght.dart';

class LoginButtonsSection extends StatelessWidget {
  const LoginButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            context.pushReplacementName(Routes.signUpScreen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffB02F00),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Create Account',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
        verticalSpace(12),
        ElevatedButton(
          onPressed: () {
            context.pushReplacementName(Routes.loginScreen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.05),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            side: BorderSide(color: Colors.white.withOpacity(0.32)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign in',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}

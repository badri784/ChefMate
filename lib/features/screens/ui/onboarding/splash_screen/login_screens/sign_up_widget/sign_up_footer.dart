import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  color: Color(0xff5B4039),
                  fontSize: 14,
                  fontWeight: FontWeightManger.fontWeightNormal,
                ),
              ),
              TextSpan(
                text: 'Sign in',
                style: GoogleFonts.montserrat(
                  color: const Color(0xffB02F00),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(50),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(
                  color: Color(0xff5B4039),
                  fontSize: 14,
                  fontWeight: FontWeightManger.fontWeightNormal,
                ),
              ),
              TextSpan(
                text: 'Terms of Service ',
                style: GoogleFonts.montserrat(
                  color: const Color(0xffB02F00),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(
                text: 'and ',
                style: TextStyle(
                  color: Color(0xff5B4039),
                  fontSize: 14,
                  fontWeight: FontWeightManger.fontWeightNormal,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: GoogleFonts.montserrat(
                  color: const Color(0xffB02F00),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

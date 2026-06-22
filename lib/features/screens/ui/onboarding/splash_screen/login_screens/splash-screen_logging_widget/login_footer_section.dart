import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/helpers/font_weght.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Continue as Guest',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeightHelper.semiBold,
            color: Colors.white,
          ),
        ),
        verticalSpace(12),
        Text(
          'By continuing, you agree to our Terms of\nService and Privacy Policy.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeightHelper.medium,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

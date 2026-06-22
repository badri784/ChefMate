import 'package:flutter/material.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Join CulinaShare',
          style: GoogleFonts.montserrat(
            color: const Color(0xffB02F00),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Create an account to start saving recipes\nand planning meals.',
          style: GoogleFonts.montserrat(
            color: const Color(0xff5B4039),
            fontSize: 16,
            fontWeight: FontWeightManger.fontWeightNormal,
          ),
        ),
      ],
    );
  }
}

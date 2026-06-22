import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/helpers/font_weght.dart';

class LoginSocialSection extends StatelessWidget {
  const LoginSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
            horizontalSpace(5),
            Text(
              'OR CONTNECT WITH',
              style: GoogleFonts.inter(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            horizontalSpace(5),
            Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
          ],
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: FaIcon(FontAwesomeIcons.google),
              ),
            ),
            horizontalSpace(12),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Color(0xff1877F2),
                child: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

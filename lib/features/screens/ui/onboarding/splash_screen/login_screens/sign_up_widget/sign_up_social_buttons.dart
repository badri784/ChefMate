import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/helpers/spacing.dart';

class SignUpSocialButtons extends StatelessWidget {
  const SignUpSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(100),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.google),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffffff),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              label: const Text('Google'),
            ),
            horizontalSpace(20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.facebook),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffffff),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              label: const Text('Facebook'),
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.grey)),
            horizontalSpace(5),
            const Text(
              'OR EMAIL',
              style: TextStyle(
                color: Color(0xff5B4039),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            horizontalSpace(5),
            const Expanded(child: Divider(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

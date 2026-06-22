import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'login_screens/login_widget/login_header_section.dart';
import 'login_screens/login_widget/login_buttons_section.dart';
import 'login_screens/login_widget/login_social_section.dart';
import 'login_screens/login_widget/login_footer_section.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/Full-page background image.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 1),
                  const LoginHeaderSection(),
                  const Spacer(flex: 4),
                  const LoginButtonsSection(),
                  verticalSpace(12),
                  const LoginSocialSection(),
                  const Spacer(flex: 3),
                  const LoginFooterSection(),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

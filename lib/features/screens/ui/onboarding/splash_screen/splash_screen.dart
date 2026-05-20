import 'package:flutter/material.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SpashScreen extends StatelessWidget {
  const SpashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff45320),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/image/Decorative Background Images (High-quality blurred food photography to add _Tactile Depth_).png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.food_bank_rounded,
                          size: 125,
                          color: Colors.white,
                        ),
                        Text(
                          'CulinaShare',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'The Joy of Culinary Discovery',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            TextButton(
              onPressed: () {
                context.pushAndRemoveUntilname(Routes.splashScreenTwo);
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Loading your kitchen...',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

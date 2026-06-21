import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/routing/routes.dart';
import '../../../../core/helpers/spacing.dart';

class OnboardingGuides extends StatelessWidget {
  const OnboardingGuides({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 15, right: 9),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CulinaShare',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffaf2f00),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xff593e38),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                // for image Row
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      // for column one
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/image/onBoardingGuide.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        verticalSpace(12),
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/OnBoardingGuidsTwo.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(20),
                  // for column two
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/OnBoardingGuidsThree.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(22),

            const Text('Step-by-Step Guides', style: TextStyle(fontSize: 16)),
            verticalSpace(25),

            const Text(
              'Master any dish with our easy-to-follow, \ndetailed cooking instructions. We break down \ncomplex recipes into simple, joyful moments.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            verticalSpace(40),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     3,
            //     (index) => buildDot(index, currentIndex),
            //   ),
            // ),
            // verticalSpace(22),
            ElevatedButton(
              onPressed: () {
                context.pushnamed(Routes.onboardingDiscover);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffff5722),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  horizontalSpace(10),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
            verticalSpace(70),
          ],
        ),
      ),
    );
  }
}

Widget buildDot(int index, int currentIndex) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: 8,
    width: currentIndex == index ? 24 : 8,
    decoration: BoxDecoration(
      color: currentIndex == index
          ? const Color(0xffff5722)
          : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

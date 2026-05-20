import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

import '../../../../core/helpers/extension.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 6, right: 24),
                child: TextButton(
                  onPressed: () {
                    context.pushReplacementName(Routes.home);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xff593e38),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(12),
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/onboarding_discover_one.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        verticalSpace(12),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffffb5a0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.food_bank,
                                  color: Color(0xff862200),
                                  size: 35,
                                ),
                                verticalSpace(5),
                                const Text(
                                  '50+ Cuisines',
                                  style: TextStyle(
                                    color: Color(0xff862200),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  horizontalSpace(12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/image_two.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        verticalSpace(12),
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/image_three.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            const Text(
              'Discover World \n Cuisine',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),
            const Text(
              'Explore thousands of authentic recipes\n from every corner of the globe.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff6c6c6c),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            verticalSpace(40),
            ElevatedButton(
              onPressed: () {
                context.pushReplacementName(Routes.onboardingGuides);
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
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/image/pageThree.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Save Your Favorites',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              verticalSpace(15),
              const Text(
                'Organize your favorite meals and \n plan your weekly groceries in one \n place.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xff836e69)),
              ),
              verticalSpace(40),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacementName(Routes.lastScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffb02f01),
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
                      'Get Started',
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
      ),
    );
  }
}

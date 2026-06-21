import 'package:flutter/material.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Create Account Later',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                context.pushReplacementName(Routes.home);
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

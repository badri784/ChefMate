import 'package:flutter/material.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'back',
          style: TextStyle(
            color: Color(0xff593e38),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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

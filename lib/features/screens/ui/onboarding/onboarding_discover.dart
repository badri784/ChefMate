import 'package:flutter/material.dart';
import 'onboarding_guides.dart';
import 'page_one.dart';
import 'page_three.dart';

class OnboardingDiscover extends StatefulWidget {
  const OnboardingDiscover({super.key});

  @override
  State<OnboardingDiscover> createState() => _OnboardingDiscoverState();
}

class _OnboardingDiscoverState extends State<OnboardingDiscover> {
  late PageController _pageController;
  int currentIndex = 0; // افتراضياً الصفحة الأولى هي الحالية

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                pageSnapping: true,
                allowImplicitScrolling: true,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: const [
                  PageOne(),
                  OnboardingGuides(),
                  PageThree(),
                  // LastScreen(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // عدد الصفحات
                (index) => buildDot(index, currentIndex),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentIndex == index ? 30 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xffff5722)
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

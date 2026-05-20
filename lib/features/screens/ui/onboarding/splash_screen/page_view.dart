// import 'package:flutter/material.dart';
// import 'package:food_app/features/screens/ui/onboarding/onboarding_guides.dart';
// import 'package:food_app/features/screens/ui/onboarding/splash_screen/last_screen.dart';
// import 'package:food_app/features/screens/ui/onboarding/splash_screen/splash_screen_two.dart';

// class PageViewScreen extends StatefulWidget {
//   const PageViewScreen({super.key});

//   @override
//   State<PageViewScreen> createState() => _PageViewScreenState();
// }

// class _PageViewScreenState extends State<PageViewScreen>
//     with TickerProviderStateMixin {
//   late PageController _pageController;
//   int currentIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 6,
//             child: PageView(
//               pageSnapping: true,
//               scrollDirection: Axis.horizontal,
//               allowImplicitScrolling: true,
//               physics: const ClampingScrollPhysics(),
//               controller: _pageController,
//               onPageChanged: (int index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               children: const [LastScreen(), SplashScreenTwo()],
//             ),
//           ),
//           // Dots indicator
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               2,
//               (index) => buildDot(index, currentIndex),
//             ),
//           ),

//           // Next button (only on second screen)
//           if (currentIndex == 1) ...[
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to next screen
//               },
//               child: const Text('Next'),
//             ),
//           ],

//           const SizedBox(height: 40),
//         ],
//       ),
//     );
//   }
// }

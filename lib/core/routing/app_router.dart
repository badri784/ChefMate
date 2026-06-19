import 'dart:math';

import 'routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/category_cubit/category_cubit.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import '../../features/screens/ui/home/home_category/category_detail.dart';
import '../logic/cubit/food_meal_category/app_state_cubit.dart';
import '../networking/repo/my_repo.dart';
import '../../features/screens/ui/detail_screen.dart/detail_screen.dart';
import '../../features/screens/ui/detail_screen.dart/search_detail_screen.dart';
import '../../features/screens/ui/onboarding/splash_screen/splash_screen.dart';
import '../../features/screens/ui/onboarding/onboarding_discover.dart';
import '../../features/screens/ui/onboarding/onboarding_guides.dart';
import '../../features/screens/ui/onboarding/splash_screen/splash_screen_two.dart';
import '../../features/widget/nacigation_bottom.dart';

class AppRouter {
  final MyRepo myRepo;
  AppRouter(this.myRepo);
  Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingDiscover:
        return MaterialPageRoute(
          builder: (context) => const OnboardingDiscover(),
        );
      case Routes.onboardingGuides:
        return MaterialPageRoute(
          builder: (context) => const OnboardingGuides(),
        );
      case Routes.splashScreenTwo:
        return MaterialPageRoute(builder: (context) => const SplashScreenTwo());
      case Routes.lastScreen:
        return MaterialPageRoute(builder: (context) => const SpashScreen());
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) {
            final String randomCharacter = String.fromCharCode(
              Random().nextInt(26) + 97,
            );
            return BlocProvider(
              create: (context) =>
                  AppStateCubit(myRepo)..getMeals(randomCharacter),
              child: const Home(),
            );
          },
        );
      case Routes.detailScreen:
        final arg = settings.arguments;
        if (arg is Meal) {
          return MaterialPageRoute(
            builder: (context) => DetailScreen(meal: arg),
          );
        } else if (arg is String) {
          // String safeName = Uri.encodeQueryComponent(arg);
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AppStateCubit(myRepo)..searchByIdGetIt(arg),
              child: const SearchDetailScreen(),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Invalid Argument for DetailScreen')),
          ),
        );
      case Routes.categoryDetail:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CategoryCubit(myRepo)..getCategory(categoryName.toLowerCase()),
            child: CategoryDetail(categoryName: categoryName),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

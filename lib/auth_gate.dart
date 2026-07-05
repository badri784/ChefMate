import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/dependance_injection/di.dart';
import 'package:food_app/core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'package:food_app/core/networking/repo/my_repo.dart';
import 'package:food_app/features/screens/ui/onboarding/splash_screen/splash_screen_logging.dart';
import 'package:food_app/features/widget/nacigation_bottom.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  // Cache these in initState so hot reload doesn't recreate them
  late final Stream<User?> _authStream;
  late final String _randomCharacter;

  @override
  void initState() {
    super.initState();
    _authStream = FirebaseAuth.instance.authStateChanges();
    _randomCharacter = String.fromCharCode(Random().nextInt(26) + 97);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              backgroundColor: Colors.amber,
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (!snapshot.hasData) {
          return const SplashScreenTwo();
        }

        return BlocProvider(
          create: (context) =>
              AppStateCubit(getIt<MyRepo>())..getMeals(_randomCharacter),
          child: const Home(),
        );
      },
    );
  }
}

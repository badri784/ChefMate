import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/dependance_injection/di.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/routing/app_router.dart';
import 'package:food_app/core/routing/routes.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter(getIt());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SavemealCubit())],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffFF5722),
            primary: const Color(0xffFF5722),
            secondary: const Color(0xff4CAF50),
            tertiary: const Color(0xffFFC107),
            onPrimary: const Color(0xffffffff),
            onSecondary: const Color(0xffffffff),
            onTertiary: const Color(0xffffffff),
            surface: const Color(0xffffffff),
            onSurface: const Color(0xff1b1c1c),
            error: const Color(0xffba1a1a),
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.appRouter,
        initialRoute: Routes.home,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

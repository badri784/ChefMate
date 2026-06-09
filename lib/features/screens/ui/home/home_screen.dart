import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'widget_home/home_app_bar.dart';
import 'widget_home/home_body.dart';
import 'widget_home/no_internet_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> value,
          Widget child,
        ) {
          if (value.contains(ConnectivityResult.none)) {
            return NoInternetView(
              onRefresh: () async {
                final cubit = context.read<AppStateCubit>();
                final charToFetch = cubit.lastFetchedChar ?? 'a';
                await cubit.getMeals(charToFetch);
              },
            );
          }
          return child;
        },
        child: const HomeBody(),
      ),
    );
  }
}

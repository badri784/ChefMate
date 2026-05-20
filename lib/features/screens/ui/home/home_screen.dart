import 'package:flutter/material.dart';
import 'package:food_app/features/screens/ui/home/home_category/category.dart';
import 'widget_home/home_app_bar.dart';
import 'widget_home/trending_meals_bloc_builder.dart';
import 'widget_home/trending_meals_header.dart';
import 'widget_home/welcome_text.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../../core/helpers/spacing.dart';
import 'widget_home/category_and_show_all.dart';
import 'widget_home/text_feild_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> value,
              Widget child,
            ) {
              if (value.contains(ConnectivityResult.none)) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wifi_off, size: 100),
                      Text('No internet connection'),
                    ],
                  ),
                );
              }
              return child;
            },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(),
                verticalSpace(8),
                const TextFeildSearch(),
                verticalSpace(6),
                const CategoryAndShowAll(),
                // verticalSpace(1),
                const Category(),
                verticalSpace(6),
                const TrendingMealsHeader(),
                const TrendingMealsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

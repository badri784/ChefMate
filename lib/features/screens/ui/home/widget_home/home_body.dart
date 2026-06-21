import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../home_category/category.dart';
import 'category_and_show_all.dart';
import 'text_feild_search.dart';
import 'trending_meals_bloc_builder.dart';
import 'trending_meals_header.dart';
import 'welcome_text.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Header widgets wrapped in SliverToBoxAdapter
        SliverPadding(
          padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(),
                verticalSpace(8),
                const TextFeildSearch(),
                verticalSpace(6),
                const CategoryAndShowAll(),
                const Category(),
                verticalSpace(6),
                const TrendingMealsHeader(),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10),
          sliver: TrendingMealsBlocBuilder(),
        ),
      ],
    );
  }
}

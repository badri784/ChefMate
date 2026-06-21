import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/features/screens/ui/home/widget_home/meal_item_card_in_home/meal_category_tags.dart';
import 'package:food_app/features/screens/ui/home/widget_home/meal_item_card_in_home/meal_image_with_favorite.dart';
import 'package:food_app/features/screens/ui/home/widget_home/meal_item_card_in_home/meal_time_and_difficulty.dart';
import 'package:food_app/features/screens/ui/home/widget_home/meal_item_card_in_home/meal_title_and_rating.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/model/food_model/meals.dart';

class MealItemCard extends StatelessWidget {
  final Meal meal;
  const MealItemCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final List<String> rating = ['4.5', '5.0', '4.0', '4.7', '4.2', '4.9'];
    final List<String> timer = [
      '30-40 min',
      '20-30 min',
      '10-20 min',
      '40-50 min',
      '50-60 min',
      '15-25 min',
      '20-40 min',
    ];
    final random = Random();
    final randomRating = rating[random.nextInt(rating.length)];
    final randomTimer = timer[random.nextInt(timer.length)];

    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(5),
          MealImageWithFavorite(meal: meal),
          verticalSpace(5),
          MealTitleAndRating(title: meal.strMeal!, rating: randomRating),
          verticalSpace(5),
          MealTimeAndDifficulty(time: randomTimer),
          verticalSpace(5),
          MealCategoryTags(
            category: meal.strCategory ?? 'Unknown',
            area: meal.strArea ?? 'Unknown',
          ),
        ],
      ),
    );
  }
}

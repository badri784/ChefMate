import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/features/screens/ui/saved_meals/saved_meal_widget/hero_widget.dart';
import 'package:food_app/features/screens/ui/saved_meals/saved_meal_widget/name_of_meal_in_save_screen.dart';
import 'package:food_app/features/screens/ui/saved_meals/saved_meal_widget/raing_and_contaner_in_save_screen.dart';
import 'package:food_app/features/screens/ui/saved_meals/saved_meal_widget/star_in_save_screen.dart';

import '../../../../../core/model/food_model/meals.dart';

class SavedMealItem extends StatelessWidget {
  final Meal meal;

  const SavedMealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Stack(
            children: [
              HeroWidgetAndImage(meal: meal),
              StarInSaveScreen(meal: meal),
              const RatingAndContainerWidgetInSaveScreen(),
            ],
          ),
          NameOfMealAndDetialInSaveScreen(meal: meal),
          verticalSpace(10),
          const Divider(),
        ],
      ),
    );
  }
}

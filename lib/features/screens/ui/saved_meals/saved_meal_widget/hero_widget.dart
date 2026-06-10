import 'package:flutter/material.dart';
import 'package:food_app/features/screens/ui/home/widget_home/custom_cached_image.dart';

import '../../../../../core/model/food_model/meals.dart';

class HeroWidgetAndImage extends StatelessWidget {
  const HeroWidgetAndImage({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: meal.idMeal!,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: CustomCachedImage(
          meal: meal,
          hight: 350,
          widthmeal: double.infinity,
          width: double.infinity,
          imageUrl: meal.strMealThumb!,
        ),
      ),
    );
  }
}

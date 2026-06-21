import 'package:flutter/material.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/features/screens/ui/home/widget_home/custom_cached_image.dart';

class ImageWidgetInHomeScreen extends StatelessWidget {
  const ImageWidgetInHomeScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: meal.idMeal!,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: CustomCachedImage(
          hightMeal: 300,
          widthmeal: double.infinity,
          meal: meal,
          hight: 45,
          width: 45,
          imageUrl: meal.strMealThumb!,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}

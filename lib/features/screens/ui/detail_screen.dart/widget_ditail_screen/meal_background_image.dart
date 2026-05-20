import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_app/core/model/food_model/meals.dart';

class MealBackgroundImage extends StatelessWidget {
  final Meal meal;

  const MealBackgroundImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 350,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return InteractiveViewer(
                child: Image.network(meal.strMealThumb!),
              );
            },
          );
        },
        child: CachedNetworkImage(
          imageUrl: meal.strMealThumb ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(color: Colors.grey[200]),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

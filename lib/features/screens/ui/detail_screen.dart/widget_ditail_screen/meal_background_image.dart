import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/features/screens/ui/home/widget_home/custom_cached_image.dart';

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
        onDoubleTap: () {
          context.read<SavemealCubit>().toggleFavorite(meal);
        },
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
        child: Hero(
          tag: meal.idMeal!,
          child: CustomCachedImage(
            meal: meal,
            hight: 350,
            width: double.infinity,
            imageUrl: meal.strMealThumb!,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

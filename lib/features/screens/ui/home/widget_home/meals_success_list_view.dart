import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';

import '../../../../../core/helpers/extension.dart';
import '../../../../../core/model/food_model/food_model.dart';
import '../../../../../core/routing/routes.dart';
import 'meal_item_card.dart';

class MealsSuccessListView extends StatelessWidget {
  const MealsSuccessListView({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: foodModel.meals.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onDoubleTap: () {
            context.read<SavemealCubit>().toggleFavorite(
              foodModel.meals[index],
            );
          },
          onTap: () {
            context.pushnamed(
              Routes.detailScreen,
              arguments: foodModel.meals[index],
            );
          },
          child: MealItemCard(meal: foodModel.meals[index]),
        );
      },
    );
  }
}

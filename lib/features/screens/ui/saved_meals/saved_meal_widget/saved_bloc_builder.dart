import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/core/theme/font_weight.dart';

import '../../../../../core/helpers/extension.dart';
import '../../../../../core/routing/routes.dart';
import 'saved_meal_item.dart';

class SavedBlocBuilder extends StatelessWidget {
  const SavedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavemealCubit, SavemealState>(
      builder: (context, state) {
        final List<Meal> savedMeals = context.read<SavemealCubit>().savedMeals;
        if (savedMeals.isEmpty) {
          return const Center(
            child: Text(
              'no meals saved yet !!! 🍷\n tap on red heart icon for save meal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeightManger.fontWeightNormal,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          itemCount: savedMeals.length,
          itemBuilder: (context, index) {
            final meal = savedMeals[index];
            return GestureDetector(
              onDoubleTap: () {
                context.read<SavemealCubit>().toggleFavorite(meal);
              },
              onTap: () {
                context.pushnamed(Routes.detailScreen, arguments: meal);
              },
              child: SavedMealItem(meal: meal),
            );
          },
        );
      },
    );
  }
}

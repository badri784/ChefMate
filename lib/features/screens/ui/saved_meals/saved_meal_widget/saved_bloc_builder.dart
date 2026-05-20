import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/core/theme/font_weight.dart';

import '../../../../../core/helpers/spacing.dart';
import 'saved_meal_item.dart';

class SavedBlocBuilder extends StatelessWidget {
  const SavedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavemealCubit, SavemealState>(
      builder: (context, state) {
        final List<Meal> savedMeals = context.read<SavemealCubit>().savedMeals;
        if (savedMeals.isEmpty) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'no meals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightManger.fontWeightNormal,
                  ),
                ),
                horizontalSpace(10),
                const Icon(Icons.hourglass_empty_sharp, size: 32),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: savedMeals.length,
          itemBuilder: (context, index) {
            final meal = savedMeals[index];
            return SavedMealItem(meal: meal);
          },
        );
      },
    );
  }
}

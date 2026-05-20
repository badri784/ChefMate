import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/model/food_model/meals.dart';

import 'saved_meal_item.dart';

class SavedBlocBuilder extends StatelessWidget {
  const SavedBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavemealCubit, SavemealState>(
      builder: (context, state) {
        final List<Meal> savedMeals = context.read<SavemealCubit>().savedMeals;
        if (savedMeals.isEmpty) {
          return const Center(child: Text('no meals'));
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

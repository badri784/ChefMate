import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/features/screens/ui/home/widget_home/meal_item_card_in_home/image_in_home_screen.dart';

import '../../../../../../core/model/food_model/meals.dart';

class MealImageWithFavorite extends StatelessWidget {
  final Meal meal;
  const MealImageWithFavorite({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidgetInHomeScreen(meal: meal),
        Positioned(
          right: 20,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff766f68).withValues(alpha: .8),
            ),
            child: BlocBuilder<SavemealCubit, SavemealState>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (context, state) {
                final isFavorite = context.read<SavemealCubit>().isMealSaved(
                  meal.idMeal,
                );
                return IconButton(
                  onPressed: () {
                    context.read<SavemealCubit>().toggleFavorite(meal);
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

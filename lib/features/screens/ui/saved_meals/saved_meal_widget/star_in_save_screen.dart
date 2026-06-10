import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import '../../../../../core/model/food_model/meals.dart';

class StarInSaveScreen extends StatelessWidget {
  const StarInSaveScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffeae7e7).withValues(alpha: .5),
        ),
        child: IconButton(
          onPressed: () {
            context.read<SavemealCubit>().toggleFavorite(meal);
          },
          icon: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}

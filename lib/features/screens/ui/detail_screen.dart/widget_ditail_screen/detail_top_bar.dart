import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:food_app/core/model/food_model/meals.dart';

class DetailTopBar extends StatelessWidget {
  final Meal meal;

  const DetailTopBar({super.key, required this.meal});

  Future<void> shareUrlYoutube(BuildContext context) async {
    if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty) {
      await Share.share(
        'Meal video Link: ${meal.strYoutube!}',
        subject: 'Recipe',
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('No video found'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildTopButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTopButton(
            icon: Icons.arrow_back,
            color: Colors.white,
            onTap: () => Navigator.pop(context),
          ),
          Row(
            children: [
              _buildTopButton(
                icon: Icons.share,
                color: Colors.white,
                onTap: () {
                  shareUrlYoutube(context);
                },
              ),
              const SizedBox(width: 10),
              BlocBuilder<SavemealCubit, SavemealState>(
                builder: (context, state) {
                  final bool isFavorite = context
                      .read<SavemealCubit>()
                      .isMealSaved(meal.idMeal);
                  return _buildTopButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    onTap: () {
                      context.read<SavemealCubit>().toggleFavorite(meal);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

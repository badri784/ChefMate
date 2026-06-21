import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:food_app/features/screens/ui/detail_screen.dart/widget_ditail_screen/build_top_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:food_app/core/model/food_model/meals.dart';

class DetailTopBar extends StatelessWidget {
  final Meal meal;

  const DetailTopBar({super.key, required this.meal});

  Future<void> shareUrlYoutube(BuildContext context) async {
    if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty) {
      final String? mealName = meal.strMeal;
      final String? youtubeUrl = meal.strYoutube;
      await Share.share(
        'ChefMate : Meal video Link: $youtubeUrl',
        subject: mealName,
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

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildTopButton(
            icon: Icons.arrow_back,
            color: Colors.white,
            onTap: () => Navigator.pop(context),
          ),
          Row(
            children: [
              BuildTopButton(
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
                  return BuildTopButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    onTap: () {
                      context.read<SavemealCubit>().toggleFavorite(meal);

                      showToast(
                        message: isFavorite
                            ? 'Meal removed from favorites'
                            : 'Meal added to favorites',
                        color: Colors.green,
                        context: context,
                      );
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

void showToast({
  required String message,
  required Color color,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeightManger.fontWeightMedium,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
  );
}

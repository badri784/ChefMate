import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/model/food_model/meals.dart';
import '../../../../../core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItemCard extends StatelessWidget {
  final Meal meal;
  const MealItemCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final List<String> rating = ['4.5', '5.0', '4.0', '4.7', '4.2', '4.9'];
    final List<String> timer = [
      '30-40 min',
      '20-30 min',
      '10-20 min',
      '40-50 min',
      '50-60 min',
      '15-25 min',
      '20-40 min',
    ];
    final random = Random();
    final randomRating = rating[random.nextInt(rating.length)];
    final randomTimer = timer[random.nextInt(timer.length)];

    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white12,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(5),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: meal.strMealThumb!,
                  fadeInDuration: const Duration(milliseconds: 100),
                  placeholder: (context, url) => SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/image/loading_gray.gif',
                      height: 45,
                      width: 45,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff766f68).withValues(alpha: .8),
                  ),
                  child: BlocBuilder<SavemealCubit, SavemealState>(
                    builder: (context, state) {
                      final isFavorite = context
                          .read<SavemealCubit>()
                          .isMealSaved(meal.idMeal);
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
          ),
          verticalSpace(5),
          Row(
            children: [
              Expanded(
                child: Text(
                  meal.strMeal!,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeightManger.fontWeightSemiBold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color(0xffeae7e7),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star_border, color: Color(0xff7f620e)),
                    Text(
                      randomRating,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeightManger.fontWeightMedium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(5),
          Row(
            children: [
              const Icon(Icons.query_builder),
              horizontalSpace(4),
              Text(
                randomTimer,
                style: GoogleFonts.inter(
                  fontWeight: FontWeightManger.fontWeightMedium,
                  fontSize: 12,
                ),
              ),
              horizontalSpace(4),
              const Icon(Icons.food_bank_rounded),
              horizontalSpace(4),
              Text(
                'Intermediate',
                style: GoogleFonts.inter(
                  fontWeight: FontWeightManger.fontWeightMedium,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          verticalSpace(5),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffeae7e7),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  meal.strCategory ?? 'Unknown',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeightManger.fontWeightMedium,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffeae7e7),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  meal.strArea ?? 'Unknown',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeightManger.fontWeightMedium,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import '../../../../../core/model/food_model/meals.dart';
import '../../../../../core/theme/font_weight.dart';

class SavedMealItem extends StatelessWidget {
  final Meal meal;

  const SavedMealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: meal.strMealThumb ?? '',
                  fit: BoxFit.cover,
                  height: 350,
                  width: double.infinity,
                ),
              ),
              Positioned(
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
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c7d7a).withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      Text('4.5', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal ?? '',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeightManger.fontWeightSemiBold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffeae7e7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        meal.strArea ?? '',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeightManger.fontWeightMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                    horizontalSpace(6),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 16, 179, 29),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Healthy',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeightManger.fontWeightMedium,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(10),
          const Divider(),
        ],
      ),
    );
  }
}

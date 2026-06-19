import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class NameOfMealAndDetialInSaveScreen extends StatelessWidget {
  const NameOfMealAndDetialInSaveScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final bool mealStrAreaNull = meal.strArea == null;
    return Container(
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
              if (meal.strArea != null)
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
                    meal.strArea ?? 'Null',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeightManger.fontWeightMedium,
                      color: Colors.black,
                    ),
                  ),
                ),
              mealStrAreaNull ? const SizedBox.shrink() : horizontalSpace(8),
              mealStrAreaNull
                  ? const SizedBox.shrink()
                  : Container(
                      width: 3,
                      height: 20,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
              mealStrAreaNull ? const SizedBox.shrink() : horizontalSpace(8),
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
    );
  }
}

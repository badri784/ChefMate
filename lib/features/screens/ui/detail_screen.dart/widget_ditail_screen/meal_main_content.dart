import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/core/model/food_model/meals.dart';

class MealMainContent extends StatelessWidget {
  final Meal meal;

  const MealMainContent({super.key, required this.meal});

  Widget _buildTag(String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xffE2DFDB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: const Color(0xff555555),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color bgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: GoogleFonts.inter(
              color: const Color(0xff1A202C),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  List<String?> get ingredients => [
    meal.strIngredient1,
    meal.strIngredient2,
    meal.strIngredient3,
    meal.strIngredient4,
    meal.strIngredient5,
    meal.strIngredient6,
    meal.strIngredient7,
    meal.strIngredient8,
    meal.strIngredient9,
    meal.strIngredient10,
    meal.strIngredient11,
    meal.strIngredient12,
    meal.strIngredient13,
    meal.strIngredient14,
    meal.strIngredient15,
    meal.strIngredient16,
    meal.strIngredient17,
    meal.strIngredient18,
    meal.strIngredient19,
    meal.strIngredient20,
  ];
  List<Widget> get _buildIngredientsList {
    List<Widget> widgets = [];
    final measures = [
      meal.strMeasure1,
      meal.strMeasure2,
      meal.strMeasure3,
      meal.strMeasure4,
      meal.strMeasure5,
      meal.strMeasure6,
      meal.strMeasure7,
      meal.strMeasure8,
      meal.strMeasure9,
      meal.strMeasure10,
      meal.strMeasure11,
      meal.strMeasure12,
      meal.strMeasure13,
      meal.strMeasure14,
      meal.strMeasure15,
      meal.strMeasure16,
      meal.strMeasure17,
      meal.strMeasure18,
      meal.strMeasure19,
      meal.strMeasure20,
    ];

    for (int i = 0; i <20; i++) {
      if (ingredients[i] != null && ingredients[i]!.trim().isNotEmpty) {
        widgets.add(
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF0EAE5)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2EEE9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.adjust,
                    color: Color(0xff6C6C6C),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    ingredients[i]!,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color(0xff2D3748),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  measures[i] ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xff718096),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 310,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          children: [
            // Title
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 26,
                fontFamily: 'Bobbers',
                fontWeight: FontWeight.bold,
                color: Color(0xff1A202C),
              ),
              child: AnimatedTextKit(
                displayFullTextOnTap: true,
                pause: const Duration(seconds: 2),
                animatedTexts: [
                  TyperAnimatedText(" ${meal.strMeal ?? 'Unknown Meal'}"),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Tags and Rating
            Row(
              children: [
                _buildTag(meal.strCategory ?? 'Category'),
                const SizedBox(width: 10),
                _buildTag(meal.strArea ?? 'Area'),
                const Spacer(),
                const Icon(Icons.star, color: Color(0xffD49321), size: 22),
                const SizedBox(width: 5),
                Text(
                  '4.8 (1.2k)',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Info Cards (Cook Time, Calories)
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.access_time,
                    title: 'Cook Time',
                    value: '25 min',
                    bgColor: const Color(0xffF9EFEA),
                    iconColor: const Color(0xffA84C22),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.restaurant,
                    title: 'Calories',
                    value: '420 kcal',
                    bgColor: const Color(0xffEFF5F1),
                    iconColor: const Color(0xff4CAF50),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Ingredients Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1A202C),
                  ),
                ),
                Text(
                  '${ingredients.length} servings',
                  style: GoogleFonts.inter(
                    color: const Color(0xffB14418),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Ingredients List
            ..._buildIngredientsList,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black38),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meal.strInstructions!,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

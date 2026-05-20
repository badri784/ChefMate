import 'package:flutter/material.dart';
import 'package:food_app/core/model/food_model/meals.dart';

import 'widget_ditail_screen/detail_bottom_nav_bar.dart';
import 'widget_ditail_screen/detail_top_bar.dart';
import 'widget_ditail_screen/meal_background_image.dart';
import 'widget_ditail_screen/meal_main_content.dart';
import 'widget_ditail_screen/play_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MealBackgroundImage(meal: meal),
          DetailTopBar(meal: meal),
          MealMainContent(meal: meal),
          PlayButton(youtubeUrl: meal.strYoutube),
        ],
      ),
      bottomNavigationBar: const DetailBottomNavBar(),
    );
  }
}

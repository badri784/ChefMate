import 'package:flutter/material.dart';
import '../../../../../core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingMealsHeader extends StatelessWidget {
  const TrendingMealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Trending Meals',
      style: GoogleFonts.montserrat(
        fontWeight: FontWeightManger.fontWeightSemiBold,
        fontSize: 20,
      ),
    );
  }
}

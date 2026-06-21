import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theme/font_weight.dart';

class MealTimeAndDifficulty extends StatelessWidget {
  final String time;
  const MealTimeAndDifficulty({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.query_builder),
        horizontalSpace(4),
        Text(
          time,
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
    );
  }
}

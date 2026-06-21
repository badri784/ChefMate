import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/theme/font_weight.dart';

class MealCategoryTags extends StatelessWidget {
  final String category;
  final String area;
  const MealCategoryTags({
    super.key,
    required this.category,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [_buildTag(category), _buildTag(area)]);
  }

  Widget _buildTag(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Color(0xffeae7e7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontWeight: FontWeightManger.fontWeightMedium,
          fontSize: 12,
        ),
      ),
    );
  }
}

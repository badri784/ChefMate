import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

/// A single stat column (value + label) displayed in the profile stats row.
class ProfileStatItem extends StatelessWidget {
  const ProfileStatItem({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeightManger.fontWeightBold,
            color: const Color(0xFFFF5722),
          ),
        ),
        verticalSpace(4),
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeightManger.fontWeightMedium,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

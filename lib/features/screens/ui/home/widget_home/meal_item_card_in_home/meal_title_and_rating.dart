import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/theme/font_weight.dart';

class MealTitleAndRating extends StatelessWidget {
  final String title;
  final String rating;
  const MealTitleAndRating({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
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
                rating,
                style: GoogleFonts.inter(
                  fontWeight: FontWeightManger.fontWeightMedium,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

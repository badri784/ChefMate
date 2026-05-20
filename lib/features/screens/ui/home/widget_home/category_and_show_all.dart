import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/font_weight.dart';

class CategoryAndShowAll extends StatelessWidget {
  const CategoryAndShowAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Category',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeightManger.fontWeightSemiBold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Show All',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xffb02f00),
              fontWeight: FontWeightManger.fontWeightNormal,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBottomNavBar extends StatelessWidget {
  const DetailBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
        bottom: MediaQuery.of(context).padding.bottom + 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB53C04),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.add_circle_outline),
              label: Text(
                'Add to Meal Plan',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF2C8B9)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff4A4A4A),
            ),
          ),
        ],
      ),
    );
  }
}

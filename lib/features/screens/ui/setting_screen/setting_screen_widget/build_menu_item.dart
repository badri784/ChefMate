import 'package:flutter/material.dart';
import 'package:food_app/core/theme/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

/// A single menu-row used in the profile screen's settings list.
///
/// Shows an icon badge, a title, and an optional trailing arrow.
/// When [isLogout] is `true` the title is rendered in red and the
/// trailing arrow is hidden.
class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    this.isLogout = false,
  });

  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: borderRadius,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: .06),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: .1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          title: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeightManger.fontWeightSemiBold,
              color: isLogout ? Colors.red : Colors.black87,
            ),
          ),
          trailing: isLogout
              ? null
              : const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          onTap: onTap,
        ),
      ),
    );
  }
}

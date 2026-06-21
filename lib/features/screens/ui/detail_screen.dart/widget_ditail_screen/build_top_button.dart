import 'package:flutter/material.dart';

class BuildTopButton extends StatelessWidget {
  const BuildTopButton({super.key, this.onTap, this.icon, this.color});
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }
}

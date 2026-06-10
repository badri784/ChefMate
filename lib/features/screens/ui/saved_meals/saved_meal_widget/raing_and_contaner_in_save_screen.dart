import 'package:flutter/material.dart';

class RatingAndContainerWidgetInSaveScreen extends StatelessWidget {
  const RatingAndContainerWidgetInSaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 15,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xff7c7d7a).withValues(alpha: .5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(Icons.star, color: Colors.white),
            Text('4.5', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

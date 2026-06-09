import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';

class MealsLoadingView extends StatelessWidget {
  const MealsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Loading Your Meals...',
          style: TextStyle(
            fontSize: 18,
            color: ColorScheme.of(context).onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(16),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

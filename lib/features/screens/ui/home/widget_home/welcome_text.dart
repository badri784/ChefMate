import 'package:flutter/material.dart';
import '../../../../../core/theme/font_weight.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Discover your next \nfavorite meal',
      style: TextStyle(
        fontSize: 26,
        color: ColorScheme.of(context).onSurface,
        fontWeight: FontWeightManger.fontWeightBold,
      ),
    );
  }
}

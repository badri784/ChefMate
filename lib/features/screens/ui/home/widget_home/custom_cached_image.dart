import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/model/food_model/meals.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    this.hightMeal,
    super.key,
    required this.meal,
    this.hight,
    this.width,
    this.imageUrl,
    this.boxFit,
    this.widthmeal,
  });
  final double? hight;
  final double? width;
  final String? imageUrl;
  final BoxFit? boxFit;
  final Meal meal;
  final double? hightMeal;
  final double? widthmeal;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widthmeal,
      height: hightMeal,
      imageUrl: imageUrl ?? '',
      fadeInDuration: const Duration(milliseconds: 100),
      placeholder: (context, url) => SizedBox(
        height: 300,
        child: Image.asset(
          'assets/image/loading_gray.gif',
          height: hight,
          width: width,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: boxFit ?? BoxFit.cover,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/core/helpers/extension.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, dynamic>> get _categories => [
    {'name': 'Beef', 'icon': Icons.lunch_dining},
    {'name': 'Chicken', 'icon': Icons.egg_alt},
    {'name': 'Seafood', 'icon': Icons.set_meal},
    {'name': 'Vegetarian', 'icon': Icons.eco},
    {'name': 'Lamb', 'icon': Icons.kebab_dining},
    {'name': 'Side', 'icon': Icons.tapas},
    {'name': 'Starter', 'icon': Icons.soup_kitchen},
    {'name': 'Dessert', 'icon': Icons.cake},
    {'name': 'Pork', 'icon': Icons.restaurant},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, _) => horizontalSpace(20),
        itemCount: _categories.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            context.pushnamed(
              Routes.categoryDetail,
              arguments: _categories[index]['name'],
            );
          },
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  _categories[index]['icon'],
                  color: Colors.black87,
                  size: 32,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _categories[index]['name'],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/features/screens/ui/saved_meals/saved_meal_widget/saved_bloc_builder.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeae7e7),
      appBar: AppBar(
        backgroundColor: const Color(0xffeae7e7),
        surfaceTintColor: Colors.transparent,
        title: const Text('Saved Dishes'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const SavedBlocBuilder(),
    );
  }
}

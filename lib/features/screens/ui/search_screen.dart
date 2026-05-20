import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'package:food_app/features/screens/ui/home/widget_home/trending_meals_bloc_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSearch(String name) async {
      await context.read<AppStateCubit>().searchByName(name);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                onSearch(value);
              },
              enabled: true,
              enableSuggestions: true,

              controller: searchController,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 8, 6, 143),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Search for meals...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(child: TrendingMealsBlocBuilder()),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/food_meal_category/app_state_cubit.dart';
import '../../../../../core/helpers/spacing.dart';

class TextFeildSearch extends StatefulWidget {
  const TextFeildSearch({super.key});

  @override
  State<TextFeildSearch> createState() => _TextFeildSearchState();
}

class _TextFeildSearchState extends State<TextFeildSearch> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSearch(String name) async {
      await context.read<AppStateCubit>().searchByName(name);
      log('search meal in home screen: ${searchController.text}');
    }

    return Row(
      children: [
        verticalSpace(10),
        Expanded(
          child: TextField(
            onChanged: (value) {
              onSearch(value);
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search For Recipes',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Color(0xffb02f00),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/save_meal_cubit/savemeal_cubit.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'meal_item_card.dart';

import '../../../../../core/routing/routes.dart';

class TrendingMealsBlocBuilder extends StatelessWidget {
  const TrendingMealsBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppStateCubit, AppStateState>(
      listener: (context, state) {
        if (state is AppStateError) {
          if (state.errorMessage == 'timeout') {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Connection Timeout'),
                content: const Text(
                  'Please check your internet connection and try again.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final cubit = context.read<AppStateCubit>();
                      if (cubit.lastFetchedChar != null) {
                        cubit.getMeals(cubit.lastFetchedChar!);
                      }
                    },
                    child: const Text('Okay'),
                  ),
                ],
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.grey,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                dismissDirection: DismissDirection.startToEnd,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        if (state is AppStateInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AppStateNoMealsFound) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        }
        if (state is AppStateLoading) {
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
        if (state is AppStateSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.foodModel.meals.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onDoubleTap: () {
                  context.read<SavemealCubit>().toggleFavorite(
                    state.foodModel.meals[index],
                  );
                },
                onTap: () {
                  context.pushnamed(
                    Routes.detailScreen,
                    arguments: state.foodModel.meals[index],
                  );
                },
                child: MealItemCard(meal: state.foodModel.meals[index]),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

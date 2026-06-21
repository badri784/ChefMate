import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'meals_initial_view.dart';
import 'meals_loading_view.dart';
import 'meals_not_found_view.dart';
import 'meals_success_list_view.dart';

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
          return const SliverToBoxAdapter(child: MealsInitialView());
        }
        if (state is AppStateNoMealsFound) {
          return SliverToBoxAdapter(
            child: MealsNotFoundView(message: state.errorMessage),
          );
        }
        if (state is AppStateLoading) {
          return const SliverToBoxAdapter(child: MealsLoadingView());
        }
        if (state is AppStateSuccess) {
          return MealsSuccessListView(foodModel: state.foodModel);
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

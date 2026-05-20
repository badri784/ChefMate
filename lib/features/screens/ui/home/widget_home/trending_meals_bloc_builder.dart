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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AppStateInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        // if (state is AppStateError) {
        //   return Container(
        //     padding: const EdgeInsets.all(15),
        //     margin: const EdgeInsets.symmetric(horizontal: 20),
        //     decoration: BoxDecoration(
        //       color: Colors.black,
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     height: 100,
        //     child: Center(
        //       child: Text(
        //         state.errorMessage.toString(),
        //         style: const TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   );
        // }
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

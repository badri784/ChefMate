import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/logic/cubit/food_meal_category/app_state_cubit.dart';
import 'detail_screen.dart';

class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        if (state is AppStateLoading || state is AppStateInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AppStateSuccess) {
          if (state.foodModel.meals.isNotEmpty) {
            return DetailScreen(meal: state.foodModel.meals.first);
          } else {
            return const Scaffold(body: Center(child: Text('Meal not found')));
          }
        } else if (state is AppStateError) {
          return Scaffold(body: Center(child: Text(state.errorMessage)));
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

part of 'meal_detail_screen_cubit.dart';

sealed class MealDetailScreenState {}

final class MealDetailScreenInitial extends MealDetailScreenState {}

final class MealDetailScreenLoading extends MealDetailScreenState {}

final class MealDetailScreenSuccess extends MealDetailScreenState {
  MealDetailScreenSuccess();
}

final class MealDetailScreenError extends MealDetailScreenState {
  final String errorMessage;
  MealDetailScreenError({required this.errorMessage});
}

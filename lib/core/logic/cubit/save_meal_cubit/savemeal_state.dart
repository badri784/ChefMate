part of 'savemeal_cubit.dart';

sealed class SavemealState {}

final class SavemealInitial extends SavemealState {}

final class SavemealSuccess extends SavemealState {
  final List<Meal> meals;
  SavemealSuccess({required this.meals});
}

part of 'app_state_cubit.dart';

sealed class AppStateState {}

final class AppStateInitial extends AppStateState {}

final class AppStateLoading extends AppStateState {}

final class AppStateSuccess extends AppStateState {
  final FoodModel foodModel;
  AppStateSuccess(this.foodModel);
}

final class AppStateError extends AppStateState {
  final String errorMessage;
  AppStateError(this.errorMessage);
}

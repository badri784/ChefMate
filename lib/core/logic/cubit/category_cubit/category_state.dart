part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final CategoryMeals category;
  CategorySuccess(this.category);
}

final class CategoryError extends CategoryState {
  final String errorMessage;
  CategoryError(this.errorMessage);
}

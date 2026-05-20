import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/model/category/category_meals.dart';

import '../../../networking/repo/my_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.myRepo) : super(CategoryLoading());
  final MyRepo myRepo;
  Future<void> getCategory(String category) async {
    try {
      emit(CategoryLoading());
      final CategoryMeals responseCategory = await myRepo.getCategory(category);
      emit(CategorySuccess(responseCategory));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}

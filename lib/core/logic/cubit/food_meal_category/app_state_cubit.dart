import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import '../../../model/food_model/food_model.dart';
import '../../../networking/repo/my_repo.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit(this.myRepo) : super(AppStateInitial());
  final MyRepo myRepo;
  List<Meal> searchedMealList = [];
  String? lastFetchedChar;

  // search by first letter
  Future<void> getMeals(String firstChar) async {
    try {
      lastFetchedChar = firstChar;
      emit(AppStateLoading());
      final FoodModel response = await myRepo.getMeals(firstChar);
      searchedMealList = response.meals;
      emit(AppStateSuccess(response));
    } catch (e) {
      if (e is DioException &&
          (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout)) {
        emit(AppStateError('timeout'));
      } else {
        emit(AppStateError(e.toString()));
      }
    }
  }

  // search by Id
  Future<void> searchByIdGetIt(String id) async {
    try {
      emit(AppStateLoading());
      final FoodModel response = await myRepo.searchById(id);
      emit(AppStateSuccess(response));
    } catch (e) {
      emit(AppStateError(e.toString()));
    }
  }

  // search by name from searched list
  Future<void> searchByName(String searchMealName) async {
    try {
      emit(AppStateLoading());
      final searchMealByName = searchedMealList.where(
        (meal) =>
            meal.strMeal!.toLowerCase().contains(searchMealName.toLowerCase()),
      );
      if (searchMealByName.isNotEmpty) {
        emit(AppStateSuccess(FoodModel(meals: searchMealByName.toList())));
      } else {
        emit(AppStateError('No meals found'));
      }
    } catch (e) {
      emit(AppStateError(e.toString()));
    }
  }
}

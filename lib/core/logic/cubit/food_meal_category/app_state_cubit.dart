import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/food_model/food_model.dart';
import '../../../networking/repo/my_repo.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit(this.myRepo) : super(AppStateInitial());
  final MyRepo myRepo;
  // List<Meal> savedMeals = [];
  // bool isFavorite = false;
  // void addToFavorite(Meal meal) {
  //   savedMeals.add(meal);
  //   isFavorite = true;
  //   emit(AppStateSuccess(FoodModel(meals: savedMeals)));
  // }

  // void removeFromFavorite(Meal meal) {
  //   savedMeals.remove(meal);
  //   isFavorite = false;
  //   emit(AppStateSuccess(FoodModel(meals: savedMeals)));
  // }

  Future<void> getMeals(String firstChar) async {
    try {
      emit(AppStateLoading());
      final FoodModel response = await myRepo.getMeals(firstChar);
      emit(AppStateSuccess(response));
    } catch (e) {
      emit(AppStateError(e.toString()));
    }
  }

  Future<void> searchById(String id) async {
    try {
      emit(AppStateLoading());
      final FoodModel response = await myRepo.searchById(id);
      log('id::::::::::::::::::::::::::::::::::::::::::::::::::::::::::; $id');
      emit(AppStateSuccess(response));
    } catch (e) {
      emit(AppStateError(e.toString()));
    }
  }
}

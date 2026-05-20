import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/model/food_model/meals.dart';

part 'savemeal_state.dart';

class SavemealCubit extends Cubit<SavemealState> {
  SavemealCubit() : super(SavemealInitial());
  List<Meal> savedMeals = [];
  bool isFavorite = false;

  void toggleFavorite(Meal meal) {
    final isExisting = savedMeals.any((element) => element.idMeal == meal.idMeal);
    
    if (isExisting) {
      savedMeals.removeWhere((element) => element.idMeal == meal.idMeal);
    } else {
      savedMeals.add(meal);
    }
    
    // Emit a new state with the updated list
    emit(SavemealSuccess(meals: List.from(savedMeals)));
  }

  bool isMealSaved(String? idMeal) {
    if (idMeal == null) return false;
    return savedMeals.any((element) => element.idMeal == idMeal);
  }
}

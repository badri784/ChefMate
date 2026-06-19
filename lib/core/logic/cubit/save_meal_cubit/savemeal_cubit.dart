import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:food_app/core/local_storage/hive_service.dart';
import 'package:share_plus/share_plus.dart';

part 'savemeal_state.dart';

class SavemealCubit extends Cubit<SavemealState> {
  SavemealCubit() : super(SavemealInitial()) {
    _loadSavedMeals();
  }

  List<Meal> savedMeals = [];

  void _loadSavedMeals() {
    savedMeals = HiveService.getSavedMeals();
    emit(SavemealSuccess(meals: List.from(savedMeals)));
  }

  void toggleFavorite(Meal meal) {
    final isExisting = savedMeals.any(
      (element) => element.idMeal == meal.idMeal,
    );

    if (isExisting) {
      savedMeals.removeWhere((element) => element.idMeal == meal.idMeal);
      if (meal.idMeal != null) {
        HiveService.removeMeal(meal.idMeal!);
      }
    } else {
      savedMeals.add(meal);
      HiveService.saveMeal(meal);
    }
    // Emit a new state with the updated list
    emit(SavemealSuccess(meals: List.from(savedMeals)));
  }

  bool isMealSaved(String? idMeal) {
    if (idMeal == null) return false;
    return savedMeals.any((element) => element.idMeal == idMeal);
  }

  Future<void> shareMealVideo(Meal meal) async {
    if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty) {
      try {
        await Share.share('Meal video Link: ${meal.strYoutube!}');
        emit(SavemealSuccess(meals: List.from(savedMeals)));
      } catch (e) {
        emit(SavemealError(errorMessage: 'Could not share the video'));
      }
    } else {
      emit(SavemealError(errorMessage: 'No video found for this meal'));
    }
  }
}

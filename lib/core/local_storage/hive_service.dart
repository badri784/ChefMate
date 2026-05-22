import 'package:hive_ce/hive.dart';
import 'package:food_app/core/model/food_model/meals.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static const String _boxName = 'saved_meals_box';

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(MealAdapter());
    await Hive.openBox<Meal>(_boxName);
  }

  static Box<Meal> get _box => Hive.box<Meal>(_boxName);

  static Future<void> saveMeal(Meal meal) async {
    if (meal.idMeal != null) {
      await _box.put(meal.idMeal, meal);
    }
  }

  static Future<void> removeMeal(String id) async {
    await _box.delete(id);
  }

  static List<Meal> getSavedMeals() {
    return _box.values.toList();
  }
}

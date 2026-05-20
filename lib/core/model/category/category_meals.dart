import 'package:json_annotation/json_annotation.dart';

import 'package:food_app/core/model/category/category_model.dart';
part 'category_meals.g.dart';

@JsonSerializable()
class CategoryMeals {
  final List<CategoryModel> meals;
  CategoryMeals({required this.meals});
  factory CategoryMeals.fromJson(Map<String, dynamic> json) =>
      _$CategoryMealsFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryMealsToJson(this);
}

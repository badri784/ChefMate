import 'meals.dart';
import 'package:json_annotation/json_annotation.dart';
part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  FoodModel({required this.meals});
  @JsonKey(name: 'meals')
  final List<Meal> meals;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}

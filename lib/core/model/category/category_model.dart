import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;
  String? strArea;
  String? strCountry;
  CategoryModel({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
    this.strArea,
    this.strCountry,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

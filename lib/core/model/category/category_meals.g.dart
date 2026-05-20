// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMeals _$CategoryMealsFromJson(Map<String, dynamic> json) =>
    CategoryMeals(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryMealsToJson(CategoryMeals instance) =>
    <String, dynamic>{'meals': instance.meals};

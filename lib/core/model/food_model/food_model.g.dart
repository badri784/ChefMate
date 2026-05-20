// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
  meals: (json['meals'] as List<dynamic>)
      .map((e) => Meal.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
  'meals': instance.meals,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      strMeal: json['strMeal'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      idMeal: json['idMeal'] as String?,
      strArea: json['strArea'] as String?,
      strCountry: json['strCountry'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
      'strArea': instance.strArea,
      'strCountry': instance.strCountry,
    };

import 'dart:developer';
import 'package:food_app/core/model/category/category_meals.dart';

import '../../model/food_model/food_model.dart';
import '../web_services/web_services.dart';

class MyRepo {
  MyRepo(this.webServices);
  final WebServices webServices;
  Future<FoodModel> getMeals(String firstChar) async {
    try {
      final response = await webServices.getMeals(firstChar);
      return response;
    } catch (e) {
      log('error get meals in my repo  : ${e.toString()}');
      rethrow;
    }
  }

  Future<CategoryMeals> getCategory(String category) async {
    try {
      final response = await webServices.getCategory(category);
      return response;
    } catch (e) {
      log('error get category in my repo : ${e.toString()}');
      rethrow;
    }
  }

  Future<FoodModel> searchById(String id) async {
    try {
      final response = await webServices.searchById(id);
      return response;
    } catch (e) {
      log('error search by id in my repo : ${e.toString()}');
      rethrow;
    }
  }

  // Future<CategoryModel> getMealsByCategory(String category) async {
  //   try {
  //     final CategoryModel response = await webServices.getCategory(category);
  //     log('resposnse: ${response.toString()}');
  //     return response;
  //   } catch (e) {
  //     log('error: ${e.toString()}');
  //     rethrow;
  //   }
  // }
}

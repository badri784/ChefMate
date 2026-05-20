import 'package:dio/dio.dart';
import 'package:food_app/core/model/category/category_meals.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/food_model/food_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  // search by first char to get meal every time i open the app to show random meal for user
  @GET('search.php')
  Future<FoodModel> getMeals(@Query('f') String firstChar);
  // search by category to get meals in this category
  @GET('filter.php')
  Future<CategoryMeals> getCategory(@Query('c') String category);
  // search by Id to get meal details
  @GET('lookup.php')
  Future<FoodModel> searchById(@Query('i') String id);
  // search by name to get meals by name
  @GET('search.php')
  Future<FoodModel> searchByName(@Query('s') String name);
}

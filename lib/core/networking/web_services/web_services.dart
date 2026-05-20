import 'package:dio/dio.dart';
import 'package:food_app/core/model/category/category_meals.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../model/food_model/food_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  // search by name
  @GET('search.php')
  Future<FoodModel> getMeals(@Query('f') String firstChar);
  // search by category
  @GET('filter.php')
  Future<CategoryMeals> getCategory(@Query('c') String category);
  // search by Id
  @GET('lookup.php')
  Future<FoodModel> searchById(@Query('i') String id);
}

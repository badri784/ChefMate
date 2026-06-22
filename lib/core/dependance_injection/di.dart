// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_app/core/networking/login_service/login_repo.dart';
import 'package:food_app/core/networking/login_service/login_service.dart';
import 'package:food_app/core/networking/repo/my_repo.dart';
import 'package:food_app/core/networking/web_services/web_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependanceInjection() async {
  Dio dio = Dio();

  getIt.registerLazySingleton<WebServices>(() => WebServices(dio));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<LoginService>(() => LoginRepo());

  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  // dio.interceptors.add(
  //   LogInterceptor(
  //     requestBody: true,
  //     request: true,
  //     responseBody: true,
  //     responseHeader: true,
  //     error: true,
  //     requestHeader: true,
  //     logPrint: (object) {
  //       log('object Dio Log :${object.toString()}');
  //     },
  //   ),
  // );
}

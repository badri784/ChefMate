import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/cubit/bloc_observer.dart';
import 'package:food_app/firebase_options.dart';

import 'core/dependance_injection/di.dart';
import 'core/local_storage/hive_service.dart';
import 'food_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await HiveService.init();
  Bloc.observer = SimbleBlocObserver();
  await setupDependanceInjection();
  runApp(MyApp());
}

import 'package:flutter/material.dart';

import 'core/dependance_injection/di.dart';
import 'core/local_storage/hive_service.dart';
import 'food_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  setupDI();
  // debugPrintRebuildDirtyWidgets = true;
  runApp(MyApp());
}
